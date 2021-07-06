USE [master]
GO
/****** Object:  Database [ProyectoFinal_BD]    Script Date: 3/2/2021 10:23:29 ******/
CREATE DATABASE [ProyectoFinal_BD]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ProyectoFinal_BD', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\ProyectoFinal_BD.mdf' , SIZE = 401408KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ProyectoFinal_BD_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\ProyectoFinal_BD_log.ldf' , SIZE = 5644288KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [ProyectoFinal_BD] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ProyectoFinal_BD].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ProyectoFinal_BD] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ProyectoFinal_BD] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ProyectoFinal_BD] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ProyectoFinal_BD] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ProyectoFinal_BD] SET ARITHABORT OFF 
GO
ALTER DATABASE [ProyectoFinal_BD] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ProyectoFinal_BD] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ProyectoFinal_BD] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ProyectoFinal_BD] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ProyectoFinal_BD] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ProyectoFinal_BD] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ProyectoFinal_BD] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ProyectoFinal_BD] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ProyectoFinal_BD] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ProyectoFinal_BD] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ProyectoFinal_BD] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ProyectoFinal_BD] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ProyectoFinal_BD] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ProyectoFinal_BD] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ProyectoFinal_BD] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ProyectoFinal_BD] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ProyectoFinal_BD] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ProyectoFinal_BD] SET RECOVERY FULL 
GO
ALTER DATABASE [ProyectoFinal_BD] SET  MULTI_USER 
GO
ALTER DATABASE [ProyectoFinal_BD] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ProyectoFinal_BD] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ProyectoFinal_BD] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ProyectoFinal_BD] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ProyectoFinal_BD] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'ProyectoFinal_BD', N'ON'
GO
ALTER DATABASE [ProyectoFinal_BD] SET QUERY_STORE = OFF
GO
USE [ProyectoFinal_BD]
GO
/****** Object:  UserDefinedTableType [dbo].[LlegadaDeEtapas]    Script Date: 3/2/2021 10:23:29 ******/
CREATE TYPE [dbo].[LlegadaDeEtapas] AS TABLE(
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idCarrera] [int] NULL,
	[idCorredor] [int] NULL,
	[horaFin] [time](0) NULL,
	[idGiro] [int] NULL,
	[codigoInstancia] [varchar](50) NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[LlegadasDeEtapa]    Script Date: 3/2/2021 10:23:29 ******/
CREATE TYPE [dbo].[LlegadasDeEtapa] AS TABLE(
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idCarrera] [int] NULL,
	[idCorredor] [int] NULL,
	[horaFin] [time](7) NULL,
	[idGiro] [int] NULL,
	[codigoInstancia] [varchar](50) NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[LlegadasDeEtapas]    Script Date: 3/2/2021 10:23:29 ******/
