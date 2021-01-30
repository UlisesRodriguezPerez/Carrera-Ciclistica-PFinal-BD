USE [ProyectoFinal_BD]
GO
/****** Object:  StoredProcedure [dbo].[SPVerTablaErrores]    Script Date: 29/1/2021 22:06:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  PROCEDURE [dbo].[SPVerTablaErrores]
AS
BEGIN
	SET NOCOUNT ON;
		SELECT [ErrorLogID],[CodigoDeError],[ErrorTime],[UserName],[ErrorNumber],[ErrorSeverity],[ErrorState],[ErrorProcedure],[ErrorLine],[ErrorMessege]
		FROM [dbo].[ErrorLog]
	SET NOCOUNT OFF;
END