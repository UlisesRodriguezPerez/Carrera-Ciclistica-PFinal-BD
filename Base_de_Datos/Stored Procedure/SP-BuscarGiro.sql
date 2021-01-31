USE [ProyectoFinal_BD]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- SP para verificar Giro

CREATE  PROCEDURE 
		[dbo].[SPBuscarGiro]
			(      
				@ID INT
			)      
AS       
BEGIN     
	SET NOCOUNT ON;
	BEGIN TRY
	   SELECT 
			 G.Id
			,G.Nombre
			,IG.Año
			,IG.FechaInicio
			,IG.FechaFinal
		FROM 
			[dbo].[Giro] G
		INNER JOIN [InstanciaGiro] IG ON G.Id = IG.IdGiro
		WHERE 
			 G.Id = @ID
	END TRY
	BEGIN CATCH
		EXEC [dbo].[SPManejoDeErrores] @ErrorLogId = 0 ,@CodigoDeError = 50014, @Descripcion = 'ERROR AL buscar Giro ()'
		
		RETURN @@ERROR ;
	END CATCH
	SET NOCOUNT OFF;
END