CREATE TYPE [dbo].[LlegadasDeEtapas] AS TABLE(
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idCarrera] [int] NULL,
	[idCorredor] [int] NULL,
	[horaFin] [time](7) NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[PremioMontana]    Script Date: 3/2/2021 10:23:29 ******/
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
/****** Object:  UserDefinedTableType [dbo].[PremiosMontana]    Script Date: 3/2/2021 10:23:29 ******/
CREATE TYPE [dbo].[PremiosMontana] AS TABLE(
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idCarrera] [int] NULL,
	[idCorredor] [int] NULL,
	[idPremioMontana] [int] NULL,
	[idGiro] [int] NULL,
	[codigoInstancia] [varchar](50) NULL,
	[idEtapa] [int] NULL,
	[puntosPorPremio] [int] NULL,
	[fecha] [date] NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[Sanciones]    Script Date: 3/2/2021 10:23:29 ******/
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
/****** Object:  Table [dbo].[Carrera]    Script Date: 3/2/2021 10:23:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Carrera](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdEtapa] [int] NOT NULL,
	[Fecha] [date] NOT NULL,
	[HoraIncio] [time](0) NOT NULL,
	[CodigoCarrera] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Carrera] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Corredor]    Script Date: 3/2/2021 10:23:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Corredor](
	[Id] [int] NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Corredor] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DebitoPorSancion]    Script Date: 3/2/2021 10:23:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DebitoPorSancion](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdSancionPorCarrera] [int] NOT NULL,
	[IdMovimientoTiempo] [int] NOT NULL,
 CONSTRAINT [PK_DebitoPorSancion] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Equipo]    Script Date: 3/2/2021 10:23:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Equipo](
	[Id] [int] NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Equipo] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ErrorLog]    Script Date: 3/2/2021 10:23:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ErrorLog](
	[ErrorLogID] [int] IDENTITY(1,1) NOT NULL,
	[CodigoDeError] [int] NULL,
	[ErrorTime] [datetime] NULL,
	[UserName] [varchar](50) NOT NULL,
	[ErrorNumber] [int] NOT NULL,
	[ErrorSeverity] [int] NULL,
	[ErrorState] [int] NULL,
	[ErrorProcedure] [nvarchar](100) NULL,
	[ErrorLine] [int] NULL,
	[ErrorMessege] [nvarchar](2000) NOT NULL,
 CONSTRAINT [PK_ErrorLog] PRIMARY KEY CLUSTERED 
(
	[ErrorLogID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Etapa]    Script Date: 3/2/2021 10:23:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Etapa](
	[Id] [int] NOT NULL,
	[IdGiro] [int] NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Puntos] [int] NOT NULL,
 CONSTRAINT [PK_Etapa] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GanadoresPremioMontaña]    Script Date: 3/2/2021 10:23:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GanadoresPremioMontaña](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdCorredor] [int] NOT NULL,
	[IdPremioMontaña] [int] NOT NULL,
 CONSTRAINT [PK_GanadoresPremioMontaña] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Giro]    Script Date: 3/2/2021 10:23:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Giro](
	[Id] [int] NOT NULL,
	[IdPais] [int] NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Giro] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[InstaciaDeGiroPorEquipoPorCorredor]    Script Date: 3/2/2021 10:23:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InstaciaDeGiroPorEquipoPorCorredor](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdInstanciaDeGiroPorEquipo] [int] NOT NULL,
	[IdCorredor] [int] NOT NULL,
	[SumaTiempo] [time](0) NOT NULL,
	[SumaPuntosRegularidad] [int] NOT NULL,
	[SumaPuntosMontaña] [int] NOT NULL,
	[NumeroCamisa] [int] NOT NULL,
 CONSTRAINT [PK_InstaciaDeGiroPorEquipoPorCorredor] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[InstanciaDeGiroPorEquipo]    Script Date: 3/2/2021 10:23:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InstanciaDeGiroPorEquipo](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdInstanciaGiro] [int] NOT NULL,
	[IdEquipo] [int] NOT NULL,
	[TotalTiempo] [smalldatetime] NOT NULL,
	[TotalPuntos] [int] NOT NULL,
	[CodigoInstanciaGiro] [varchar](50) NOT NULL,
 CONSTRAINT [PK_InstanciaDeGiroPorEquipo] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[InstanciaGiro]    Script Date: 3/2/2021 10:23:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InstanciaGiro](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdGiro] [int] NOT NULL,
	[Año] [int] NOT NULL,
	[FechaInicio] [date] NOT NULL,
	[FechaFinal] [date] NOT NULL,
	[CodigoInstacia] [varchar](50) NOT NULL,
 CONSTRAINT [PK_InstanciaGiro] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Juez]    Script Date: 3/2/2021 10:23:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Juez](
	[Id] [int] NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Juez] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Llegada]    Script Date: 3/2/2021 10:23:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Llegada](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdCarrera] [int] NOT NULL,
	[IdCorredor] [int] NOT NULL,
	[HoraFin] [time](0) NULL,
 CONSTRAINT [PK_Llegada] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MovimientosPuntosMontaña]    Script Date: 3/2/2021 10:23:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MovimientosPuntosMontaña](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdTipoMovimientoPuntosMontaña] [int] NOT NULL,
	[IdInstanciaDeGiroPorEquipoPorCorredor] [int] NOT NULL,
	[CantidadPuntos] [int] NOT NULL,
	[Fecha] [date] NOT NULL,
 CONSTRAINT [PK_MovimientosPuntosMontaña] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MovimientosPuntosRegular]    Script Date: 3/2/2021 10:23:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MovimientosPuntosRegular](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdTipoMovimientoPuntosRegular] [int] NOT NULL,
	[IdInstanciaDeGiroPorEquipoPorCorredor] [int] NOT NULL,
	[IdLlegada] [int] NOT NULL,
	[CantidadPuntos] [int] NOT NULL,
	[Fecha] [date] NOT NULL,
 CONSTRAINT [PK_MovimientosPuntosRegular] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MovimientosTiempo]    Script Date: 3/2/2021 10:23:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MovimientosTiempo](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdInstanciaDeGiroPorEquipoPorCorredor] [int] NOT NULL,
	[IdLlegada] [int] NOT NULL,
	[IdTipoMovimientoTiempo] [int] NOT NULL,
	[CantidadDeTiempo] [time](0) NOT NULL,
	[Fecha] [date] NOT NULL,
 CONSTRAINT [PK_MovimientosTiempo] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pais]    Script Date: 3/2/2021 10:23:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pais](
	[Id] [int] NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Pais] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PremioMontana]    Script Date: 3/2/2021 10:23:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PremioMontana](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdEtapa] [int] NOT NULL,
	[IdGiro] [int] NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Puntos] [int] NOT NULL,
 CONSTRAINT [PK_PremioMontaña] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SancionesPorCarrera]    Script Date: 3/2/2021 10:23:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SancionesPorCarrera](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdCorredor] [int] NOT NULL,
	[IdCarrera] [int] NOT NULL,
	[IdJuez] [int] NOT NULL,
 CONSTRAINT [PK_SancionesPorCarrera] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoMovimientoPuntosMontaña]    Script Date: 3/2/2021 10:23:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoMovimientoPuntosMontaña](
	[Id] [int] NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
 CONSTRAINT [PK_TipoMovimientoPuntosMontaña] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoMovimientosPuntosRegular]    Script Date: 3/2/2021 10:23:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoMovimientosPuntosRegular](
	[Id] [int] NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
 CONSTRAINT [PK_TipoMovimientosPuntosRegular] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoMovimientoTiempo]    Script Date: 3/2/2021 10:23:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoMovimientoTiempo](
	[Id] [int] NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
 CONSTRAINT [PK_TipoMovimientoTiempo] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Carrera]  WITH CHECK ADD  CONSTRAINT [FK_Carrera_Etapa] FOREIGN KEY([IdEtapa])
REFERENCES [dbo].[Etapa] ([Id])
GO
ALTER TABLE [dbo].[Carrera] CHECK CONSTRAINT [FK_Carrera_Etapa]
GO
ALTER TABLE [dbo].[DebitoPorSancion]  WITH CHECK ADD  CONSTRAINT [FK_DebitoPorSancion_MovimientosTiempo] FOREIGN KEY([IdMovimientoTiempo])
REFERENCES [dbo].[MovimientosTiempo] ([Id])
GO
ALTER TABLE [dbo].[DebitoPorSancion] CHECK CONSTRAINT [FK_DebitoPorSancion_MovimientosTiempo]
GO
ALTER TABLE [dbo].[DebitoPorSancion]  WITH CHECK ADD  CONSTRAINT [FK_DebitoPorSancion_SancionesPorCarrera] FOREIGN KEY([IdSancionPorCarrera])
REFERENCES [dbo].[SancionesPorCarrera] ([Id])
GO
ALTER TABLE [dbo].[DebitoPorSancion] CHECK CONSTRAINT [FK_DebitoPorSancion_SancionesPorCarrera]
GO
ALTER TABLE [dbo].[Etapa]  WITH CHECK ADD  CONSTRAINT [FK_Etapa_Giro] FOREIGN KEY([IdGiro])
REFERENCES [dbo].[Giro] ([Id])
GO
ALTER TABLE [dbo].[Etapa] CHECK CONSTRAINT [FK_Etapa_Giro]
GO
ALTER TABLE [dbo].[GanadoresPremioMontaña]  WITH CHECK ADD  CONSTRAINT [FK_GanadoresPremioMontaña_Corredor] FOREIGN KEY([IdCorredor])
REFERENCES [dbo].[Corredor] ([Id])
GO
ALTER TABLE [dbo].[GanadoresPremioMontaña] CHECK CONSTRAINT [FK_GanadoresPremioMontaña_Corredor]
GO
ALTER TABLE [dbo].[GanadoresPremioMontaña]  WITH CHECK ADD  CONSTRAINT [FK_GanadoresPremioMontaña_PremioMontaña] FOREIGN KEY([IdPremioMontaña])
REFERENCES [dbo].[PremioMontana] ([Id])
GO
ALTER TABLE [dbo].[GanadoresPremioMontaña] CHECK CONSTRAINT [FK_GanadoresPremioMontaña_PremioMontaña]
GO
ALTER TABLE [dbo].[Giro]  WITH CHECK ADD  CONSTRAINT [FK_Giro_Pais] FOREIGN KEY([IdPais])
REFERENCES [dbo].[Pais] ([Id])
GO
ALTER TABLE [dbo].[Giro] CHECK CONSTRAINT [FK_Giro_Pais]
GO
ALTER TABLE [dbo].[InstaciaDeGiroPorEquipoPorCorredor]  WITH CHECK ADD  CONSTRAINT [FK_InstaciaDeGiroPorEquipoPorCorredor_Corredor] FOREIGN KEY([IdCorredor])
REFERENCES [dbo].[Corredor] ([Id])
GO
ALTER TABLE [dbo].[InstaciaDeGiroPorEquipoPorCorredor] CHECK CONSTRAINT [FK_InstaciaDeGiroPorEquipoPorCorredor_Corredor]
GO
ALTER TABLE [dbo].[InstaciaDeGiroPorEquipoPorCorredor]  WITH CHECK ADD  CONSTRAINT [FK_InstaciaDeGiroPorEquipoPorCorredor_InstanciaDeGiroPorEquipo1] FOREIGN KEY([IdInstanciaDeGiroPorEquipo])
REFERENCES [dbo].[InstanciaDeGiroPorEquipo] ([Id])
GO
ALTER TABLE [dbo].[InstaciaDeGiroPorEquipoPorCorredor] CHECK CONSTRAINT [FK_InstaciaDeGiroPorEquipoPorCorredor_InstanciaDeGiroPorEquipo1]
GO
ALTER TABLE [dbo].[InstanciaDeGiroPorEquipo]  WITH CHECK ADD  CONSTRAINT [FK_InstanciaDeGiroPorEquipo_Equipo] FOREIGN KEY([IdEquipo])
REFERENCES [dbo].[Equipo] ([Id])
GO
ALTER TABLE [dbo].[InstanciaDeGiroPorEquipo] CHECK CONSTRAINT [FK_InstanciaDeGiroPorEquipo_Equipo]
GO
ALTER TABLE [dbo].[InstanciaDeGiroPorEquipo]  WITH CHECK ADD  CONSTRAINT [FK_InstanciaDeGiroPorEquipo_InstanciaGiro1] FOREIGN KEY([IdInstanciaGiro])
REFERENCES [dbo].[InstanciaGiro] ([Id])
GO
ALTER TABLE [dbo].[InstanciaDeGiroPorEquipo] CHECK CONSTRAINT [FK_InstanciaDeGiroPorEquipo_InstanciaGiro1]
GO
ALTER TABLE [dbo].[InstanciaGiro]  WITH CHECK ADD  CONSTRAINT [FK_InstanciaGiro_Giro] FOREIGN KEY([IdGiro])
REFERENCES [dbo].[Giro] ([Id])
GO
ALTER TABLE [dbo].[InstanciaGiro] CHECK CONSTRAINT [FK_InstanciaGiro_Giro]
GO
ALTER TABLE [dbo].[Llegada]  WITH CHECK ADD  CONSTRAINT [FK_Llegada_Carrera] FOREIGN KEY([IdCarrera])
REFERENCES [dbo].[Carrera] ([Id])
GO
ALTER TABLE [dbo].[Llegada] CHECK CONSTRAINT [FK_Llegada_Carrera]
GO
ALTER TABLE [dbo].[Llegada]  WITH CHECK ADD  CONSTRAINT [FK_Llegada_Corredor] FOREIGN KEY([IdCorredor])
REFERENCES [dbo].[Corredor] ([Id])
GO
ALTER TABLE [dbo].[Llegada] CHECK CONSTRAINT [FK_Llegada_Corredor]
GO
ALTER TABLE [dbo].[MovimientosPuntosMontaña]  WITH CHECK ADD  CONSTRAINT [FK_MovimientosPuntosMontaña_InstaciaDeGiroPorEquipoPorCorredor] FOREIGN KEY([IdInstanciaDeGiroPorEquipoPorCorredor])
REFERENCES [dbo].[InstaciaDeGiroPorEquipoPorCorredor] ([Id])
GO
ALTER TABLE [dbo].[MovimientosPuntosMontaña] CHECK CONSTRAINT [FK_MovimientosPuntosMontaña_InstaciaDeGiroPorEquipoPorCorredor]
GO
ALTER TABLE [dbo].[MovimientosPuntosMontaña]  WITH CHECK ADD  CONSTRAINT [FK_MovimientosPuntosMontaña_TipoMovimientoPuntosMontaña] FOREIGN KEY([IdTipoMovimientoPuntosMontaña])
REFERENCES [dbo].[TipoMovimientoPuntosMontaña] ([Id])
GO
ALTER TABLE [dbo].[MovimientosPuntosMontaña] CHECK CONSTRAINT [FK_MovimientosPuntosMontaña_TipoMovimientoPuntosMontaña]
GO
ALTER TABLE [dbo].[MovimientosPuntosRegular]  WITH CHECK ADD  CONSTRAINT [FK_MovimientosPuntosRegular_InstaciaDeGiroPorEquipoPorCorredor] FOREIGN KEY([IdInstanciaDeGiroPorEquipoPorCorredor])
REFERENCES [dbo].[InstaciaDeGiroPorEquipoPorCorredor] ([Id])
GO
ALTER TABLE [dbo].[MovimientosPuntosRegular] CHECK CONSTRAINT [FK_MovimientosPuntosRegular_InstaciaDeGiroPorEquipoPorCorredor]
GO
ALTER TABLE [dbo].[MovimientosPuntosRegular]  WITH CHECK ADD  CONSTRAINT [FK_MovimientosPuntosRegular_Llegada] FOREIGN KEY([IdLlegada])
REFERENCES [dbo].[Llegada] ([Id])
GO
ALTER TABLE [dbo].[MovimientosPuntosRegular] CHECK CONSTRAINT [FK_MovimientosPuntosRegular_Llegada]
GO
ALTER TABLE [dbo].[MovimientosPuntosRegular]  WITH CHECK ADD  CONSTRAINT [FK_MovimientosPuntosRegular_TipoMovimientosPuntosRegular] FOREIGN KEY([IdTipoMovimientoPuntosRegular])
REFERENCES [dbo].[TipoMovimientosPuntosRegular] ([Id])
GO
ALTER TABLE [dbo].[MovimientosPuntosRegular] CHECK CONSTRAINT [FK_MovimientosPuntosRegular_TipoMovimientosPuntosRegular]
GO
ALTER TABLE [dbo].[MovimientosTiempo]  WITH CHECK ADD  CONSTRAINT [FK_MovimientosTiempo_InstaciaDeGiroPorEquipoPorCorredor] FOREIGN KEY([IdInstanciaDeGiroPorEquipoPorCorredor])
REFERENCES [dbo].[InstaciaDeGiroPorEquipoPorCorredor] ([Id])
GO
ALTER TABLE [dbo].[MovimientosTiempo] CHECK CONSTRAINT [FK_MovimientosTiempo_InstaciaDeGiroPorEquipoPorCorredor]
GO
ALTER TABLE [dbo].[MovimientosTiempo]  WITH CHECK ADD  CONSTRAINT [FK_MovimientosTiempo_Llegada] FOREIGN KEY([IdLlegada])
REFERENCES [dbo].[Llegada] ([Id])
GO
ALTER TABLE [dbo].[MovimientosTiempo] CHECK CONSTRAINT [FK_MovimientosTiempo_Llegada]
GO
ALTER TABLE [dbo].[MovimientosTiempo]  WITH CHECK ADD  CONSTRAINT [FK_MovimientosTiempo_TipoMovimientoTiempo] FOREIGN KEY([IdTipoMovimientoTiempo])
REFERENCES [dbo].[TipoMovimientoTiempo] ([Id])
GO
ALTER TABLE [dbo].[MovimientosTiempo] CHECK CONSTRAINT [FK_MovimientosTiempo_TipoMovimientoTiempo]
GO
ALTER TABLE [dbo].[PremioMontana]  WITH CHECK ADD  CONSTRAINT [FK_PremioMontana_Giro1] FOREIGN KEY([IdGiro])
REFERENCES [dbo].[Giro] ([Id])
GO
ALTER TABLE [dbo].[PremioMontana] CHECK CONSTRAINT [FK_PremioMontana_Giro1]
GO
ALTER TABLE [dbo].[PremioMontana]  WITH CHECK ADD  CONSTRAINT [FK_PremioMontaña_Etapa] FOREIGN KEY([IdEtapa])
REFERENCES [dbo].[Etapa] ([Id])
GO
ALTER TABLE [dbo].[PremioMontana] CHECK CONSTRAINT [FK_PremioMontaña_Etapa]
GO
ALTER TABLE [dbo].[SancionesPorCarrera]  WITH CHECK ADD  CONSTRAINT [FK_SancionesPorCarrera_Carrera] FOREIGN KEY([IdCarrera])
REFERENCES [dbo].[Carrera] ([Id])
GO
ALTER TABLE [dbo].[SancionesPorCarrera] CHECK CONSTRAINT [FK_SancionesPorCarrera_Carrera]
GO
ALTER TABLE [dbo].[SancionesPorCarrera]  WITH CHECK ADD  CONSTRAINT [FK_SancionesPorCarrera_Corredor] FOREIGN KEY([IdCorredor])
REFERENCES [dbo].[Corredor] ([Id])
GO
ALTER TABLE [dbo].[SancionesPorCarrera] CHECK CONSTRAINT [FK_SancionesPorCarrera_Corredor]
GO
ALTER TABLE [dbo].[SancionesPorCarrera]  WITH CHECK ADD  CONSTRAINT [FK_SancionesPorCarrera_Juez] FOREIGN KEY([IdJuez])
REFERENCES [dbo].[Juez] ([Id])
GO
ALTER TABLE [dbo].[SancionesPorCarrera] CHECK CONSTRAINT [FK_SancionesPorCarrera_Juez]
GO
/****** Object:  StoredProcedure [dbo].[SPBuscarGiro]    Script Date: 3/2/2021 10:23:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- SP para verificar Giro

CREATE  PROCEDURE 
		[dbo].[SPBuscarGiro]
			(      
				@ID INT
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
			 G.Id = @ID
	END TRY
	BEGIN CATCH
		EXEC [dbo].[SPManejoDeErrores] @ErrorLogId = 0 ,@CodigoDeError = 50014, @Descripcion = 'ERROR AL buscar Giro ()'
		
		RETURN @@ERROR ;
	END CATCH
	SET NOCOUNT OFF;
END
GO
/****** Object:  StoredProcedure [dbo].[SPCargar_Catalogos]    Script Date: 3/2/2021 10:23:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE    PROCEDURE [dbo].[SPCargar_Catalogos]
AS
BEGIN

	BEGIN TRY 
		/*    Parsear el XML e insertar datos en la tabla    */
		DECLARE 
				@DocumentoXML XML;
		SELECT 
				@DocumentoXML = DXML
		FROM 
				OPENROWSET(BULK 'C:\Users\ulirp\Desktop\BAses\Carrera-Ciclistica-PFinal-BD\Base_de_Datos\XML\Catalogo-TareaFinal-vf.xml', SINGLE_BLOB) AS DocumentoXML(DXML);
	END TRY

	BEGIN CATCH
		EXEC [dbo].[SPManejoDeErrores] @ErrorLogId = 0 ,@CodigoDeError = 50001, @Descripcion = 'Problemas al parsear XML (SPCargar_Catalogo)'
		--RETURN 'Error 50001'
		RETURN @@Error
	END CATCH

	BEGIN TRY
					/* Inserta en las siguientes tablas sus valores correspondientes, según el XML.*/
			INSERT INTO [dbo].[Pais](
														 [Id]
														 ,[Nombre]
													  )
			SELECT	
					  d.value('@Id', 'INT')
					, d.value('@Nombre', 'VARCHAR(50)')
			FROM 
					@DocumentoXML.nodes('/Catalogos/Paises/Pais') AS t(d)
	END TRY

	BEGIN CATCH
		EXEC [dbo].[SPManejoDeErrores] @ErrorLogId = 0 ,@CodigoDeError = 50002, @Descripcion = 'ERROR AL INSERTAR DATOS EN LA TABLA [Pais] (SPCargar_Catalogo)'
			--RETURN 'Error 50002'
			RETURN @@Error
	END CATCH


	BEGIN TRY 
			INSERT INTO [dbo].[Giro](
											 [Id]
											 ,[Nombre]
											 ,[IdPais]
										  )
			SELECT	
					  d.value('@Id', 'INT')
					, d.value('@Nombre', 'VARCHAR(100)')
					, d.value('@IdPais', 'INT')
			FROM 
					@DocumentoXML.nodes('/Catalogos/Giros/Giro') AS t(d)
	END TRY

	BEGIN CATCH
		EXEC [dbo].[SPManejoDeErrores] @ErrorLogId = 0 ,@CodigoDeError = 50003, @Descripcion = 'ERROR AL INSERTAR DATOS EN LA TABLA [Giro] (SPCargar_Catalogo)'
			--RETURN 'Error 50003'
			RETURN @@Error
	END CATCH


	BEGIN TRY
			INSERT INTO [dbo].[Etapa](
										 [Id]
										,[Nombre]
										,[IdGiro]
										,[Puntos]
									)
			SELECT	
					  d.value('@Id', 'INT')
					, d.value('@Nombre', 'VARCHAR(50)')
					,d.value('@IdGiro', 'INT')
					,d.value('@Puntos', 'INT')
			FROM 
					@DocumentoXML.nodes('/Catalogos/Etapas/Etapa') AS t(d)
	END TRY

	BEGIN CATCH
		EXEC [dbo].[SPManejoDeErrores] @ErrorLogId = 0 ,@CodigoDeError = 50004, @Descripcion = 'ERROR AL INSERTAR DATOS EN LA TABLA [Etapa] (SPCargar_Catalogo)'
			--RETURN 'Error 50004'
			RETURN @@Error
	END CATCH


	BEGIN TRY
				INSERT INTO [dbo].[PremioMontana](
													 --[Id]
													 [Nombre]
													,[Puntos]
													,[IdGiro]
													,[IdEtapa]
													
													
												)
				SELECT	
						  --d.value('@Id', 'INT')
						  d.value('@Nombre', 'VARCHAR(50)')
						, d.value('@Puntos', 'INT')
						, d.value('@IdGiro', 'INT')
						, d.value('@IdEtapa', 'INT')
						
				FROM 
						@DocumentoXML.nodes('/Catalogos/PremiosMontana/PremioMontana') AS t(d)
	END TRY

	BEGIN CATCH
		EXEC [dbo].[SPManejoDeErrores] @ErrorLogId = 0 ,@CodigoDeError = 50005, @Descripcion = 'ERROR AL INSERTAR DATOS EN LA TABLA [PremioMontraña] (SPCargar_Catalogo)'
			--RETURN 'Error 50005'
		  	RETURN @@Error
	END CATCH


	BEGIN TRY
				INSERT INTO [dbo].[Equipo](
													 [Id]
													,[Nombre]
													

												)
				SELECT	
						  d.value('@Id', 'INT')
						, d.value('@Nombre', 'VARCHAR(50)')

				FROM 
						@DocumentoXML.nodes('/Catalogos/Equipos/Equipo') AS t(d)
	END TRY

	BEGIN CATCH
		EXEC [dbo].[SPManejoDeErrores] @ErrorLogId = 0 ,@CodigoDeError = 50006, @Descripcion = 'ERROR AL INSERTAR DATOS EN LA TABLA [Equipo] (SPCargar_Catalogo)'
			--RETURN 'Error 50006'
			RETURN @@Error
	END CATCH

	BEGIN TRY
				INSERT INTO [dbo].[Corredor](
													 [Id]
													,[Nombre]
	

												)
				SELECT	
						  d.value('@Id', 'INT')
						, d.value('@Nombre', 'VARCHAR(50)')


				FROM 
						@DocumentoXML.nodes('/Catalogos/Corredores/Corredor') AS t(d)
	END TRY

	BEGIN CATCH
		EXEC [dbo].[SPManejoDeErrores] @ErrorLogId = 0 ,@CodigoDeError = 50007, @Descripcion = 'ERROR AL INSERTAR DATOS EN LA TABLA [Corredor] (SPCargar_Catalogo)'
			--RETURN 'Error 50007'
			RETURN @@Error
	END CATCH


		BEGIN TRY
				INSERT INTO [dbo].[Juez](
													 [Id]
													,[Nombre]
	

												)
				SELECT	
						  d.value('@Id', 'INT')
						, d.value('@Nombre', 'VARCHAR(50)')


				FROM 
						@DocumentoXML.nodes('/Catalogos/Jueces/Juez') AS t(d)
	END TRY

	BEGIN CATCH
		EXEC [dbo].[SPManejoDeErrores] @ErrorLogId = 0 ,@CodigoDeError = 50008, @Descripcion = 'ERROR AL INSERTAR DATOS EN LA TABLA [Juez] (SPCargar_Catalogo)'
			--RETURN 'Error 50008'
			RETURN @@Error
	END CATCH
	
	BEGIN TRY
			INSERT INTO [dbo].[TipoMovimientoTiempo]
							(
								 [Id]
								,[Nombre]
							)
				SELECT	
						  d.value('@Id', 'INT')
						, d.value('@Nombre', 'VARCHAR(50)')


				FROM 
						@DocumentoXML.nodes('/Catalogos/TiposMovimientoTiempo/TipoMovimientoTiempo') AS t(d)
	END TRY

	BEGIN CATCH
		EXEC [dbo].[SPManejoDeErrores] @ErrorLogId = 0 ,@CodigoDeError = 50009, @Descripcion = 'ERROR AL INSERTAR DATOS EN LA TABLA [TipoMovimientoTiempo] (SPCargar_Catalogo)'
			--RETURN 'Error 50009'
			RETURN @@Error
	END CATCH

	BEGIN TRY
			INSERT INTO [dbo].[TipoMovimientosPuntosRegular]
							(
								 [Id]
								,[Nombre]
							)
				SELECT	
						  d.value('@Id', 'INT')
						, d.value('@Nombre', 'VARCHAR(50)')


				FROM 
						@DocumentoXML.nodes('/Catalogos/TiposMovimientosPuntosRegularidad/TipoMovimientosPuntosRegularidad') AS t(d)
	END TRY

	BEGIN CATCH
		EXEC [dbo].[SPManejoDeErrores] @ErrorLogId = 0 ,@CodigoDeError = 50010, @Descripcion = 'ERROR AL INSERTAR DATOS EN LA TABLA [TipoMovimientosPuntosRegular] (SPCargar_Catalogo)'
			--RETURN 'Error 50010'
			RETURN @@Error
	END CATCH


	BEGIN TRY
			INSERT INTO [dbo].[TipoMovimientoPuntosMontaña]
							(
								 [Id]
								,[Nombre]
							)
				SELECT	
						  d.value('@Id', 'INT')
						, d.value('@Nombre', 'VARCHAR(50)')


				FROM 
						@DocumentoXML.nodes('/Catalogos/TiposMovimientoPuntosMontana/TipoMovimientoPuntosMontana') AS t(d)
	END TRY

	BEGIN CATCH
		EXEC [dbo].[SPManejoDeErrores] @ErrorLogId = 0 ,@CodigoDeError = 50011, @Descripcion = 'ERROR AL INSERTAR DATOS EN LA TABLA [TipoMovimientoPuntosMontaña] (SPCargar_Catalogo)'
			--RETURN 'Error 50011'
			RETURN @@Error
	END CATCH


