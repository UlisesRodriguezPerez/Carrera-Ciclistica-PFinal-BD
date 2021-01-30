USE [ProyectoFinal_BD]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SPIniciarSimulacion]
AS
DECLARE	@return_value int
BEGIN TRY
	EXEC    @return_value = [dbo].[SPVaciar_Tablas]
	EXEC	@return_value = [dbo].[SPCargar_Catalogos]
	
	--EXEC    @return_value = [dbo].[SPSimulacion]
	EXEC    @return_value = [dbo].[SPVerTablaErrores]
	

SELECT	'Return Value' = @return_value

END TRY
BEGIN CATCH
	EXEC [dbo].[SPManejoDeErrores] @ErrorLogId = 0 ,@CodigoDeError = 50012, @Descripcion = 'ERROR AL Iniciar simulación ([dbo].[SPIniciarSimulacion])'
	PRINT('ERROR AL INICIAR LA SIMULACIÓN')
END CATCH
