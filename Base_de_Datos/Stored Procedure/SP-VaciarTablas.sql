USE [ProyectoFinal_BD]
GO
/****** Object:  StoredProcedure [dbo].[SPVaciar_Tablas]    Script Date: 1/2/2021 15:42:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER   PROCEDURE [dbo].[SPVaciar_Tablas]
AS
BEGIN
	SET NOCOUNT ON;
	BEGIN TRY
		
		DELETE FROM  [dbo].[Llegada]
			DBCC CHECKIDENT ('[Llegada]', RESEED, 0) --para los identity

		DELETE FROM  [dbo].[InstaciaDeGiroPorEquipoPorCorredor]
			DBCC CHECKIDENT ('[InstaciaDeGiroPorEquipoPorCorredor]', RESEED, 0) --para los identity

		DELETE FROM  [dbo].[InstanciaDeGiroPorEquipo]
			DBCC CHECKIDENT ('[InstanciaDeGiroPorEquipo]', RESEED, 0) --para los identity
		
		DELETE FROM  [dbo].[Carrera]
			DBCC CHECKIDENT ('[Carrera]', RESEED, 0) --para los identity

		DELETE FROM  [dbo].[InstanciaGiro]
			DBCC CHECKIDENT ('[InstanciaGiro]', RESEED, 0) --para los identity
		

		-- Borrado de Catalogos
		DELETE FROM  [dbo].[PremioMontana]
		DELETE FROM  [dbo].[Etapa]
		DELETE FROM  [dbo].[Giro]
		DELETE FROM  [dbo].[Pais]
		DELETE FROM  [dbo].[Equipo]
		DELETE FROM  [dbo].[Corredor]
		DELETE FROM  [dbo].[Juez]
		DELETE FROM  [dbo].[TipoMovimientoTiempo]
		DELETE FROM  [dbo].[TipoMovimientosPuntosRegular]
		DELETE FROM  [dbo].[TipoMovimientoPuntosMontaña]
		DELETE FROM  [dbo].[ErrorLog]


	END TRY
	BEGIN CATCH
		EXEC [dbo].[SPManejoDeErrores] @ErrorLogId = 0 ,@CodigoDeError = 50012, @Descripcion = 'ERROR AL vaciar las tablas ()'
		--RETURN 'Error 50012'
		RETURN @@ERROR;
	END CATCH
	SET NOCOUNT OFF;
	

END



