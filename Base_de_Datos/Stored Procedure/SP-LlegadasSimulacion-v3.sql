USE [ProyectoFinal_BD]
GO
/****** Object:  StoredProcedure [dbo].[SPLlegadasSimulacion]    Script Date: 3/2/2021 14:42:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



ALTER        PROCEDURE [dbo].[SPLlegadasSimulacion]
		@tablaLlegadas [dbo].[LlegadaDeEtapas] READONLY
		

AS 
BEGIN 	
	DECLARE @id INT
	DECLARE @idCarrera INT
	DECLARE @idCorredor INT
	DECLARE @horaFin TIME(0)
	DECLARE @idGiro INT
	DECLARE @codigoInstacia VARCHAR(50)


	DECLARE @idMenor INT
	DECLARE @idMayor INT

	DECLARE @tablaOrdenada TABLE (id INT IDENTITY(1,1), idCarrera INT, idCorredor INT, horaFin TIME(0), idGiro INT, codigoInstancia VARCHAR(50))

	DECLARE @cantidadPuntos INT
	DECLARE @idEtapa INT
	DECLARE @tiempoSumar INT
	DECLARE @puntosGanados INT
	DECLARE @variableTiempoAux TIME(0)

	SELECT @variableTiempoAux = '00:00:00'
	SET NOCOUNT ON;
	BEGIN TRY


		INSERT @tablaOrdenada
			(
				 
				 idCarrera
				,idCorredor
				,horaFin
				,idGiro
				,codigoInstancia
			)
		SELECT
			 
			 tb.idCarrera
			,tb.idCorredor
			,tb.horaFin
			,tb.idGiro
			,tb.codigoInstancia
		FROM 
			@tablaLlegadas tb
		ORDER BY
			horaFin

			BEGIN TRANSACTION
		INSERT INTO [Llegada]
			(
				 IdCarrera
				,IdCorredor
				,HoraFin
			)
		SELECT
			 idCarrera
			,idCorredor
			,horaFin
		FROM
			@tablaOrdenada

	END TRY
	BEGIN CATCH
		EXEC [dbo].[SPManejoDeErrores] @ErrorLogId = 0 ,@CodigoDeError = 50026, @Descripcion = 'ERROR al rellenar tablaOrdenada. [dbo].[SPLlegadasSimulacion])'
		--RETURN @@ERROR;
	END CATCH
		SELECT 
			 @idMenor = MIN(id)
			,@idMayor = MAX(id) 
		FROM 
			@tablaOrdenada
		
		WHILE @idMenor <= @idMayor
			BEGIN
				BEGIN TRY
					SELECT 
						 @idCarrera = TOR.idCarrera
						,@idCorredor = TOR.idCorredor
						,@horaFin = TOR.horaFin
						,@idGiro = TOR.idGiro
						,@codigoInstacia = TOR.codigoInstancia

					
					FROM 
						@tablaOrdenada TOR
				
					WHERE TOR.id = @idMenor;
				
					SELECT @idEtapa = CA.IdEtapa FROM [Carrera] CA WHERE CA.Id = @idCarrera

					SELECT @cantidadPuntos = E.Puntos FROM Etapa E WHERE E.Id = @idEtapa AND E.IdGiro = @idGiro	

	
				
					
					--Obtenemos los segundos de diferencia para después sumarlos.
					SELECT @tiempoSumar = DATEDIFF(ss,CA.HoraIncio,@horaFin) FROM Carrera CA WHERE CA.Id = @idCarrera
					
					

				END TRY
				BEGIN CATCH
					EXEC [dbo].[SPManejoDeErrores] @ErrorLogId = 0 ,@CodigoDeError = 50027, @Descripcion = 'ERROR al iniciar variables de tablaOrdenada. [dbo].[SPLlegadasSimulacion])'
					--RETURN @@ERROR;
				END CATCH

				IF @idMenor > @cantidadPuntos 
					BEGIN
						SELECT @puntosGanados = 0
					END
				ELSE
					BEGIN
						SELECT @puntosGanados = @cantidadPuntos - @idMenor + 1
					END

				BEGIN TRY
					
					UPDATE 
						IGEC
					SET
						 SumaTiempo = DATEADD(ss,@tiempoSumar,SumaTiempo)-- + @tiempoSumar
						,SumaPuntosRegularidad = SumaPuntosRegularidad + @puntosGanados

					FROM [InstaciaDeGiroPorEquipoPorCorredor] IGEC
					INNER JOIN [InstanciaDeGiroPorEquipo] IGE ON IGE.CodigoInstanciaGiro = @codigoInstacia
					WHERE
						IGEC.IdCorredor = @idCorredor AND IGEC.IdInstanciaDeGiroPorEquipo = IGE.Id
					
					UPDATE 
						IGE
					SET
						 TotalTiempo = DATEADD(ss,@tiempoSumar,TotalTiempo) --+@tiempoSumar
						,TotalPuntos = TotalPuntos + @puntosGanados
					FROM 
						[InstanciaDeGiroPorEquipo] IGE
					INNER JOIN [Giro] G ON G.Id = @idGiro
					INNER JOIN [InstanciaGiro] IG ON IG.CodigoInstacia = @codigoInstacia AND IG.IdGiro = G.Id				
					INNER JOIN [InstaciaDeGiroPorEquipoPorCorredor] IGEC ON IGEC.IdCorredor = @idCorredor AND IGEC.IdInstanciaDeGiroPorEquipo = IGE.Id AND IGE.IdInstanciaGiro = IG.Id
					WHERE 
						IGE.CodigoInstanciaGiro = IG.CodigoInstacia AND IGEC.IdInstanciaDeGiroPorEquipo = IGE.Id
				END TRY
				BEGIN CATCH
					EXEC [dbo].[SPManejoDeErrores] @ErrorLogId = 0 ,@CodigoDeError = 50028, @Descripcion = 'ERROR al realizar los updates. [dbo].[SPLlegadasSimulacion])'
					--RETURN @@ERROR;
				END CATCH	

				BEGIN TRY
					INSERT INTO [MovimientosPuntosRegular]
						(
							 IdTipoMovimientoPuntosRegular
							,IdInstanciaDeGiroPorEquipoPorCorredor
							,IdLlegada
							,CantidadPuntos
							,Fecha
						)
					SELECT
							  1
							 ,IGEC.Id
							 ,Lle.Id
							 ,@puntosGanados
							 ,CA.Fecha
							
					FROM 
						@tablaOrdenada TOR
					INNER JOIN [Carrera] CA ON CA.Id = idCarrera
					INNER JOIN [Llegada] Lle ON Lle.IdCarrera = @idCarrera AND Lle.IdCorredor = @idCorredor
					INNER JOIN [InstanciaGiro] IG ON IG.CodigoInstacia = @codigoInstacia
					INNER JOIN [InstanciaDeGiroPorEquipo] IGE ON IGE.CodigoInstanciaGiro = IG.CodigoInstacia
					INNER JOIN [InstaciaDeGiroPorEquipoPorCorredor] IGEC ON IGEC.IdCorredor = @idCorredor AND IGEC.IdInstanciaDeGiroPorEquipo = IGE.Id

					--INNER JOIN [InstanciaDeGiroPorEquipo] IGE ON IGE.CodigoInstanciaGiro = @codigoInstacia
					WHERE
						IGEC.IdCorredor = @idCorredor AND IGEC.IdInstanciaDeGiroPorEquipo = IGE.Id
						
						AND TOR.id = @idMenor             --AND IGEC.IdInstanciaDeGiroPorEquipo = IGE.Id
						
					
					INSERT INTO [MovimientosTiempo]
						(
							 IdTipoMovimientoTiempo
							,IdInstanciaDeGiroPorEquipoPorCorredor
							,IdLlegada
							,CantidadDeTiempo
							,Fecha
						)
					SELECT
							  2
							 ,IGEC.Id
							 ,Lle.Id
							 ,DATEADD(ss,@tiempoSumar,@variableTiempoAux)
							 ,CA.Fecha
							
					FROM 
						@tablaOrdenada TOR
					INNER JOIN [Carrera] CA ON CA.Id = idCarrera
					INNER JOIN [Llegada] Lle ON Lle.IdCarrera = @idCarrera AND Lle.IdCorredor = @idCorredor
					INNER JOIN [InstanciaGiro] IG ON IG.CodigoInstacia = @codigoInstacia
					INNER JOIN [InstanciaDeGiroPorEquipo] IGE ON IGE.CodigoInstanciaGiro = IG.CodigoInstacia
					INNER JOIN [InstaciaDeGiroPorEquipoPorCorredor] IGEC ON IGEC.IdCorredor = @idCorredor AND IGEC.IdInstanciaDeGiroPorEquipo = IGE.Id
					WHERE
						IGEC.IdCorredor = @idCorredor AND IGEC.IdInstanciaDeGiroPorEquipo = IGE.Id
						
						AND TOR.id = @idMenor             


				END TRY
				BEGIN CATCH
					EXEC [dbo].[SPManejoDeErrores] @ErrorLogId = 0 ,@CodigoDeError = 50029, @Descripcion = 'ERROR al realizar los Insert. [dbo].[SPLlegadasSimulacion])'
					--RETURN @@ERROR;
				END CATCH		
				

				SET @idMenor = @idMenor + 1
			
			END
			COMMIT TRANSACTION

	SET NOCOUNT OFF;
	
END

--DECLARE @tiempoSuma INT
--DECLARE @hora1 TIME(0)
--DECLARE @hora2 TIME(0)
--DECLARE @nuevoTiempo TIME(0)


--SELECT @hora1 = '09:10:10'
--SELECT @hora2 = '10:12:25'

--SELECT @tiempoSuma = DATEDIFF(ss,@hora1,@hora2)

--PRINT(@tiempoSuma)
--SELECT @nuevoTiempo = '00:00:00'

--PRINT(@nuevoTiempo)
--SELECT @nuevoTiempo = DATEADD(ss,@tiempoSuma,@nuevoTiempo)
--PRINT(@nuevoTiempo)

--SELECT @tiempoSumar = DATEDIFF(ss,CA.HoraIncio,@horaFin) FROM Carrera CA WHERE CA.Id = @idCarrera