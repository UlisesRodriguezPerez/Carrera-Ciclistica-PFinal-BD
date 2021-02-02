USE [ProyectoFinal_BD]
GO


CREATE TYPE [dbo].[PremiosMontana] AS TABLE(
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idCarrera] [int] NULL,
	[idCorredor] [int] NULL,
	[idPremioMontana] [int] NULL,
	[idGiro] [int] NULL,
	[codigoInstancia] [varchar](50) NULL

)
GO


