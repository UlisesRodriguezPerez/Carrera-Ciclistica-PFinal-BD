USE [ProyectoFinal_BD]
GO

/****** Object:  UserDefinedTableType [dbo].[LlegadasDeEtapas]    Script Date: 1/2/2021 21:58:57 ******/
CREATE TYPE [dbo].[LlegadasDeEtapa] AS TABLE(
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idCarrera] [int] NULL,
	[idCorredor] [int] NULL,
	[horaFin] [time](7) NULL,
	[idGiro] [int] NULL,
	[codigoInstancia] [varchar](50) NULL

)
GO


