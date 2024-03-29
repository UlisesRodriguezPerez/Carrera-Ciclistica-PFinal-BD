USE [ProyectoFinal_BD]
GO
/****** Object:  StoredProcedure [dbo].[SPObtenerTopMejoresTiemposEquipos]    Script Date: 3/2/2021 09:44:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER     PROCEDURE [dbo].[SPObtenerTopMejoresTiemposEquipos]
(
	@idInstanciaGiro INT
)
AS 
BEGIN
	SET NOCOUNT ON;
	BEGIN TRY
		
		SELECT
		TOP 3
			  G.Nombre
			 ,E.Nombre
			 ,DATEADD(dd,-1,IGE.TotalTiempo)
			 ,IG.Año
			 
		
		FROM [dbo].[InstanciaDeGiroPorEquipo] IGE
		INNER JOIN [InstanciaGiro] IG ON IG.Id = @idInstanciaGiro
		--INNER JOIN [InstanciaDeGiroPorEquipo] IGE ON IGE.Id = IGEC.IdInstanciaDeGiroPorEquipo AND IGE.IdInstanciaGiro = IG.Id
		INNER JOIN [Giro] G ON G.Id = IG.IdGiro
		INNER JOIN [Equipo] E ON E.Id = IGE.IdEquipo
		WHERE  
			IGE.IdInstanciaGiro = IG.Id
		ORDER BY
			IGE.TotalTiempo 
		
					
	END TRY
	BEGIN CATCH
		EXEC [dbo].[SPManejoDeErrores] @ErrorLogId = 0 ,@CodigoDeError = 50035, @Descripcion = 'ERROR AL obtener el top 3 mejores equipos Tiempo del Giro([dbo].[SPObtenerTopMejoresTiemposEquipos])'
		
		RETURN @@ERROR ;
	END CATCH
	SET NOCOUNT OFF;
END

