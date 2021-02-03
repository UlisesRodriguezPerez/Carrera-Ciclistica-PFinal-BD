USE [ProyectoFinal_BD]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE OR ALTER PROCEDURE [dbo].[SPObtenerTopMejoresMontana]
(
	@idInstanciaGiro INT
)
AS 
BEGIN
	SET NOCOUNT ON;
	BEGIN TRY
		
		SELECT
		TOP 10
			  G.Nombre
			 ,CO.Nombre
			 ,IGEC.NumeroCamisa
			 ,E.Nombre
			 ,IGEC.SumaPuntosMontaña
			 ,IG.Año
			 
		
		FROM [dbo].[InstaciaDeGiroPorEquipoPorCorredor] IGEC
		INNER JOIN [InstanciaGiro] IG ON IG.Id = @idInstanciaGiro
		INNER JOIN [InstanciaDeGiroPorEquipo] IGE ON IGE.Id = IGEC.IdInstanciaDeGiroPorEquipo AND IGE.IdInstanciaGiro = IG.Id
		INNER JOIN [Giro] G ON G.Id = IG.IdGiro
		INNER JOIN [Corredor] CO ON  CO.Id = IGEC.IdCorredor
		INNER JOIN [Equipo] E ON E.Id = IGE.IdEquipo
		WHERE  
			IGEC.IdInstanciaDeGiroPorEquipo = IGE.Id
		ORDER BY
			IGEC.SumaPuntosMontaña DESC
		
					
	END TRY
	BEGIN CATCH
		EXEC [dbo].[SPManejoDeErrores] @ErrorLogId = 0 ,@CodigoDeError = 50034, @Descripcion = 'ERROR AL obtener el top mejores en montaña del Giro([dbo].[SPObtenerTopMejoresMontana])'
		
		RETURN @@ERROR ;
	END CATCH
	SET NOCOUNT OFF;
END