END
GO
/****** Object:  StoredProcedure [dbo].[SPIniciarSimulacion]    Script Date: 3/2/2021 10:23:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SPIniciarSimulacion]
AS
DECLARE	@return_value int
BEGIN TRY
	EXEC    @return_value = [dbo].[SPVaciar_Tablas]
	EXEC	@return_value = [dbo].[SPCargar_Catalogos]
	
	EXEC    @return_value = [dbo].[SPSimulacion]
	EXEC    @return_value = [dbo].[SPVerTablaErrores]
	

SELECT	'Return Value' = @return_value

END TRY
BEGIN CATCH
	EXEC [dbo].[SPManejoDeErrores] @ErrorLogId = 0 ,@CodigoDeError = 50012, @Descripcion = 'ERROR AL Iniciar simulación ([dbo].[SPIniciarSimulacion])'
	PRINT('ERROR AL INICIAR LA SIMULACIÓN')
END CATCH
GO
/****** Object:  StoredProcedure [dbo].[SPLlegadasSimulacion]    Script Date: 3/2/2021 10:23:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE        PROCEDURE [dbo].[SPLlegadasSimulacion]
		@tablaLlegadas [dbo].[LlegadaDeEtapas] READONLY
		

AS 
BEGIN 	
	DECLARE @id INT
	DECLARE @idCarrera INT
	DECLARE @idCorredor INT
	DECLARE @horaFin TIME(0)
	DECLARE @idGiro INT
	DECLARE @codigoInstacia VARCHAR(50)


	DECLARE @idMenor INT
	DECLARE @idMayor INT

	DECLARE @tablaOrdenada TABLE (id INT IDENTITY(1,1), idCarrera INT, idCorredor INT, horaFin TIME(0), idGiro INT, codigoInstancia VARCHAR(50))

	DECLARE @cantidadPuntos INT
	DECLARE @idEtapa INT
	DECLARE @tiempoSumar INT
	DECLARE @puntosGanados INT
	DECLARE @variableTiempoAux TIME(0)

	SELECT @variableTiempoAux = '00:00:00'
	SET NOCOUNT ON;
	BEGIN TRY


		INSERT @tablaOrdenada
			(
				 
				 idCarrera
				,idCorredor
				,horaFin
				,idGiro
				,codigoInstancia
			)
		SELECT
			 
			 tb.idCarrera
			,tb.idCorredor
			,tb.horaFin
			,tb.idGiro
			,tb.codigoInstancia
		FROM 
			@tablaLlegadas tb
		ORDER BY
			horaFin

		INSERT INTO [Llegada]
			(
				 IdCarrera
				,IdCorredor
				,HoraFin
			)
		SELECT
			 idCarrera
			,idCorredor
			,horaFin
		FROM
			@tablaOrdenada

	END TRY
	BEGIN CATCH
		EXEC [dbo].[SPManejoDeErrores] @ErrorLogId = 0 ,@CodigoDeError = 50026, @Descripcion = 'ERROR al rellenar tablaOrdenada. [dbo].[SPLlegadasSimulacion])'
		--RETURN @@ERROR;
	END CATCH
		SELECT 
			 @idMenor = MIN(id)
			,@idMayor = MAX(id) 
		FROM 
			@tablaOrdenada
		
		WHILE @idMenor <= @idMayor
			BEGIN
				BEGIN TRY
					SELECT 
						 @idCarrera = TOR.idCarrera
						,@idCorredor = TOR.idCorredor
						,@horaFin = TOR.horaFin
						,@idGiro = TOR.idGiro
						,@codigoInstacia = TOR.codigoInstancia

					
					FROM 
						@tablaOrdenada TOR
				
					WHERE TOR.id = @idMenor;
				
					SELECT @idEtapa = CA.IdEtapa FROM [Carrera] CA WHERE CA.Id = @idCarrera

					SELECT @cantidadPuntos = E.Puntos FROM Etapa E WHERE E.Id = @idEtapa AND E.IdGiro = @idGiro	

	
				
					
					--Obtenemos los segundos de diferencia para después sumarlos.
					SELECT @tiempoSumar = DATEDIFF(ss,CA.HoraIncio,@horaFin) FROM Carrera CA WHERE CA.Id = @idCarrera
					
					

				END TRY
				BEGIN CATCH
					EXEC [dbo].[SPManejoDeErrores] @ErrorLogId = 0 ,@CodigoDeError = 50027, @Descripcion = 'ERROR al iniciar variables de tablaOrdenada. [dbo].[SPLlegadasSimulacion])'
					--RETURN @@ERROR;
				END CATCH

				IF @idMenor > @cantidadPuntos 
					BEGIN
						SELECT @puntosGanados = 0
					END
				ELSE
					BEGIN
						SELECT @puntosGanados = @cantidadPuntos - @idMenor + 1
					END

				BEGIN TRY
					
					UPDATE 
						IGEC
					SET
						 SumaTiempo = DATEADD(ss,@tiempoSumar,SumaTiempo)-- + @tiempoSumar
						,SumaPuntosRegularidad = SumaPuntosRegularidad + @puntosGanados

					FROM [InstaciaDeGiroPorEquipoPorCorredor] IGEC
					INNER JOIN [InstanciaDeGiroPorEquipo] IGE ON IGE.CodigoInstanciaGiro = @codigoInstacia
					WHERE
						IGEC.IdCorredor = @idCorredor AND IGEC.IdInstanciaDeGiroPorEquipo = IGE.Id
					
					UPDATE 
						IGE
					SET
						 TotalTiempo = DATEADD(ss,@tiempoSumar,TotalTiempo) --+@tiempoSumar
						,TotalPuntos = TotalPuntos + @puntosGanados
					FROM 
						[InstanciaDeGiroPorEquipo] IGE
					INNER JOIN [Giro] G ON G.Id = @idGiro
					INNER JOIN [InstanciaGiro] IG ON IG.CodigoInstacia = @codigoInstacia AND IG.IdGiro = G.Id				
					INNER JOIN [InstaciaDeGiroPorEquipoPorCorredor] IGEC ON IGEC.IdCorredor = @idCorredor AND IGEC.IdInstanciaDeGiroPorEquipo = IGE.Id AND IGE.IdInstanciaGiro = IG.Id
					WHERE 
						IGE.CodigoInstanciaGiro = IG.CodigoInstacia AND IGEC.IdInstanciaDeGiroPorEquipo = IGE.Id
				END TRY
				BEGIN CATCH
					EXEC [dbo].[SPManejoDeErrores] @ErrorLogId = 0 ,@CodigoDeError = 50028, @Descripcion = 'ERROR al realizar los updates. [dbo].[SPLlegadasSimulacion])'
					--RETURN @@ERROR;
				END CATCH	

				BEGIN TRY
					INSERT INTO [MovimientosPuntosRegular]
						(
							 IdTipoMovimientoPuntosRegular
							,IdInstanciaDeGiroPorEquipoPorCorredor
							,IdLlegada
							,CantidadPuntos
							,Fecha
						)
					SELECT
							  1
							 ,IGEC.Id
							 ,Lle.Id
							 ,@puntosGanados
							 ,CA.Fecha
							
					FROM 
						@tablaOrdenada TOR
					INNER JOIN [Carrera] CA ON CA.Id = idCarrera
					INNER JOIN [Llegada] Lle ON Lle.IdCarrera = @idCarrera AND Lle.IdCorredor = @idCorredor
					INNER JOIN [InstanciaGiro] IG ON IG.CodigoInstacia = @codigoInstacia
					INNER JOIN [InstanciaDeGiroPorEquipo] IGE ON IGE.CodigoInstanciaGiro = IG.CodigoInstacia
					INNER JOIN [InstaciaDeGiroPorEquipoPorCorredor] IGEC ON IGEC.IdCorredor = @idCorredor AND IGEC.IdInstanciaDeGiroPorEquipo = IGE.Id

					--INNER JOIN [InstanciaDeGiroPorEquipo] IGE ON IGE.CodigoInstanciaGiro = @codigoInstacia
					WHERE
						IGEC.IdCorredor = @idCorredor AND IGEC.IdInstanciaDeGiroPorEquipo = IGE.Id
						
						AND TOR.id = @idMenor             --AND IGEC.IdInstanciaDeGiroPorEquipo = IGE.Id
						
					
					INSERT INTO [MovimientosTiempo]
						(
							 IdTipoMovimientoTiempo
							,IdInstanciaDeGiroPorEquipoPorCorredor
							,IdLlegada
							,CantidadDeTiempo
							,Fecha
						)
					SELECT
							  2
							 ,IGEC.Id
							 ,Lle.Id
							 ,DATEADD(ss,@tiempoSumar,@variableTiempoAux)
							 ,CA.Fecha
							
					FROM 
						@tablaOrdenada TOR
					INNER JOIN [Carrera] CA ON CA.Id = idCarrera
					INNER JOIN [Llegada] Lle ON Lle.IdCarrera = @idCarrera AND Lle.IdCorredor = @idCorredor
					INNER JOIN [InstanciaGiro] IG ON IG.CodigoInstacia = @codigoInstacia
					INNER JOIN [InstanciaDeGiroPorEquipo] IGE ON IGE.CodigoInstanciaGiro = IG.CodigoInstacia
					INNER JOIN [InstaciaDeGiroPorEquipoPorCorredor] IGEC ON IGEC.IdCorredor = @idCorredor AND IGEC.IdInstanciaDeGiroPorEquipo = IGE.Id
					WHERE
						IGEC.IdCorredor = @idCorredor AND IGEC.IdInstanciaDeGiroPorEquipo = IGE.Id
						
						AND TOR.id = @idMenor             


				END TRY
				BEGIN CATCH
					EXEC [dbo].[SPManejoDeErrores] @ErrorLogId = 0 ,@CodigoDeError = 50029, @Descripcion = 'ERROR al realizar los Insert. [dbo].[SPLlegadasSimulacion])'
					--RETURN @@ERROR;
				END CATCH		
				

				SET @idMenor = @idMenor + 1
			
			END

	SET NOCOUNT OFF;
	
END

--DECLARE @tiempoSuma INT
--DECLARE @hora1 TIME(0)
--DECLARE @hora2 TIME(0)
--DECLARE @nuevoTiempo TIME(0)


--SELECT @hora1 = '09:10:10'
--SELECT @hora2 = '10:12:25'

--SELECT @tiempoSuma = DATEDIFF(ss,@hora1,@hora2)

--PRINT(@tiempoSuma)
--SELECT @nuevoTiempo = '00:00:00'

--PRINT(@nuevoTiempo)
--SELECT @nuevoTiempo = DATEADD(ss,@tiempoSuma,@nuevoTiempo)
--PRINT(@nuevoTiempo)

--SELECT @tiempoSumar = DATEDIFF(ss,CA.HoraIncio,@horaFin) FROM Carrera CA WHERE CA.Id = @idCarrera
GO
/****** Object:  StoredProcedure [dbo].[SPManejoDeErrores]    Script Date: 3/2/2021 10:23:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   PROCEDURE [dbo].[SPManejoDeErrores]
	 @ErrorLogId [int]  OUTPUT
	,@CodigoDeError INT
	,@Descripcion VARCHAR(500)
AS
BEGIN
	SET NOCOUNT ON;

	SET @ErrorLogId = 0;

	BEGIN TRY

		IF ERROR_NUMBER() IS NULL
			RETURN;

		IF XACT_STATE() = -1
		BEGIN
			PRINT('No se puede registrar el error ya que la transacción está en proceso.') --COMMIT TRANSACTION
		END

		INSERT [dbo].[ErrorLog]
			(
			 [UserName]
			,[CodigoDeError]
			,[ErrorNumber]
			,[ErrorSeverity]
			,[ErrorState]
			,[ErrorProcedure]
			,[ErrorLine]
			,[ErrorMessege]
			)
			VALUES
				(
				 CURRENT_USER
				,@CodigoDeError
				,ERROR_NUMBER()
				,ERROR_SEVERITY()
				,ERROR_STATE()
				,ERROR_PROCEDURE()
				,ERROR_LINE()
				,@Descripcion
				);
			SET @ErrorLogId = @@IDENTITY;
	END TRY
	BEGIN CATCH
		PRINT('Ocurrió un error en el Stored procedure de errores xD.');

		RETURN -1;

	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[SPObtenerTopMasRegulares]    Script Date: 3/2/2021 10:23:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[SPObtenerTopMasRegulares]
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
			 ,IGEC.SumaPuntosRegularidad
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
			IGEC.SumaPuntosRegularidad DESC
		
					
	END TRY
	BEGIN CATCH
		EXEC [dbo].[SPManejoDeErrores] @ErrorLogId = 0 ,@CodigoDeError = 50032, @Descripcion = 'ERROR AL obtener el top mejores regulares del Giro([dbo].[SPObtenerTopMasRegulares])'
		
		RETURN @@ERROR ;
	END CATCH
	SET NOCOUNT OFF;
END

GO
/****** Object:  StoredProcedure [dbo].[SPObtenerTopMejoresMontana]    Script Date: 3/2/2021 10:23:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[SPObtenerTopMejoresMontana]
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

GO
/****** Object:  StoredProcedure [dbo].[SPObtenerTopMejoresTiempos]    Script Date: 3/2/2021 10:23:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[SPObtenerTopMejoresTiempos]
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
			 ,IGEC.SumaTiempo
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
			IGEC.SumaTiempo 
		
					
	END TRY
	BEGIN CATCH
		EXEC [dbo].[SPManejoDeErrores] @ErrorLogId = 0 ,@CodigoDeError = 50033, @Descripcion = 'ERROR AL obtener el top mejores Tiempo del Giro([dbo].[SPObtenerTopMejoresTiempos])'
		
		RETURN @@ERROR ;
	END CATCH
	SET NOCOUNT OFF;
END

GO
/****** Object:  StoredProcedure [dbo].[SPObtenerTopMejoresTiemposEquipos]    Script Date: 3/2/2021 10:23:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE     PROCEDURE [dbo].[SPObtenerTopMejoresTiemposEquipos]
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

GO
/****** Object:  StoredProcedure [dbo].[SPPremiosMontana]    Script Date: 3/2/2021 10:23:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE    PROCEDURE [dbo].[SPPremiosMontana]
		@TablaPremiosMontana [dbo].[PremiosMontana] READONLY
		

AS 
BEGIN 	
	DECLARE @id INT
	DECLARE @idCarrera INT
	DECLARE @idCorredor INT
	DECLARE @idPremioMontana INT
	DECLARE @idGiro INT
	DECLARE @codigoInstacia VARCHAR(50)
	DECLARE @idIGEC INT
	DECLARE @fecha DATE
	DECLARE @idTabla INT
	


	DECLARE @idMenor INT
	DECLARE @idMayor INT

	--DECLARE @tablaOrdenada TABLE (id INT IDENTITY(1,1), idCarrera INT, idCorredor INT, horaFin TIME(0), idGiro INT, codigoInstancia VARCHAR(50))

	DECLARE @cantidadPuntos INT
	DECLARE @idEtapa INT
	--DECLARE @tiempoSumar 
	DECLARE @puntosGanados INT

	SET NOCOUNT ON;
	--BEGIN TRY


		--INSERT @tablaOrdenada
		--	(
				 
		--		 idCarrera
		--		,idCorredor
		--		,horaFin
		--		,idGiro
		--		,codigoInstancia
		--	)
		--SELECT
			 
		--	 tb.idCarrera
		--	,tb.idCorredor
		--	,tb.horaFin
		--	,tb.idGiro
		--	,tb.codigoInstancia
		--FROM 
		--	@tablaLlegadas tb
		--ORDER BY
		--	horaFin

		--INSERT INTO [Llegada]
		--	(
		--		 IdCarrera
		--		,IdCorredor
		--		,HoraFin
		--	)
		--SELECT
		--	 idCarrera
		--	,idCorredor
		--	,horaFin
		--FROM
		--	@tablaOrdenada
		--SELECT * FROM @tablaOrdenada
		--SELECT * FROM [Llegada]
	--END TRY
	--BEGIN CATCH
	--	EXEC [dbo].[SPManejoDeErrores] @ErrorLogId = 0 ,@CodigoDeError = 50026, @Descripcion = 'ERROR al rellenar tablaOrdenada. [dbo].[SPLlegadasSimulacion])'
	--	--RETURN @@ERROR;
	--END CATCH
		SELECT 
			 @idMenor = MIN(id)
			,@idMayor = MAX(id) 
		FROM 
			@TablaPremiosMontana
		
		WHILE @idMenor <= @idMayor
			BEGIN
				BEGIN TRY
					SELECT 
						 @idCarrera = TPM.idCarrera
						,@idCorredor = TPM.idCorredor
						,@idPremioMontana = TPM.idPremioMontana
						,@idGiro = TPM.idGiro
						,@codigoInstacia = TPM.codigoInstancia
						,@idEtapa = TPM.idEtapa
						,@puntosGanados = TPM.puntosPorPremio
						,@fecha = TPM.fecha
						,@idTabla = TPM.id
					FROM 
						@TablaPremiosMontana TPM
				
					WHERE TPM.id = @idMenor;


				END TRY
				BEGIN CATCH
					EXEC [dbo].[SPManejoDeErrores] @ErrorLogId = 0 ,@CodigoDeError = 50030, @Descripcion = 'ERROR al iniciar variables. [dbo].[SPPremioMontana])'
					--RETURN @@ERROR;
				END CATCH


				BEGIN TRY
					BEGIN TRANSACTION
					UPDATE 
						IGEC
					SET
						SumaPuntosMontaña = SumaPuntosMontaña + @puntosGanados
					

					FROM [InstaciaDeGiroPorEquipoPorCorredor] IGEC
					INNER JOIN [InstanciaDeGiroPorEquipo] IGE ON IGE.CodigoInstanciaGiro = @codigoInstacia AND IGEC.IdInstanciaDeGiroPorEquipo = IGE.Id

					WHERE
						IGEC.IdCorredor = @idCorredor AND IGEC.IdInstanciaDeGiroPorEquipo = IGE.Id;
					
					SELECT 
						@idIGEC = IGEC.Id
					FROM 
						[InstaciaDeGiroPorEquipoPorCorredor] IGEC
					INNER JOIN [InstanciaDeGiroPorEquipo] IGE ON IGE.CodigoInstanciaGiro = @codigoInstacia AND IGEC.IdInstanciaDeGiroPorEquipo = IGE.Id
					WHERE
						IGEC.IdCorredor = @idCorredor AND IGEC.IdInstanciaDeGiroPorEquipo = IGE.Id;


				END TRY
				BEGIN CATCH
					EXEC [dbo].[SPManejoDeErrores] @ErrorLogId = 0 ,@CodigoDeError = 50031, @Descripcion = 'ERROR al realizar los updates. [dbo].[SPPremioMonstana])'
					--RETURN @@ERROR;
				END CATCH	

				BEGIN TRY
					INSERT INTO [MovimientosPuntosMontaña]
						(
							 IdTipoMovimientoPuntosMontaña
							,IdInstanciaDeGiroPorEquipoPorCorredor
							,CantidadPuntos
							,Fecha
						)
					SELECT
							  1
							 ,IGEC.Id
							 ,@puntosGanados
							 ,@fecha
							
					FROM 
						@TablaPremiosMontana TPM
					INNER JOIN [Carrera] CA ON CA.Id = idCarrera
					--INNER JOIN [Llegada] Lle ON Lle.IdCarrera = @idCarrera AND Lle.IdCorredor = @idCorredor
					INNER JOIN [InstanciaGiro] IG ON IG.CodigoInstacia = @codigoInstacia AND IG.IdGiro = @idGiro
					INNER JOIN [InstanciaDeGiroPorEquipo] IGE ON IGE.CodigoInstanciaGiro = IG.CodigoInstacia
					INNER JOIN [InstaciaDeGiroPorEquipoPorCorredor] IGEC ON IGEC.IdCorredor = @idCorredor AND IGEC.IdInstanciaDeGiroPorEquipo = IGE.Id
					
					WHERE
						IGEC.IdCorredor = @idCorredor AND IGEC.IdInstanciaDeGiroPorEquipo = IGE.Id AND TPM.id = @idMenor 
					
					--	TPM.id = @idMenor AND IGEC.IdInstanciaDeGiroPorEquipo = IGE.Id 
					--	--AND IGEC.IdCorredor = @idCorredor --AND IGEC.IdInstanciaDeGiroPorEquipo = IGE.Id 

				END TRY
				BEGIN CATCH
					EXEC [dbo].[SPManejoDeErrores] @ErrorLogId = 0 ,@CodigoDeError = 50032, @Descripcion = 'ERROR al realizar los Insert. [dbo].[SPPremioMontanaSimulacion])'
					--RETURN @@ERROR;
				END CATCH		
				

	

				COMMIT TRANSACTION

				
										
					
				SET @idMenor = @idMenor + 1
			
			END
	--END TRY
	--BEGIN CATCH
	--	EXEC [dbo].[SPManejoDeErrores] @ErrorLogId = 0 ,@CodigoDeError = 50025, @Descripcion = 'ERROR CON  la insercion de movimientos o llegadas. [dbo].[SPAjustesEstadosCuentaSimulacion])'
	--	RETURN @@ERROR;
	--END CATCH
	SET NOCOUNT OFF;
	
END


GO
/****** Object:  StoredProcedure [dbo].[SPSancionesSimulacion]    Script Date: 3/2/2021 10:23:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE    PROCEDURE [dbo].[SPSancionesSimulacion]
		@tablaSanciones [dbo].[Sanciones] READONLY
		

AS 
BEGIN 	
	DECLARE @id INT
	DECLARE @idCarrera INT
	DECLARE @idCorredor INT
	DECLARE @idEtapa INT
	DECLARE @idGiro INT
	DECLARE @codigoInstacia VARCHAR(50)
	DECLARE @idJuez INT
	DECLARE @minutosCastigo INT
	DECLARE @descripción VARCHAR(50)


	DECLARE @idMenor INT
	DECLARE @idMayor INT




	
	DECLARE @tiempoSumar INT

	DECLARE @variableTiempoAux TIME(0)

	
	SET NOCOUNT ON;
		BEGIN TRANSACTION
		INSERT INTO [SancionesPorCarrera]
			(
				 IdCorredor
				,IdCarrera
				,IdJuez
			)
		SELECT
			 idCorredor
			,idCarrera
			,idJuez
		FROM
			@tablaSanciones

		SELECT 
			 @idMenor = MIN(id)
			,@idMayor = MAX(id) 
		FROM 
			@tablaSanciones
		
		WHILE @idMenor <= @idMayor
			BEGIN
			SELECT @variableTiempoAux = '00:00:00'
			

				SELECT 
						@idCarrera = TS.idCarrera
					,@idCorredor = TS.idCorredor
					,@idJuez = TS.idJuez
					,@idGiro = TS.idGiro
					,@codigoInstacia = TS.codigoInstancia
					,@idEtapa = TS.idEtapa
					,@minutosCastigo = minutosCastigo * -1
					,@descripción = descripción

					
				FROM 
					@tablaSanciones TS
				
				WHERE TS.id = @idMenor;
				--SELECT DATEADD(mi,@minutosCastigo * -1,@variableTiempoAux) FROM  @tablaSanciones TS WHERE TS.id = @idMenor;
				UPDATE 
					IGEC
				SET
						SumaTiempo = DATEADD(mi,@minutosCastigo,SumaTiempo)-- + @tiempoSumar
						

				FROM [InstaciaDeGiroPorEquipoPorCorredor] IGEC
				INNER JOIN [InstanciaDeGiroPorEquipo] IGE ON IGE.CodigoInstanciaGiro = @codigoInstacia
				WHERE
					IGEC.IdCorredor = @idCorredor AND IGEC.IdInstanciaDeGiroPorEquipo = IGE.Id
					
				UPDATE 
					IGE
				SET
						TotalTiempo = DATEADD(mi,@minutosCastigo,TotalTiempo) --+@tiempoSumar
				FROM 
					[InstanciaDeGiroPorEquipo] IGE
				INNER JOIN [Giro] G ON G.Id = @idGiro
				INNER JOIN [InstanciaGiro] IG ON IG.CodigoInstacia = @codigoInstacia AND IG.IdGiro = G.Id				
				INNER JOIN [InstaciaDeGiroPorEquipoPorCorredor] IGEC ON IGEC.IdCorredor = @idCorredor AND IGEC.IdInstanciaDeGiroPorEquipo = IGE.Id AND IGE.IdInstanciaGiro = IG.Id
				WHERE 
					IGE.CodigoInstanciaGiro = IG.CodigoInstacia AND IGEC.IdInstanciaDeGiroPorEquipo = IGE.Id
			
					
				INSERT INTO [MovimientosTiempo]
					(
							IdTipoMovimientoTiempo
						,IdInstanciaDeGiroPorEquipoPorCorredor
						,IdLlegada
						,CantidadDeTiempo
						,Fecha
					)
				SELECT
							1
							,IGEC.Id
							,Lle.Id
							,DATEADD(mi,@minutosCastigo * -1,@variableTiempoAux)
							,CA.Fecha
							
				FROM 
					@tablaSanciones TOR
				INNER JOIN [Carrera] CA ON CA.Id = idCarrera
				INNER JOIN [Llegada] Lle ON Lle.IdCarrera = @idCarrera AND Lle.IdCorredor = @idCorredor
				INNER JOIN [InstanciaGiro] IG ON IG.CodigoInstacia = @codigoInstacia
				INNER JOIN [InstanciaDeGiroPorEquipo] IGE ON IGE.CodigoInstanciaGiro = IG.CodigoInstacia
				INNER JOIN [InstaciaDeGiroPorEquipoPorCorredor] IGEC ON IGEC.IdCorredor = @idCorredor AND IGEC.IdInstanciaDeGiroPorEquipo = IGE.Id
				WHERE
					IGEC.IdCorredor = @idCorredor AND IGEC.IdInstanciaDeGiroPorEquipo = IGE.Id AND TOR.id = @idMenor
						

				SET @variableTiempoAux = '00:00:00'
				INSERT INTO [DebitoPorSancion]
					(
						 IdSancionPorCarrera
						,IdMovimientoTiempo
					)
				SELECT
						 SC.Id
						,MT.Id
				FROM 
					[SancionesPorCarrera] SC
				INNER JOIN [Carrera] CA ON CA.Id = idCarrera
				INNER JOIN [Llegada] Lle ON Lle.IdCarrera = @idCarrera AND Lle.IdCorredor = @idCorredor
				INNER JOIN [InstanciaGiro] IG ON IG.CodigoInstacia = @codigoInstacia
				INNER JOIN [InstanciaDeGiroPorEquipo] IGE ON IGE.CodigoInstanciaGiro = IG.CodigoInstacia
				INNER JOIN [InstaciaDeGiroPorEquipoPorCorredor] IGEC ON IGEC.IdCorredor = @idCorredor AND IGEC.IdInstanciaDeGiroPorEquipo = IGE.Id
				INNER JOIN [MovimientosTiempo] MT ON MT.IdInstanciaDeGiroPorEquipoPorCorredor = IGEC.Id AND
					MT.IdTipoMovimientoTiempo = 1  AND MT.Fecha = CA.Fecha
					--AND MT.CantidadDeTiempo = DATEADD(mi,CantidadDeTiempo,@variableTiempoAux)

				WHERE
					SC.IdCarrera = @idCarrera AND SC.IdCorredor = @idCorredor AND SC.IdJuez = @idJuez
											
			SET @idMenor = @idMenor + 1
			
			END
		COMMIT TRANSACTION
	SET NOCOUNT OFF;
	
END

--DECLARE @tiempoSuma INT
--DECLARE @hora1 TIME(0)
--DECLARE @hora2 TIME(0)
--DECLARE @nuevoTiempo TIME(0)


--SELECT @hora1 = '09:10:10'
--SELECT @hora2 = '10:12:25'

--SELECT @tiempoSuma = DATEDIFF(ss,@hora1,@hora2)

--PRINT(@tiempoSuma)
--SELECT @nuevoTiempo = '00:00:00'

--PRINT(@nuevoTiempo)
--SELECT @nuevoTiempo = DATEADD(ss,@tiempoSuma,@nuevoTiempo)
--PRINT(@nuevoTiempo)

--SELECT @tiempoSumar = DATEDIFF(ss,CA.HoraIncio,@horaFin) FROM Carrera CA WHERE CA.Id = @idCarrera
GO
/****** Object:  StoredProcedure [dbo].[SPSimulacion]    Script Date: 3/2/2021 10:23:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE    PROCEDURE [dbo].[SPSimulacion]
AS

BEGIN
	SET NOCOUNT ON


	DECLARE @tablaLlegadas AS [dbo].[LlegadaDeEtapas];
	DECLARE @TablaPremiosMontana AS [dbo].[PremiosMontana];
	DECLARE @TablaSanciones AS [dbo].[Sanciones];
	--DECLARE @TablaEstadosDeCuenta AS [dbo].[TablaEstadosDeCuenta];
	--DECLARE @TablaBeneficiarios AS [dbo].[BeneficiarioPerTrigger];
	DECLARE @AnioDeOperacion INT

	DECLARE @IdGiro INT
	DECLARE @CodigoInstancia VARCHAR(50)
	DECLARE @FechaInicio DATE
	DECLARE @FechaFin DATE
	

	DECLARE @InstanciasPorIterar TABLE
		(
			 iterador INT IDENTITY(1,1) PRIMARY KEY
		    ,idGiro INT
			,codigoInstancia VARCHAR(50)
			,fechaInicio DATE
			,fechaFin DATE
			,anio INT
		)

	-- Tabla para almacenas las fechas según el XML.
	DECLARE @FechasPorIterar TABLE
		(
			 iterador INT IDENTITY(1,1) PRIMARY KEY
			,anio INT
		)

	-- Sección para cargar las fechas desde el XML y parsearlo antes.

	BEGIN TRY
		--Parsear el XML e insertar datos en la tabla
		DECLARE 
				@DocumentoXML XML;
	
		SELECT 
			@DocumentoXML = DXML
		FROM 
			OPENROWSET(BULK 'C:\Users\ulirp\Desktop\BAses\Carrera-Ciclistica-PFinal-BD\Base_de_Datos\XML\DatosFinales.xml', SINGLE_BLOB) AS DocumentoXML(DXML);
		
		INSERT 
			@FechasPorIterar (anio)

		SELECT 
			f.value('@Id','INT')
		FROM 
			@DocumentoXML.nodes('/Year')AS t(f);

	END TRY

	BEGIN CATCH
		EXEC [dbo].[SPManejoDeErrores] @ErrorLogId = 0 ,@CodigoDeError = 50015, @Descripcion = 'ERROR AL parsear el archivo de la simulación  ([dbo].[SPSimulacion])'
			PRINT 'ERROR AL PARSEAR EL XML EN LA SIMULACIÓN.'
			--RETURN @@ERROR;
	END CATCH


	
	
	

	-- Sección donde vamos a declarar las variables para poder iterar por día.
	DECLARE @primerAnio INT
	DECLARE @ultimoAnio INT
	DECLARE @anioMinimo INT
	DECLARE @anioMaximo INT
	DECLARE @anioNodo INT

	DECLARE @primerInstancia INT
	DECLARE @ultimaInstancia INT
	DECLARE @instanciaMinima INT
	DECLARE @instanciaMaxima INT
	DECLARE @instanciaNodo INT




	-- Asignamos las fechas a cada variable con MIN y MAX (funciones agregadas)
	BEGIN TRY
		SELECT 
			 @anioMinimo = MIN(F.anio)
			,@anioMaximo = MAX(F.anio)
		FROM @FechasPorIterar F
	
		-- Inicializamos las variables inicio y fin de fechas con las cuales se va a recorrer la simulación.
		SELECT 
			@primerAnio = F.iterador
		FROM
			@FechasPorIterar F
		WHERE
			F.anio = @anioMinimo
	
		SELECT 
			@ultimoAnio = F.iterador
		FROM
			@FechasPorIterar F
		WHERE
			F.anio = @anioMaximo


	
		-- Inicializamos las variables inicio y fin de fechas con las cuales se va a recorrer la simulación.
		--SELECT 
		--	@primerAnio = F.iterador
		--FROM
		--	@FechasPorIterar F
		--WHERE
		--	F.anio = @anioMinimo
	
		--SELECT 
		--	@ultimoAnio = F.iterador
		--FROM
		--	@FechasPorIterar F
		--WHERE
		--	F.anio = @anioMaximo
	END TRY
	BEGIN CATCH
		EXEC [dbo].[SPManejoDeErrores] @ErrorLogId = 0 ,@CodigoDeError = 50016, @Descripcion = 'ERROR AL inicializar las variable principales para recorrer la simulación ([dbo].[SPSimulacion])'
		--RETURN @@ERROR;
	END CATCH
		--SELECT * FROM @FechasPorIterar
		-- Comezamo la simulación con un WHILE iniciando desde @primerDia hasta @ultimoDia.
		WHILE 
			@primerAnio <= @ultimoAnio

			BEGIN
				BEGIN TRY
					SELECT 
						@AnioDeOperacion = F.anio
					FROM
						@FechasPorIterar F
					WHERE 
						iterador = @primerAnio

					SET @anioNodo = @DocumentoXML.value('(/Year/@Id)[1]','INT')

				END TRY
				BEGIN CATCH
					EXEC [dbo].[SPManejoDeErrores] @ErrorLogId = 0 ,@CodigoDeError = 50017, @Descripcion = 'ERROR AL obtener el anio para ir iterando Simulación ([dbo].[SPSimulacion])'
					--RETURN @@ERROR;
				END CATCH

				BEGIN TRY
					INSERT INTO [dbo].[InstanciaGiro]
								(
									 [IdGiro]
									,[Año]
									,[FechaInicio]
									,[FechaFinal]
									,[CodigoInstacia]
								)
					SELECT	                                                                
								d.value('@IdGiro', 'INT')
								,YEAR(d.value('@FechaInicio', 'DATE'))
								,d.value('@FechaInicio', 'DATE')
								,d.value('@FechaFin', 'DATE')
								,d.value('@CodigoInstancia','VARCHAR(50)')

							
					FROM 
							@DocumentoXML.nodes('/Year[@Id eq sql:variable("@AnioDeOperacion")]/InstanciaGiro') AS t(d)
				END TRY
				BEGIN CATCH
						EXEC [dbo].[SPManejoDeErrores] @ErrorLogId = 0 ,@CodigoDeError = 50018, @Descripcion = 'ERROR AL insertar InstanciaGiro en simulación  ([dbo].[SPSimulacion])'
							--RETURN @@ERROR;
				END CATCH

				BEGIN TRY
					INSERT 
						@InstanciasPorIterar 
							(
								 idGiro
								,codigoInstancia
								,fechaInicio
								,fechaFin
								,anio
							)
					SELECT 
						 f.value('@IdGiro','INT')
						,f.value('@CodigoInstancia','VARCHAR(50)')
						,f.value('@FechaInicio','DATE')
						,f.value('@FechaFin','DATE')
						,YEAR(f.value('@FechaInicio', 'DATE'))
					FROM 
						@DocumentoXML.nodes('/Year[@Id eq sql:variable("@AnioDeOperacion")]/InstanciaGiro')AS t(f);
					
				END TRY
				BEGIN CATCH
					EXEC [dbo].[SPManejoDeErrores] @ErrorLogId = 0 ,@CodigoDeError = 50020, @Descripcion = 'ERROR AL insertar datos tabla instancias temporal a la simulación  ([dbo].[SPSimulacion])'
								--PENDIENTE revisar codigo error
					--RETURN @@ERROR;
				END CATCH

				
				
				--VAriables instancias
				SELECT 
					 @instanciaMinima = MIN(I.iterador)
					,@instanciaMaxima = MAX(I.iterador)
				FROM @InstanciasPorIterar I
				

				
				WHILE  --Inicio del while de las instancias por anio.
					@instanciaMinima <= @instanciaMaxima
					BEGIN
						--SELECT iterador,codigoInstancia FROM @InstanciasPorIterar
						BEGIN TRY
							SELECT 
								 @CodigoInstancia = codigoInstancia
								,@IdGiro = idGiro
								,@FechaInicio = fechaInicio
								,@FechaFin = fechaFin
							FROM
								@InstanciasPorIterar
							WHERE
								iterador = @instanciaMinima


						END TRY
						BEGIN CATCH
							EXEC [dbo].[SPManejoDeErrores] @ErrorLogId = 0 ,@CodigoDeError = 50021, @Descripcion = 'ERROR AL obtener la instancia para ir iterando Simulación ([dbo].[SPSimulacion])'
							--RETURN @@ERROR;
						END CATCH
						-- COMENZAMOS A PROCESAR LOS NODOS PRINCIPALES.
				
						 

						BEGIN TRY
							INSERT INTO [dbo].[InstanciaDeGiroPorEquipo]
									(
										 [IdInstanciaGiro]
										,[IdEquipo]
										,[TotalTiempo]
										,[TotalPuntos]
										,CodigoInstanciaGiro
											
									)
							SELECT	                                                                
									  IG.Id
									 ,E.Id
									 ,'0:00:00:00'
									 ,0
									 ,@CodigoInstancia
							 

							
							FROM 
									@DocumentoXML.nodes('/Year[@Id eq sql:variable("@AnioDeOperacion")]/InstanciaGiro[@CodigoInstancia eq sql:variable("@CodigoInstancia")]/GiroXEquipo') AS t(d)
							
									INNER JOIN [dbo].[InstanciaGiro] IG ON t.d.value('@CodigoInstanciaGiro', 'VARCHAR(50)') = IG.CodigoInstacia
									INNER JOIN [dbo].[Equipo] E ON t.d.value('@Equipo', 'INT') = E.Id
							ORDER BY 
								E.Id
							
						END TRY

						BEGIN CATCH
								EXEC [dbo].[SPManejoDeErrores] @ErrorLogId = 0 ,@CodigoDeError = 50019, @Descripcion = 'ERROR AL insertar InstanciaDeGiroPorEquipo en simulación  ([dbo].[SPSimulacion])'
									--RETURN @@ERROR;
						END CATCH

						BEGIN TRY
							INSERT INTO [dbo].[InstaciaDeGiroPorEquipoPorCorredor]
									(
										 [IdInstanciaDeGiroPorEquipo]
										,[IdCorredor]
										,[SumaTiempo]
										,[SumaPuntosRegularidad]
										,[SumaPuntosMontaña]
										,[NumeroCamisa]
											
									)
							SELECT	                                                                
									  IGE.Id
									 ,d.value('@Corredor', 'INT')
									 ,'00:00:00'
									 ,0
									 ,0
									 ,d.value('@NumeroCamisa', 'INT')
							 

							
							FROM 
									@DocumentoXML.nodes('/Year[@Id eq sql:variable("@AnioDeOperacion")]/InstanciaGiro[@CodigoInstancia eq sql:variable("@CodigoInstancia")]/CorredoresEnEquipoEnGiro') AS t(d)
							
									INNER JOIN [dbo].[Corredor] C ON t.d.value('@Corredor', 'INT') = C.Id
									INNER JOIN [dbo].[Giro] G ON G.Id = @IdGiro
									INNER JOIN [dbo].[InstanciaGiro] IG ON t.d.value('@CodigoInstanciaGiro', 'VARCHAR(50)') = IG.CodigoInstacia AND IG.IdGiro = G.Id
									INNER JOIN [dbo].[InstanciaDeGiroPorEquipo] IGE ON t.d.value('@Equipo', 'INT') = IGE.IdEquipo AND IG.Id = IGE.IdInstanciaGiro	
							ORDER BY
								C.Id

						END TRY
						BEGIN CATCH
								EXEC [dbo].[SPManejoDeErrores] @ErrorLogId = 0 ,@CodigoDeError = 50022, @Descripcion = 'ERROR AL insertar InstanciaDeGiroPorEquipoPorCorredor en simulación  ([dbo].[SPSimulacion])'
									--RETURN @@ERROR;
						END CATCH

						BEGIN TRY
							INSERT INTO [dbo].[Carrera]
									(
										 [IdEtapa]
										,[Fecha]
										,[HoraIncio]
										,[CodigoCarrera]	
									)
							SELECT	                                                                
									  ET.Id
									 ,d.value('@FechaCarrera', 'DATE')
									 ,d.value('@HoraInicio', 'TIME(0)')
									 ,d.value('@CodigoCarrera', 'VARCHAR(50)')
							FROM 
									@DocumentoXML.nodes('/Year[@Id eq sql:variable("@AnioDeOperacion")]/InstanciaGiro[@CodigoInstancia eq sql:variable("@CodigoInstancia")]/Carrera') AS t(d)
							
									INNER JOIN [dbo].[Giro] G ON G.Id = @IdGiro
									INNER JOIN [dbo].[InstanciaGiro] IG ON t.d.value('@CodigoInstanciaGiro', 'VARCHAR(50)') = IG.CodigoInstacia AND IG.IdGiro = G.Id
									INNER JOIN [dbo].[Etapa] ET ON t.d.value('@IdEtapa', 'INT') = ET.Id AND IG.IdGiro = G.Id
							ORDER BY
								FechaInicio
						END TRY

						BEGIN CATCH
								EXEC [dbo].[SPManejoDeErrores] @ErrorLogId = 0 ,@CodigoDeError = 50023, @Descripcion = 'ERROR AL insertar Carrera en simulación  ([dbo].[SPSimulacion])'
									--RETURN @@ERROR;
						END CATCH


						BEGIN TRY
							DELETE @tablaLlegadas
							INSERT @tablaLlegadas
									(
										 
										 [idCarrera]
										,[idCorredor]
										,[horaFin]
										,[idGiro]
										,[codigoInstancia]
									)
							SELECT	                                                                
									  CA.Id
									 ,CO.Id
									 ,d.value('@HoraLlegada', 'TIME(0)')
									 ,G.Id
									 ,@CodigoInstancia
									 --,ET.Puntos
									 --,@IdGiro
					
									
							FROM 
									@DocumentoXML.nodes('/Year[@Id eq sql:variable("@AnioDeOperacion")]/InstanciaGiro[@CodigoInstancia eq sql:variable("@CodigoInstancia")]/FinalCorredoresEnCarrera') AS t(d)
							
									INNER JOIN [dbo].[Giro] G ON G.Id = @IdGiro
									INNER JOIN [InstanciaGiro] IG ON IG.CodigoInstacia = @CodigoInstancia AND IG.IdGiro = G.Id
									INNER JOIN [InstanciaDeGiroPorEquipo] IGE ON IGE.IdInstanciaGiro = IG.Id
									INNER JOIN [Corredor] CO ON t.d.value('@NumeroCamisa', 'INT') = CO.Id
									
									INNER JOIN [dbo].[Carrera] CA ON t.d.value('@CodigoCarrera', 'VARCHAR(50)') = CA.CodigoCarrera --AND CA.IdEtapa = ET.Id
									INNER JOIN [dbo].[InstaciaDeGiroPorEquipoPorCorredor] IGEC ON t.d.value('@NumeroCamisa', 'INT') = IGEC.NumeroCamisa AND IGEC.IdInstanciaDeGiroPorEquipo = IGE.Id
									INNER JOIN [dbo].[Etapa] ET ON CA.IdEtapa = ET.Id AND ET.IdGiro = G.Id

							EXEC [SPLlegadasSimulacion] @tablaLlegadas;
						END TRY

						BEGIN CATCH
								EXEC [dbo].[SPManejoDeErrores] @ErrorLogId = 0 ,@CodigoDeError = 50024, @Descripcion = 'ERROR AL insertar Llegadas en tabla aux en simulación  ([dbo].[SPSimulacion])'
									--RETURN @@ERROR;
						END CATCH

						BEGIN TRY
							DELETE @TablaPremiosMontana
							INSERT @TablaPremiosMontana
									(
										 
										 [idCarrera]
										,[idCorredor]
										,[idPremioMontana]
										,[idGiro]
										,[codigoInstancia]
										,[idEtapa]
										,[puntosPorPremio]
										,[fecha]
									)
							SELECT	                                                                
									  CA.Id
									 ,CO.Id
									 ,PM.Id
									 ,G.Id
									 ,@CodigoInstancia
									 ,PM.IdEtapa
									 ,PM.Puntos
									 ,CA.Fecha
									 
					
									
							FROM 
									@DocumentoXML.nodes('/Year[@Id eq sql:variable("@AnioDeOperacion")]/InstanciaGiro[@CodigoInstancia eq sql:variable("@CodigoInstancia")]/GanadorPremioMontanaEnCarrera') AS t(d)
							
									INNER JOIN [dbo].[Giro] G ON G.Id = @IdGiro
									INNER JOIN [InstanciaGiro] IG ON IG.CodigoInstacia = @CodigoInstancia AND IG.IdGiro = G.Id
									INNER JOIN [InstanciaDeGiroPorEquipo] IGE ON IGE.IdInstanciaGiro = IG.Id
									INNER JOIN [Corredor] CO ON t.d.value('@NumeroCamisa', 'INT') = CO.Id
									INNER JOIN [PremioMontana] PM ON t.d.value('@NombrePremio', 'VARCHAR(50)') = PM.Nombre
									INNER JOIN [dbo].[Carrera] CA ON t.d.value('@CodigoCarrera', 'VARCHAR(50)') = CA.CodigoCarrera --AND CA.IdEtapa = ET.Id
									INNER JOIN [dbo].[InstaciaDeGiroPorEquipoPorCorredor] IGEC ON t.d.value('@NumeroCamisa', 'INT') = IGEC.NumeroCamisa AND IGEC.IdInstanciaDeGiroPorEquipo = IGE.Id
									INNER JOIN [dbo].[Etapa] ET ON CA.IdEtapa = ET.Id AND ET.IdGiro = G.Id

							EXEC [SPPremiosMontana] @TablaPremiosMontana;
						END TRY

						BEGIN CATCH
								EXEC [dbo].[SPManejoDeErrores] @ErrorLogId = 0 ,@CodigoDeError = 50024, @Descripcion = 'ERROR AL insertar Llegadas en tabla aux en simulación  ([dbo].[SPSimulacion])'
									--RETURN @@ERROR;
						END CATCH


						BEGIN TRY
							DELETE @TablaSanciones
							INSERT @TablaSanciones
									(
										 
										 [idCarrera]
										,[idCorredor]
										,[idJuez]
										,[idGiro]
										,[codigoInstancia]
										,[idEtapa]
										,[minutosCastigo]
										,[descripción]
									)
							SELECT	                                                                
									  CA.Id
									 ,CO.Id
									 ,J.Id
									 ,G.Id
									 ,@CodigoInstancia
									 ,ET.Id
									 ,d.value('@MinutosCastigo', 'INT')
									 ,d.value('@CodigoCarrera', 'VARCHAR(50)')
									 
					
									
							FROM 
									@DocumentoXML.nodes('/Year[@Id eq sql:variable("@AnioDeOperacion")]/InstanciaGiro[@CodigoInstancia eq sql:variable("@CodigoInstancia")]/SancionCarrera') AS t(d)
							
									INNER JOIN [dbo].[Giro] G ON G.Id = @IdGiro
									INNER JOIN [InstanciaGiro] IG ON IG.CodigoInstacia = @CodigoInstancia AND IG.IdGiro = G.Id
									INNER JOIN [InstanciaDeGiroPorEquipo] IGE ON IGE.IdInstanciaGiro = IG.Id
									INNER JOIN [Corredor] CO ON t.d.value('@NumeroCamisa', 'INT') = CO.Id
									INNER JOIN [dbo].[Carrera] CA ON t.d.value('@CodigoCarrera', 'VARCHAR(50)') = CA.CodigoCarrera --AND CA.IdEtapa = ET.Id
									INNER JOIN [dbo].[InstaciaDeGiroPorEquipoPorCorredor] IGEC ON t.d.value('@NumeroCamisa', 'INT') = IGEC.NumeroCamisa AND IGEC.IdInstanciaDeGiroPorEquipo = IGE.Id
									INNER JOIN [dbo].[Etapa] ET ON CA.IdEtapa = ET.Id AND ET.IdGiro = G.Id
									INNER JOIN Juez J ON J.Id = t.d.value('@IdJuez', 'INT')

							EXEC [SPSancionesSimulacion] @tablaSanciones;
						END TRY

						BEGIN CATCH
								EXEC [dbo].[SPManejoDeErrores] @ErrorLogId = 0 ,@CodigoDeError = 50036, @Descripcion = 'ERROR AL insertar sanciones en tabla aux en simulación  ([dbo].[SPSimulacion])'
									--RETURN @@ERROR;
						END CATCH


					SET @instanciaMinima = @instanciaMinima + 1
					--SET @primerAnio = 10
				END --Fin del while interno

				DELETE @InstanciasPorIterar
				--DBCC CHECKIDENT ('[@InstanciasPorIterar]', RESEED, 0) --para los identity

			SET @primerAnio = @primerAnio + 1;

		END --Fin WHILE

		

END
GO
/****** Object:  StoredProcedure [dbo].[SPVaciar_Tablas]    Script Date: 3/2/2021 10:23:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   PROCEDURE [dbo].[SPVaciar_Tablas]
AS
BEGIN
	SET NOCOUNT ON;
	BEGIN TRY

		DELETE FROM  [dbo].[DebitoPorSancion]
			DBCC CHECKIDENT ('[DebitoPorSancion]', RESEED, 0) --para los identity

		DELETE FROM  [dbo].[SancionesPorCarrera]
			DBCC CHECKIDENT ('[SancionesPorCarrera]', RESEED, 0) --para los identity

		DELETE FROM  [dbo].[MovimientosTiempo]
			DBCC CHECKIDENT ('[MovimientosTiempo]', RESEED, 0) --para los identity
		DELETE FROM  [dbo].[TipoMovimientoTiempo]

		DELETE FROM  [dbo].[MovimientosPuntosMontaña]
			DBCC CHECKIDENT ('[MovimientosPuntosMontaña]', RESEED, 0) --para los identity
		DELETE FROM  [dbo].[TipoMovimientoPuntosMontaña]

		DELETE FROM  [dbo].[MovimientosPuntosRegular]
			DBCC CHECKIDENT ('[MovimientosPuntosRegular]', RESEED, 0) --para los identity
		DELETE FROM  [dbo].[TipoMovimientosPuntosRegular]

		DELETE FROM  [dbo].[Llegada]
			DBCC CHECKIDENT ('[Llegada]', RESEED, 0) --para los identity

		DELETE FROM  [dbo].[InstaciaDeGiroPorEquipoPorCorredor]
			DBCC CHECKIDENT ('[InstaciaDeGiroPorEquipoPorCorredor]', RESEED, 0) --para los identity

		DELETE FROM  [dbo].[InstanciaDeGiroPorEquipo]
			DBCC CHECKIDENT ('[InstanciaDeGiroPorEquipo]', RESEED, 0) --para los identity
		
		DELETE FROM  [dbo].[Carrera]
			DBCC CHECKIDENT ('[Carrera]', RESEED, 0) --para los identity

		DELETE FROM  [dbo].[InstanciaGiro]
			DBCC CHECKIDENT ('[InstanciaGiro]', RESEED, 0) --para los identity
		

		-- Borrado de Catalogos
		DELETE FROM  [dbo].[PremioMontana]
		DELETE FROM  [dbo].[Etapa]
		DELETE FROM  [dbo].[Giro]
		DELETE FROM  [dbo].[Pais]
		DELETE FROM  [dbo].[Equipo]
		DELETE FROM  [dbo].[Corredor]
		DELETE FROM  [dbo].[Juez]
		DELETE FROM  [dbo].[TipoMovimientoTiempo]
		DELETE FROM  [dbo].[ErrorLog]


	END TRY
	BEGIN CATCH
		EXEC [dbo].[SPManejoDeErrores] @ErrorLogId = 0 ,@CodigoDeError = 50012, @Descripcion = 'ERROR AL vaciar las tablas ()'
		--RETURN 'Error 50012'
		RETURN @@ERROR;
	END CATCH
	SET NOCOUNT OFF;
	

END



GO
/****** Object:  StoredProcedure [dbo].[SPValidarGiro]    Script Date: 3/2/2021 10:23:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- SP para verificar Giro

CREATE  PROCEDURE 
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
GO
/****** Object:  StoredProcedure [dbo].[SPVerTablaErrores]    Script Date: 3/2/2021 10:23:29 ******/
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
GO
USE [master]
GO
ALTER DATABASE [ProyectoFinal_BD] SET  READ_WRITE 
GO
