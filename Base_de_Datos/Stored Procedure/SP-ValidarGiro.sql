USE [ProyectoFinal_BD]
GO
/****** Object:  StoredProcedure [dbo].[SPValidarGiro]    Script Date: 2/2/2021 22:00:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- SP para verificar Giro

ALTER  PROCEDURE 
		[dbo].[SPValidarGiro]
			(      
				@Nombre VARCHAR(100),
				@Anio VARCHAR(100)
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
			,IG.Id
		FROM 
			[dbo].[Giro] G
		INNER JOIN [InstanciaGiro] IG ON G.Id = IG.IdGiro
		WHERE 
				Nombre = @Nombre AND IG.Año = @Anio
	END TRY
	BEGIN CATCH
		EXEC [dbo].[SPManejoDeErrores] @ErrorLogId = 0 ,@CodigoDeError = 50013, @Descripcion = 'ERROR AL validar Giro ()'
		
		RETURN @@ERROR ;
	END CATCH
	SET NOCOUNT OFF;
END
