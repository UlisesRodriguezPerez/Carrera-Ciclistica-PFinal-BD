USE [ProyectoFinal_BD]
GO


CREATE TYPE [dbo].[Sanciones] AS TABLE(
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idCarrera] [int] NULL,
	[idCorredor] [int] NULL,
	[idJuez] [int] NULL,
	[idGiro] [int] NULL,
	[codigoInstancia] [varchar](50) NULL,
	[idEtapa] [int] NULL,
	[minutosCastigo] [int] NULL,
	[descripción] [varchar](50) NULL
)
GO


