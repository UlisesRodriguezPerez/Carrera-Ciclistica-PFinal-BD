USE [ProyectoFinal_BD]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE OR ALTER      PROCEDURE [dbo].[SPLlegadasSimulacion]
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
	DECLARE @tiempoSumar TIME(0)
	DECLARE @puntosGanados INT

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
		--SELECT * FROM @tablaOrdenada
		--SELECT * FROM [Llegada]
	END TRY
	BEGIN CATCH
		EXEC [dbo].[SPManejoDeErrores] @ErrorLogId = 0 ,@CodigoDeError = 50026, @Descripcion = 'ERROR al rellenar tablaOrdenada. [dbo].[SPLlegadasSimulacion])'
		--RETURN @@ERROR;
	END CATCH
		SELECT @idMenor = min([id]), @idMayor=max([id]) FROM @tablaOrdenada
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

					--SELECT * FROM @tablaOrdenada
				
					--SELECT @tiempoSumar = @horaFin - CA.HoraIncio FROM Carrera CA WHERE CA.Id = @idCarrera
					
					

				END TRY
				BEGIN CATCH
					EXEC [dbo].[SPManejoDeErrores] @ErrorLogId = 0 ,@CodigoDeError = 50027, @Descripcion = 'ERROR al iniciar variables de tablaOrdenada. [dbo].[SPLlegadasSimulacion])'
					--RETURN @@ERROR;
				END CATCH

				IF @idMenor > @cantidadPuntos 
					BEGIN
						SET @puntosGanados = 0
					END
				ELSE
					BEGIN
						SELECT @puntosGanados = @cantidadPuntos - @idMenor + 1
					END

				BEGIN TRY
					--BEGIN TRANSACTION
					UPDATE 
						[InstaciaDeGiroPorEquipoPorCorredor]
					SET
						 SumaTiempo = SumaTiempo-- + @tiempoSumar
						,SumaPuntosRegularidad = SumaPuntosRegularidad + @puntosGanados
					WHERE
						IdCorredor = @idCorredor
					
					UPDATE 
						IGE
					SET
						 TotalTiempo = TotalTiempo --+@tiempoSumar
						,TotalPuntos = TotalPuntos + @puntosGanados
					FROM 
						[InstanciaDeGiroPorEquipo] IGE

					INNER JOIN [InstanciaGiro] IG ON IG.CodigoInstacia = @codigoInstacia					
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
						@tablaOrdenada 
					INNER JOIN [Carrera] CA ON CA.Id = idCarrera
					INNER JOIN [Llegada] Lle ON Lle.IdCarrera = @idCarrera AND Lle.IdCorredor = @idCorredor
					INNER JOIN [InstanciaGiro] IG ON IG.CodigoInstacia = @codigoInstacia
					INNER JOIN [InstanciaDeGiroPorEquipo] IGE ON IGE.CodigoInstanciaGiro = IG.CodigoInstacia
					INNER JOIN [InstaciaDeGiroPorEquipoPorCorredor] IGEC ON IGEC.IdCorredor = @idCorredor AND IGEC.IdInstanciaDeGiroPorEquipo = IGE.Id
						
				END TRY
				BEGIN CATCH
					EXEC [dbo].[SPManejoDeErrores] @ErrorLogId = 0 ,@CodigoDeError = 50029, @Descripcion = 'ERROR al realizar los Insert. [dbo].[SPLlegadasSimulacion])'
					--RETURN @@ERROR;
				END CATCH		
				

	

				--COMMIT TRANSACTION

				
										
					
				SET @idMenor = @idMenor + 1
			
			END
	--END TRY
	--BEGIN CATCH
	--	EXEC [dbo].[SPManejoDeErrores] @ErrorLogId = 0 ,@CodigoDeError = 50025, @Descripcion = 'ERROR CON  la insercion de movimientos o llegadas. [dbo].[SPAjustesEstadosCuentaSimulacion])'
	--	RETURN @@ERROR;
	--END CATCH
	SET NOCOUNT OFF;
	
END


