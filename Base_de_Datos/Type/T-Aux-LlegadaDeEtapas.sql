USE [ProyectoFinal_BD]
GO

/****** Object:  UserDefinedTableType [dbo].[LlegadasDeEtapa]    Script Date: 2/2/2021 01:32:01 ******/
CREATE TYPE [dbo].[LlegadaDeEtapas] AS TABLE(
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idCarrera] [int] NULL,
	[idCorredor] [int] NULL,
	[horaFin] [time](0) NULL,
	[idGiro] [int] NULL,
	[codigoInstancia] [varchar](50) NULL
)
GO


