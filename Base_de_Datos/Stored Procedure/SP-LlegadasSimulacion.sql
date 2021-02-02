USE [ProyectoFinal_BD]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE OR ALTER      PROCEDURE [dbo].[SPLlegadasSimulacion]
		@tablaLlegadas [dbo].[LlegadasDeEtapa] READONLY
		

AS 
BEGIN 	
	DECLARE @id INT
	DECLARE @idCarrera INT
	DECLARE @idCorredor INT
	DECLARE @horaFin TIME(7)


	DECLARE @idMenor INT
	DECLARE @idMayor INT

	DECLARE @tablaOrdenada TABLE (id INT IDENTITY(1,1), idCarrera INT, idCorredor INT, horaFin TIME(7))

	DECLARE @cantidadPuntos INT
	DECLARE @idEtapa INT

	SET NOCOUNT ON;
	BEGIN TRY


		INSERT INTO @tablaOrdenada
			(
				 
				 idCarrera
				,idCorredor
				,horaFin
			)
		SELECT
			 
			 idCarrera
			,idCorredor
			,horaFin
		FROM 
			@tablaLlegadas
		ORDER BY
			horaFin

			

		SELECT @idMenor = min([id]), @idMayor=max([id]) FROM @tablaOrdenada
		WHILE @idMenor <= @idMayor
			BEGIN
				SELECT 
					 @idCarrera = idCarrera
					,@idCorredor = idCorredor
					,@horaFin = horaFin

					
				FROM 
					@tablaOrdenada TOR
				
				WHERE TOR.id = @idMenor
				
				SELECT @idEtapa = CA.IdEtapa FROM [Carrera] CA WHERE CA.Id = @idCarrera

				SELECT @cantidadPuntos = E.Puntos FROM Etapa E INNER JOIN [Carrera] CA ON CA.
				

			BEGIN TRANSACTION
				INSERT INTO [Llegada]
					(
						 IdCarrera
						,IdCorredor
						,HoraFin
					)

				SELECT
					 @idCarrera
					,@idCorredor
					,@horaFin


				

			COMMIT TRANSACTION

				
										
					
				SET @idMenor = @idMenor + 1
			
			END
	END TRY
	BEGIN CATCH
		EXEC [dbo].[SPManejoDeErrores] @ErrorLogId = 0 ,@CodigoDeError = 50025, @Descripcion = 'ERROR CON  la insercion de movimientos o llegadas. [dbo].[SPAjustesEstadosCuentaSimulacion])'
		RETURN @@ERROR;
	END CATCH
	SET NOCOUNT OFF;
	
END


