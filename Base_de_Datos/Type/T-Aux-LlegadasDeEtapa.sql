USE [ProyectoFinal_BD]
GO

/****** Object:  UserDefinedTableType [dbo].[LlegadasDeEtapa]    Script Date: 1/2/2021 16:15:22 ******/
CREATE TYPE [dbo].[LlegadasDeEtapas] AS TABLE(
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idCarrera] [int] NULL,
	[idCorredor] [int] NULL,
	[horaFin] [time](7) NULL
)
GO


