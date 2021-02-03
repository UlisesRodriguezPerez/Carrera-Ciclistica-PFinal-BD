USE [ProyectoFinal_BD]
GO
/****** Object:  StoredProcedure [dbo].[SPSancionesSimulacion]    Script Date: 3/2/2021 09:32:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



ALTER    PROCEDURE [dbo].[SPSancionesSimulacion]
		@tablaSanciones [dbo].[Sanciones] READONLY
		

AS 
BEGIN 	
	DECLARE @id INT
	DECLARE @idCarrera INT
	DECLARE @idCorredor INT
	DECLARE @idEtapa INT
	DECLARE @idGiro INT
	DECLARE @codigoInstacia VARCHAR(50)
	DECLARE @idJuez INT
	DECLARE @minutosCastigo INT
	DECLARE @descripción VARCHAR(50)


	DECLARE @idMenor INT
	DECLARE @idMayor INT




	
	DECLARE @tiempoSumar INT

	DECLARE @variableTiempoAux TIME(0)

	
	SET NOCOUNT ON;
		BEGIN TRANSACTION
		INSERT INTO [SancionesPorCarrera]
			(
				 IdCorredor
				,IdCarrera
				,IdJuez
			)
		SELECT
			 idCorredor
			,idCarrera
			,idJuez
		FROM
			@tablaSanciones

		SELECT 
			 @idMenor = MIN(id)
			,@idMayor = MAX(id) 
		FROM 
			@tablaSanciones
		
		WHILE @idMenor <= @idMayor
			BEGIN
			SELECT @variableTiempoAux = '00:00:00'
			

				SELECT 
						@idCarrera = TS.idCarrera
					,@idCorredor = TS.idCorredor
					,@idJuez = TS.idJuez
					,@idGiro = TS.idGiro
					,@codigoInstacia = TS.codigoInstancia
					,@idEtapa = TS.idEtapa
					,@minutosCastigo = minutosCastigo * -1
					,@descripción = descripción

					
				FROM 
					@tablaSanciones TS
				
				WHERE TS.id = @idMenor;
				--SELECT DATEADD(mi,@minutosCastigo * -1,@variableTiempoAux) FROM  @tablaSanciones TS WHERE TS.id = @idMenor;
				UPDATE 
					IGEC
				SET
						SumaTiempo = DATEADD(mi,@minutosCastigo,SumaTiempo)-- + @tiempoSumar
						

				FROM [InstaciaDeGiroPorEquipoPorCorredor] IGEC
				INNER JOIN [InstanciaDeGiroPorEquipo] IGE ON IGE.CodigoInstanciaGiro = @codigoInstacia
				WHERE
					IGEC.IdCorredor = @idCorredor AND IGEC.IdInstanciaDeGiroPorEquipo = IGE.Id
					
				UPDATE 
					IGE
				SET
						TotalTiempo = DATEADD(mi,@minutosCastigo,TotalTiempo) --+@tiempoSumar
				FROM 
					[InstanciaDeGiroPorEquipo] IGE
				INNER JOIN [Giro] G ON G.Id = @idGiro
				INNER JOIN [InstanciaGiro] IG ON IG.CodigoInstacia = @codigoInstacia AND IG.IdGiro = G.Id				
				INNER JOIN [InstaciaDeGiroPorEquipoPorCorredor] IGEC ON IGEC.IdCorredor = @idCorredor AND IGEC.IdInstanciaDeGiroPorEquipo = IGE.Id AND IGE.IdInstanciaGiro = IG.Id
				WHERE 
					IGE.CodigoInstanciaGiro = IG.CodigoInstacia AND IGEC.IdInstanciaDeGiroPorEquipo = IGE.Id
			
					
				INSERT INTO [MovimientosTiempo]
					(
							IdTipoMovimientoTiempo
						,IdInstanciaDeGiroPorEquipoPorCorredor
						,IdLlegada
						,CantidadDeTiempo
						,Fecha
					)
				SELECT
							1
							,IGEC.Id
							,Lle.Id
							,DATEADD(mi,@minutosCastigo * -1,@variableTiempoAux)
							,CA.Fecha
							
				FROM 
					@tablaSanciones TOR
				INNER JOIN [Carrera] CA ON CA.Id = idCarrera
				INNER JOIN [Llegada] Lle ON Lle.IdCarrera = @idCarrera AND Lle.IdCorredor = @idCorredor
				INNER JOIN [InstanciaGiro] IG ON IG.CodigoInstacia = @codigoInstacia
				INNER JOIN [InstanciaDeGiroPorEquipo] IGE ON IGE.CodigoInstanciaGiro = IG.CodigoInstacia
				INNER JOIN [InstaciaDeGiroPorEquipoPorCorredor] IGEC ON IGEC.IdCorredor = @idCorredor AND IGEC.IdInstanciaDeGiroPorEquipo = IGE.Id
				WHERE
					IGEC.IdCorredor = @idCorredor AND IGEC.IdInstanciaDeGiroPorEquipo = IGE.Id AND TOR.id = @idMenor
						

				SET @variableTiempoAux = '00:00:00'
				INSERT INTO [DebitoPorSancion]
					(
						 IdSancionPorCarrera
						,IdMovimientoTiempo
					)
				SELECT
						 SC.Id
						,MT.Id
				FROM 
					[SancionesPorCarrera] SC
				INNER JOIN [Carrera] CA ON CA.Id = idCarrera
				INNER JOIN [Llegada] Lle ON Lle.IdCarrera = @idCarrera AND Lle.IdCorredor = @idCorredor
				INNER JOIN [InstanciaGiro] IG ON IG.CodigoInstacia = @codigoInstacia
				INNER JOIN [InstanciaDeGiroPorEquipo] IGE ON IGE.CodigoInstanciaGiro = IG.CodigoInstacia
				INNER JOIN [InstaciaDeGiroPorEquipoPorCorredor] IGEC ON IGEC.IdCorredor = @idCorredor AND IGEC.IdInstanciaDeGiroPorEquipo = IGE.Id
				INNER JOIN [MovimientosTiempo] MT ON MT.IdInstanciaDeGiroPorEquipoPorCorredor = IGEC.Id AND
					MT.IdTipoMovimientoTiempo = 1  AND MT.Fecha = CA.Fecha
					--AND MT.CantidadDeTiempo = DATEADD(mi,CantidadDeTiempo,@variableTiempoAux)

				WHERE
					SC.IdCarrera = @idCarrera AND SC.IdCorredor = @idCorredor AND SC.IdJuez = @idJuez
											
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