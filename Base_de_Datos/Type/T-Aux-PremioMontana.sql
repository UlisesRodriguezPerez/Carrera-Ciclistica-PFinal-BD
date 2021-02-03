USE [ProyectoFinal_BD]
GO

/****** Object:  UserDefinedTableType [dbo].[PremiosMontana]    Script Date: 2/2/2021 17:38:22 ******/
CREATE TYPE [dbo].[PremioMontana] AS TABLE(
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idCarrera] [int] NULL,
	[idCorredor] [int] NULL,
	[idPremioMontana] [int] NULL,
	[idGiro] [int] NULL,
	[codigoInstancia] [varchar](50) NULL,
	[idEtapa] [int] NULL,
	[puntosPorPremio] [int] NULL
)
GO


