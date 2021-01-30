USE [ProyectoFinal_BD]
GO
/****** Object:  StoredProcedure [dbo].[SPVaciar_Tablas]    Script Date: 29/1/2021 13:44:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER   PROCEDURE [dbo].[SPVaciar_Tablas]
AS
BEGIN
	SET NOCOUNT ON;
	BEGIN TRY
		
		--DELETE FROM  [dbo].[Movimiento]
		--	DBCC CHECKIDENT ('[Movimiento]', RESEED, 0) --para los identity

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


	END TRY
	BEGIN CATCH
		EXEC [dbo].[SPManejoDeErrores] @ErrorLogId = 0 ,@CodigoDeError = 50012, @Descripcion = 'ERROR AL vaciar las tablas ()'
		--RETURN 'Error 50012'
		RETURN @@ERROR;
	END CATCH
	SET NOCOUNT OFF;
	

END



