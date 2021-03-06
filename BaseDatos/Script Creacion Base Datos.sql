USE [master]
GO
/****** Object:  Database [SistemaSeguros]    Script Date: 27/7/2020 12:12:26 ******/
CREATE DATABASE [SistemaSeguros]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SistemaSeguros', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\SistemaSeguros.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'SistemaSeguros_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\SistemaSeguros_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [SistemaSeguros] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SistemaSeguros].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SistemaSeguros] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SistemaSeguros] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SistemaSeguros] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SistemaSeguros] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SistemaSeguros] SET ARITHABORT OFF 
GO
ALTER DATABASE [SistemaSeguros] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SistemaSeguros] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SistemaSeguros] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SistemaSeguros] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SistemaSeguros] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SistemaSeguros] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SistemaSeguros] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SistemaSeguros] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SistemaSeguros] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SistemaSeguros] SET  DISABLE_BROKER 
GO
ALTER DATABASE [SistemaSeguros] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SistemaSeguros] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SistemaSeguros] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SistemaSeguros] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SistemaSeguros] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SistemaSeguros] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SistemaSeguros] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SistemaSeguros] SET RECOVERY FULL 
GO
ALTER DATABASE [SistemaSeguros] SET  MULTI_USER 
GO
ALTER DATABASE [SistemaSeguros] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SistemaSeguros] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SistemaSeguros] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SistemaSeguros] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [SistemaSeguros] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'SistemaSeguros', N'ON'
GO
ALTER DATABASE [SistemaSeguros] SET QUERY_STORE = OFF
GO
/* For security reasons the login is created disabled and with a random password. */
/****** Object:  Login [UsuarioSistemaSeg]    Script Date: 27/7/2020 12:12:26 ******/
CREATE LOGIN [UsuarioSistemaSeg] WITH PASSWORD=N'zjtqurHSqDXExlQU8emdDIhUuQSJCdkSQlzlDDZFFCw=', DEFAULT_DATABASE=[SistemaSeguros], DEFAULT_LANGUAGE=[us_english], CHECK_EXPIRATION=OFF, CHECK_POLICY=ON
GO
ALTER LOGIN [UsuarioSistemaSeg] DISABLE
GO
/****** Object:  Login [NT SERVICE\Winmgmt]    Script Date: 27/7/2020 12:12:26 ******/
CREATE LOGIN [NT SERVICE\Winmgmt] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english]
GO
/****** Object:  Login [NT SERVICE\SQLWriter]    Script Date: 27/7/2020 12:12:26 ******/
CREATE LOGIN [NT SERVICE\SQLWriter] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english]
GO
/****** Object:  Login [NT SERVICE\SQLTELEMETRY]    Script Date: 27/7/2020 12:12:26 ******/
CREATE LOGIN [NT SERVICE\SQLTELEMETRY] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english]
GO
/****** Object:  Login [NT SERVICE\SQLSERVERAGENT]    Script Date: 27/7/2020 12:12:26 ******/
CREATE LOGIN [NT SERVICE\SQLSERVERAGENT] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english]
GO
/****** Object:  Login [NT Service\MSSQLSERVER]    Script Date: 27/7/2020 12:12:26 ******/
CREATE LOGIN [NT Service\MSSQLSERVER] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english]
GO
/****** Object:  Login [NT AUTHORITY\SYSTEM]    Script Date: 27/7/2020 12:12:26 ******/
CREATE LOGIN [NT AUTHORITY\SYSTEM] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english]
GO
/****** Object:  Login [KVMDEV01\Administrator]    Script Date: 27/7/2020 12:12:26 ******/
CREATE LOGIN [KVMDEV01\Administrator] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english]
GO
/* For security reasons the login is created disabled and with a random password. */
/****** Object:  Login [##MS_PolicyTsqlExecutionLogin##]    Script Date: 27/7/2020 12:12:26 ******/
CREATE LOGIN [##MS_PolicyTsqlExecutionLogin##] WITH PASSWORD=N'GTbKv+iwfxN4LdON8u5B3qITgPINv70U3R+JKqkW5Fk=', DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english], CHECK_EXPIRATION=OFF, CHECK_POLICY=ON
GO
ALTER LOGIN [##MS_PolicyTsqlExecutionLogin##] DISABLE
GO
/* For security reasons the login is created disabled and with a random password. */
/****** Object:  Login [##MS_PolicyEventProcessingLogin##]    Script Date: 27/7/2020 12:12:26 ******/
CREATE LOGIN [##MS_PolicyEventProcessingLogin##] WITH PASSWORD=N'61Eo212tMiihEM9JGjrNn5xX8cCm9vxZ8qfSCcS9AsE=', DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english], CHECK_EXPIRATION=OFF, CHECK_POLICY=ON
GO
ALTER LOGIN [##MS_PolicyEventProcessingLogin##] DISABLE
GO
ALTER AUTHORIZATION ON DATABASE::[SistemaSeguros] TO [sa]
GO
ALTER SERVER ROLE [sysadmin] ADD MEMBER [NT SERVICE\Winmgmt]
GO
ALTER SERVER ROLE [sysadmin] ADD MEMBER [NT SERVICE\SQLWriter]
GO
ALTER SERVER ROLE [sysadmin] ADD MEMBER [NT SERVICE\SQLSERVERAGENT]
GO
ALTER SERVER ROLE [sysadmin] ADD MEMBER [NT Service\MSSQLSERVER]
GO
ALTER SERVER ROLE [sysadmin] ADD MEMBER [KVMDEV01\Administrator]
GO
USE [SistemaSeguros]
GO
/****** Object:  User [UsuarioSistemaSeg]    Script Date: 27/7/2020 12:12:26 ******/
CREATE USER [UsuarioSistemaSeg] FOR LOGIN [UsuarioSistemaSeg] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_datareader] ADD MEMBER [UsuarioSistemaSeg]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [UsuarioSistemaSeg]
GO
GRANT VIEW ANY COLUMN ENCRYPTION KEY DEFINITION TO [public] AS [dbo]
GO
GRANT VIEW ANY COLUMN MASTER KEY DEFINITION TO [public] AS [dbo]
GO
GRANT CONNECT TO [UsuarioSistemaSeg] AS [dbo]
GO
GRANT DELETE TO [UsuarioSistemaSeg] AS [dbo]
GO
GRANT EXECUTE TO [UsuarioSistemaSeg] AS [dbo]
GO
GRANT INSERT TO [UsuarioSistemaSeg] AS [dbo]
GO
GRANT REFERENCES TO [UsuarioSistemaSeg] AS [dbo]
GO
GRANT SELECT TO [UsuarioSistemaSeg] AS [dbo]
GO
GRANT SHOWPLAN TO [UsuarioSistemaSeg] AS [dbo]
GO
GRANT UPDATE TO [UsuarioSistemaSeg] AS [dbo]
GO
/****** Object:  Table [dbo].[Cliente]    Script Date: 27/7/2020 12:12:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cliente](
	[Identificacion] [varchar](25) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Apellidos] [varchar](100) NOT NULL,
	[FechaNacimiento] [datetime] NOT NULL,
	[Direccion] [varchar](200) NOT NULL,
 CONSTRAINT [PK_Cliente] PRIMARY KEY CLUSTERED 
(
	[Identificacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER AUTHORIZATION ON [dbo].[Cliente] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[Cobertura]    Script Date: 27/7/2020 12:12:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cobertura](
	[ID_Cobertura] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](100) NOT NULL,
	[Descripcion] [varchar](200) NOT NULL,
	[PrecioMensual] [float] NOT NULL,
 CONSTRAINT [PK_Cobertura] PRIMARY KEY CLUSTERED 
(
	[ID_Cobertura] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER AUTHORIZATION ON [dbo].[Cobertura] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[CoberturaPorPoliza]    Script Date: 27/7/2020 12:12:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CoberturaPorPoliza](
	[FK_Poliza] [int] NOT NULL,
	[FK_Cobertura] [int] NOT NULL,
 CONSTRAINT [PK_CoberturaPorPoliza] PRIMARY KEY CLUSTERED 
(
	[FK_Poliza] ASC,
	[FK_Cobertura] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER AUTHORIZATION ON [dbo].[CoberturaPorPoliza] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[CoberturaPorPolizaCliente]    Script Date: 27/7/2020 12:12:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CoberturaPorPolizaCliente](
	[FK_IDPolizaPorCliente] [int] NOT NULL,
	[FK_IDCobertura] [int] NOT NULL,
	[PorcentajeCobertura] [int] NOT NULL,
 CONSTRAINT [PK_CoberturaPorPolizaCliente] PRIMARY KEY CLUSTERED 
(
	[FK_IDPolizaPorCliente] ASC,
	[FK_IDCobertura] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER AUTHORIZATION ON [dbo].[CoberturaPorPolizaCliente] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[EstadoPoliza]    Script Date: 27/7/2020 12:12:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EstadoPoliza](
	[Codigo] [int] NOT NULL,
	[Descripcion] [varchar](50) NOT NULL,
 CONSTRAINT [PK_EstadoPoliza] PRIMARY KEY CLUSTERED 
(
	[Codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER AUTHORIZATION ON [dbo].[EstadoPoliza] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[Poliza]    Script Date: 27/7/2020 12:12:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Poliza](
	[ID_Poliza] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](100) NOT NULL,
	[Descripcion] [varchar](250) NOT NULL,
	[FK_TipoRiesgo] [int] NOT NULL,
 CONSTRAINT [PK_Poliza] PRIMARY KEY CLUSTERED 
(
	[ID_Poliza] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER AUTHORIZATION ON [dbo].[Poliza] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[PolizaPorCliente]    Script Date: 27/7/2020 12:12:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PolizaPorCliente](
	[ID_PolizaCliente] [int] IDENTITY(1,1) NOT NULL,
	[FK_IDCliente] [varchar](25) NOT NULL,
	[FK_IDPoliza] [int] NOT NULL,
	[InicioVigenciaPoliza] [datetime] NOT NULL,
	[PrecioPolizaAdquirida] [float] NOT NULL,
	[MesesCobertura] [int] NOT NULL,
	[FK_IDEstado] [int] NOT NULL,
 CONSTRAINT [PK_PolizaPorCliente] PRIMARY KEY CLUSTERED 
(
	[ID_PolizaCliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER AUTHORIZATION ON [dbo].[PolizaPorCliente] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[TipoRiesgo]    Script Date: 27/7/2020 12:12:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoRiesgo](
	[ID_Riesgo] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
 CONSTRAINT [PK_TipoRiesgo] PRIMARY KEY CLUSTERED 
(
	[ID_Riesgo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER AUTHORIZATION ON [dbo].[TipoRiesgo] TO  SCHEMA OWNER 
GO
INSERT [dbo].[Cliente] ([Identificacion], [Nombre], [Apellidos], [FechaNacimiento], [Direccion]) VALUES (N'100BB', N'Kirst', N'Heiden', CAST(N'1969-02-01T00:00:00.000' AS DateTime), N'Medellín, carrera 70, frente estación del Metro')
INSERT [dbo].[Cliente] ([Identificacion], [Nombre], [Apellidos], [FechaNacimiento], [Direccion]) VALUES (N'111222333', N'Pablo', N'Mirna Sulivan', CAST(N'2009-12-12T00:00:00.000' AS DateTime), N'Calle 6 avenida 5 Bucaramanga')
INSERT [dbo].[Cliente] ([Identificacion], [Nombre], [Apellidos], [FechaNacimiento], [Direccion]) VALUES (N'666888555', N'Kenneth', N'Valverde Mora', CAST(N'2019-01-02T00:00:00.000' AS DateTime), N'Jacó, Frente a la playa')
INSERT [dbo].[Cliente] ([Identificacion], [Nombre], [Apellidos], [FechaNacimiento], [Direccion]) VALUES (N'66699988', N'Lorena', N'Muñoz Isaza', CAST(N'2000-01-01T00:00:00.000' AS DateTime), N'Medellín, Parque Lleras')
INSERT [dbo].[Cliente] ([Identificacion], [Nombre], [Apellidos], [FechaNacimiento], [Direccion]) VALUES (N'674894844', N'Luis', N'Mora Guti', CAST(N'1980-01-01T00:00:00.000' AS DateTime), N'Cundinamarca, calle frente a solar Badilla')
GO
SET IDENTITY_INSERT [dbo].[Cobertura] ON 

INSERT [dbo].[Cobertura] ([ID_Cobertura], [Nombre], [Descripcion], [PrecioMensual]) VALUES (1, N'Choques', N'Contra Choques en via publica', 20000)
INSERT [dbo].[Cobertura] ([ID_Cobertura], [Nombre], [Descripcion], [PrecioMensual]) VALUES (2, N'Incendio', N'Accidente por incendio', 5000)
INSERT [dbo].[Cobertura] ([ID_Cobertura], [Nombre], [Descripcion], [PrecioMensual]) VALUES (3, N'Siniestro', N'Accidente por choque multiple', 50000)
INSERT [dbo].[Cobertura] ([ID_Cobertura], [Nombre], [Descripcion], [PrecioMensual]) VALUES (4, N'Robo', N'Robo de vivienda', 30000)
INSERT [dbo].[Cobertura] ([ID_Cobertura], [Nombre], [Descripcion], [PrecioMensual]) VALUES (5, N'Daño Terceros', N'Daño vivienda por terceras personas', 35000)
INSERT [dbo].[Cobertura] ([ID_Cobertura], [Nombre], [Descripcion], [PrecioMensual]) VALUES (6, N'Quebradura', N'Quebradura de hueso', 100000)
INSERT [dbo].[Cobertura] ([ID_Cobertura], [Nombre], [Descripcion], [PrecioMensual]) VALUES (7, N'Torcedura', N'Torcedura de algún miembro del cuerpo', 30000)
INSERT [dbo].[Cobertura] ([ID_Cobertura], [Nombre], [Descripcion], [PrecioMensual]) VALUES (8, N'Picadura', N'Picadura de animal venenoso', 100000)
INSERT [dbo].[Cobertura] ([ID_Cobertura], [Nombre], [Descripcion], [PrecioMensual]) VALUES (10, N'Muerte', N'Muerte accidental', 200000)
SET IDENTITY_INSERT [dbo].[Cobertura] OFF
GO
INSERT [dbo].[CoberturaPorPoliza] ([FK_Poliza], [FK_Cobertura]) VALUES (1, 1)
INSERT [dbo].[CoberturaPorPoliza] ([FK_Poliza], [FK_Cobertura]) VALUES (1, 2)
INSERT [dbo].[CoberturaPorPoliza] ([FK_Poliza], [FK_Cobertura]) VALUES (1, 3)
INSERT [dbo].[CoberturaPorPoliza] ([FK_Poliza], [FK_Cobertura]) VALUES (2, 4)
INSERT [dbo].[CoberturaPorPoliza] ([FK_Poliza], [FK_Cobertura]) VALUES (2, 5)
INSERT [dbo].[CoberturaPorPoliza] ([FK_Poliza], [FK_Cobertura]) VALUES (3, 6)
INSERT [dbo].[CoberturaPorPoliza] ([FK_Poliza], [FK_Cobertura]) VALUES (3, 7)
INSERT [dbo].[CoberturaPorPoliza] ([FK_Poliza], [FK_Cobertura]) VALUES (3, 8)
INSERT [dbo].[CoberturaPorPoliza] ([FK_Poliza], [FK_Cobertura]) VALUES (3, 10)
INSERT [dbo].[CoberturaPorPoliza] ([FK_Poliza], [FK_Cobertura]) VALUES (4, 6)
INSERT [dbo].[CoberturaPorPoliza] ([FK_Poliza], [FK_Cobertura]) VALUES (4, 7)
INSERT [dbo].[CoberturaPorPoliza] ([FK_Poliza], [FK_Cobertura]) VALUES (5, 6)
INSERT [dbo].[CoberturaPorPoliza] ([FK_Poliza], [FK_Cobertura]) VALUES (5, 7)
INSERT [dbo].[CoberturaPorPoliza] ([FK_Poliza], [FK_Cobertura]) VALUES (5, 10)
GO
INSERT [dbo].[CoberturaPorPolizaCliente] ([FK_IDPolizaPorCliente], [FK_IDCobertura], [PorcentajeCobertura]) VALUES (11, 4, 10)
INSERT [dbo].[CoberturaPorPolizaCliente] ([FK_IDPolizaPorCliente], [FK_IDCobertura], [PorcentajeCobertura]) VALUES (11, 5, 0)
INSERT [dbo].[CoberturaPorPolizaCliente] ([FK_IDPolizaPorCliente], [FK_IDCobertura], [PorcentajeCobertura]) VALUES (29, 4, 0)
INSERT [dbo].[CoberturaPorPolizaCliente] ([FK_IDPolizaPorCliente], [FK_IDCobertura], [PorcentajeCobertura]) VALUES (29, 5, 50)
INSERT [dbo].[CoberturaPorPolizaCliente] ([FK_IDPolizaPorCliente], [FK_IDCobertura], [PorcentajeCobertura]) VALUES (31, 1, 23)
INSERT [dbo].[CoberturaPorPolizaCliente] ([FK_IDPolizaPorCliente], [FK_IDCobertura], [PorcentajeCobertura]) VALUES (31, 2, 0)
INSERT [dbo].[CoberturaPorPolizaCliente] ([FK_IDPolizaPorCliente], [FK_IDCobertura], [PorcentajeCobertura]) VALUES (31, 3, 0)
INSERT [dbo].[CoberturaPorPolizaCliente] ([FK_IDPolizaPorCliente], [FK_IDCobertura], [PorcentajeCobertura]) VALUES (34, 1, 12)
INSERT [dbo].[CoberturaPorPolizaCliente] ([FK_IDPolizaPorCliente], [FK_IDCobertura], [PorcentajeCobertura]) VALUES (34, 2, 0)
INSERT [dbo].[CoberturaPorPolizaCliente] ([FK_IDPolizaPorCliente], [FK_IDCobertura], [PorcentajeCobertura]) VALUES (34, 3, 0)
INSERT [dbo].[CoberturaPorPolizaCliente] ([FK_IDPolizaPorCliente], [FK_IDCobertura], [PorcentajeCobertura]) VALUES (35, 4, 12)
INSERT [dbo].[CoberturaPorPolizaCliente] ([FK_IDPolizaPorCliente], [FK_IDCobertura], [PorcentajeCobertura]) VALUES (35, 5, 0)
INSERT [dbo].[CoberturaPorPolizaCliente] ([FK_IDPolizaPorCliente], [FK_IDCobertura], [PorcentajeCobertura]) VALUES (39, 1, 11)
INSERT [dbo].[CoberturaPorPolizaCliente] ([FK_IDPolizaPorCliente], [FK_IDCobertura], [PorcentajeCobertura]) VALUES (39, 2, 10)
INSERT [dbo].[CoberturaPorPolizaCliente] ([FK_IDPolizaPorCliente], [FK_IDCobertura], [PorcentajeCobertura]) VALUES (39, 3, 20)
INSERT [dbo].[CoberturaPorPolizaCliente] ([FK_IDPolizaPorCliente], [FK_IDCobertura], [PorcentajeCobertura]) VALUES (41, 6, 12)
INSERT [dbo].[CoberturaPorPolizaCliente] ([FK_IDPolizaPorCliente], [FK_IDCobertura], [PorcentajeCobertura]) VALUES (41, 7, 45)
INSERT [dbo].[CoberturaPorPolizaCliente] ([FK_IDPolizaPorCliente], [FK_IDCobertura], [PorcentajeCobertura]) VALUES (41, 8, 34)
INSERT [dbo].[CoberturaPorPolizaCliente] ([FK_IDPolizaPorCliente], [FK_IDCobertura], [PorcentajeCobertura]) VALUES (41, 10, 13)
INSERT [dbo].[CoberturaPorPolizaCliente] ([FK_IDPolizaPorCliente], [FK_IDCobertura], [PorcentajeCobertura]) VALUES (56, 4, 20)
INSERT [dbo].[CoberturaPorPolizaCliente] ([FK_IDPolizaPorCliente], [FK_IDCobertura], [PorcentajeCobertura]) VALUES (56, 5, 0)
INSERT [dbo].[CoberturaPorPolizaCliente] ([FK_IDPolizaPorCliente], [FK_IDCobertura], [PorcentajeCobertura]) VALUES (57, 6, 40)
INSERT [dbo].[CoberturaPorPolizaCliente] ([FK_IDPolizaPorCliente], [FK_IDCobertura], [PorcentajeCobertura]) VALUES (57, 7, 0)
INSERT [dbo].[CoberturaPorPolizaCliente] ([FK_IDPolizaPorCliente], [FK_IDCobertura], [PorcentajeCobertura]) VALUES (57, 8, 0)
INSERT [dbo].[CoberturaPorPolizaCliente] ([FK_IDPolizaPorCliente], [FK_IDCobertura], [PorcentajeCobertura]) VALUES (57, 10, 0)
INSERT [dbo].[CoberturaPorPolizaCliente] ([FK_IDPolizaPorCliente], [FK_IDCobertura], [PorcentajeCobertura]) VALUES (58, 6, 10)
INSERT [dbo].[CoberturaPorPolizaCliente] ([FK_IDPolizaPorCliente], [FK_IDCobertura], [PorcentajeCobertura]) VALUES (58, 7, 20)
INSERT [dbo].[CoberturaPorPolizaCliente] ([FK_IDPolizaPorCliente], [FK_IDCobertura], [PorcentajeCobertura]) VALUES (58, 8, 30)
INSERT [dbo].[CoberturaPorPolizaCliente] ([FK_IDPolizaPorCliente], [FK_IDCobertura], [PorcentajeCobertura]) VALUES (58, 10, 10)
INSERT [dbo].[CoberturaPorPolizaCliente] ([FK_IDPolizaPorCliente], [FK_IDCobertura], [PorcentajeCobertura]) VALUES (60, 6, 90)
INSERT [dbo].[CoberturaPorPolizaCliente] ([FK_IDPolizaPorCliente], [FK_IDCobertura], [PorcentajeCobertura]) VALUES (60, 7, 90)
GO
INSERT [dbo].[EstadoPoliza] ([Codigo], [Descripcion]) VALUES (1, N'Activa')
INSERT [dbo].[EstadoPoliza] ([Codigo], [Descripcion]) VALUES (2, N'Cancelada')
GO
SET IDENTITY_INSERT [dbo].[Poliza] ON 

INSERT [dbo].[Poliza] ([ID_Poliza], [Nombre], [Descripcion], [FK_TipoRiesgo]) VALUES (1, N'Seguro Automoviles', N'Seguro de protección extendida de automóviles', 2)
INSERT [dbo].[Poliza] ([ID_Poliza], [Nombre], [Descripcion], [FK_TipoRiesgo]) VALUES (2, N'Seguro de Casas', N'Seguro de Protección de Vivienda', 3)
INSERT [dbo].[Poliza] ([ID_Poliza], [Nombre], [Descripcion], [FK_TipoRiesgo]) VALUES (3, N'Seguro Deportes', N'Seguro para actividades deportivas de alto riesgo', 4)
INSERT [dbo].[Poliza] ([ID_Poliza], [Nombre], [Descripcion], [FK_TipoRiesgo]) VALUES (4, N'Seguro Médico', N'Seguro para trabajadores Oficina', 1)
INSERT [dbo].[Poliza] ([ID_Poliza], [Nombre], [Descripcion], [FK_TipoRiesgo]) VALUES (5, N'Seguro Trabajo Construcción', N'Para personas que trabajan en construcción', 4)
SET IDENTITY_INSERT [dbo].[Poliza] OFF
GO
SET IDENTITY_INSERT [dbo].[PolizaPorCliente] ON 

INSERT [dbo].[PolizaPorCliente] ([ID_PolizaCliente], [FK_IDCliente], [FK_IDPoliza], [InicioVigenciaPoliza], [PrecioPolizaAdquirida], [MesesCobertura], [FK_IDEstado]) VALUES (11, N'111222333', 2, CAST(N'2020-12-06T00:00:00.000' AS DateTime), 9000, 3, 1)
INSERT [dbo].[PolizaPorCliente] ([ID_PolizaCliente], [FK_IDCliente], [FK_IDPoliza], [InicioVigenciaPoliza], [PrecioPolizaAdquirida], [MesesCobertura], [FK_IDEstado]) VALUES (29, N'674894844', 1, CAST(N'1900-12-12T00:00:00.000' AS DateTime), 2117500, 121, 1)
INSERT [dbo].[PolizaPorCliente] ([ID_PolizaCliente], [FK_IDCliente], [FK_IDPoliza], [InicioVigenciaPoliza], [PrecioPolizaAdquirida], [MesesCobertura], [FK_IDEstado]) VALUES (31, N'674894844', 1, CAST(N'2020-07-26T00:00:00.000' AS DateTime), 55200, 12, 1)
INSERT [dbo].[PolizaPorCliente] ([ID_PolizaCliente], [FK_IDCliente], [FK_IDPoliza], [InicioVigenciaPoliza], [PrecioPolizaAdquirida], [MesesCobertura], [FK_IDEstado]) VALUES (34, N'111222333', 1, CAST(N'2020-07-10T06:00:00.000' AS DateTime), 28800, 12, 1)
INSERT [dbo].[PolizaPorCliente] ([ID_PolizaCliente], [FK_IDCliente], [FK_IDPoliza], [InicioVigenciaPoliza], [PrecioPolizaAdquirida], [MesesCobertura], [FK_IDEstado]) VALUES (35, N'111222333', 1, CAST(N'2020-07-26T06:00:00.000' AS DateTime), 72000, 20, 1)
INSERT [dbo].[PolizaPorCliente] ([ID_PolizaCliente], [FK_IDCliente], [FK_IDPoliza], [InicioVigenciaPoliza], [PrecioPolizaAdquirida], [MesesCobertura], [FK_IDEstado]) VALUES (39, N'100BB', 2, CAST(N'2021-03-23T06:00:00.000' AS DateTime), 25400, 2, 1)
INSERT [dbo].[PolizaPorCliente] ([ID_PolizaCliente], [FK_IDCliente], [FK_IDPoliza], [InicioVigenciaPoliza], [PrecioPolizaAdquirida], [MesesCobertura], [FK_IDEstado]) VALUES (41, N'674894844', 3, CAST(N'2020-07-17T06:00:00.000' AS DateTime), 1423200, 12, 1)
INSERT [dbo].[PolizaPorCliente] ([ID_PolizaCliente], [FK_IDCliente], [FK_IDPoliza], [InicioVigenciaPoliza], [PrecioPolizaAdquirida], [MesesCobertura], [FK_IDEstado]) VALUES (56, N'100BB', 2, CAST(N'2020-07-23T12:00:00.000' AS DateTime), 72000, 12, 2)
INSERT [dbo].[PolizaPorCliente] ([ID_PolizaCliente], [FK_IDCliente], [FK_IDPoliza], [InicioVigenciaPoliza], [PrecioPolizaAdquirida], [MesesCobertura], [FK_IDEstado]) VALUES (57, N'100BB', 3, CAST(N'2020-07-30T12:00:00.000' AS DateTime), 1360000, 34, 2)
INSERT [dbo].[PolizaPorCliente] ([ID_PolizaCliente], [FK_IDCliente], [FK_IDPoliza], [InicioVigenciaPoliza], [PrecioPolizaAdquirida], [MesesCobertura], [FK_IDEstado]) VALUES (58, N'666888555', 3, CAST(N'2020-07-30T06:00:00.000' AS DateTime), 3300000, 50, 1)
INSERT [dbo].[PolizaPorCliente] ([ID_PolizaCliente], [FK_IDCliente], [FK_IDPoliza], [InicioVigenciaPoliza], [PrecioPolizaAdquirida], [MesesCobertura], [FK_IDEstado]) VALUES (60, N'66699988', 4, CAST(N'2020-07-27T06:00:00.000' AS DateTime), 1404000, 12, 1)
SET IDENTITY_INSERT [dbo].[PolizaPorCliente] OFF
GO
SET IDENTITY_INSERT [dbo].[TipoRiesgo] ON 

INSERT [dbo].[TipoRiesgo] ([ID_Riesgo], [Nombre]) VALUES (1, N'Bajo')
INSERT [dbo].[TipoRiesgo] ([ID_Riesgo], [Nombre]) VALUES (2, N'Medio')
INSERT [dbo].[TipoRiesgo] ([ID_Riesgo], [Nombre]) VALUES (3, N'Medio-Alto')
INSERT [dbo].[TipoRiesgo] ([ID_Riesgo], [Nombre]) VALUES (4, N'Alto')
SET IDENTITY_INSERT [dbo].[TipoRiesgo] OFF
GO
ALTER TABLE [dbo].[CoberturaPorPoliza]  WITH CHECK ADD  CONSTRAINT [FK_CoberturaPorPoliza_Cobertura] FOREIGN KEY([FK_Cobertura])
REFERENCES [dbo].[Cobertura] ([ID_Cobertura])
GO
ALTER TABLE [dbo].[CoberturaPorPoliza] CHECK CONSTRAINT [FK_CoberturaPorPoliza_Cobertura]
GO
ALTER TABLE [dbo].[CoberturaPorPoliza]  WITH CHECK ADD  CONSTRAINT [FK_CoberturaPorPoliza_Poliza] FOREIGN KEY([FK_Poliza])
REFERENCES [dbo].[Poliza] ([ID_Poliza])
GO
ALTER TABLE [dbo].[CoberturaPorPoliza] CHECK CONSTRAINT [FK_CoberturaPorPoliza_Poliza]
GO
ALTER TABLE [dbo].[CoberturaPorPolizaCliente]  WITH CHECK ADD  CONSTRAINT [FK_CoberturaPorPolizaCliente_Cobertura] FOREIGN KEY([FK_IDCobertura])
REFERENCES [dbo].[Cobertura] ([ID_Cobertura])
GO
ALTER TABLE [dbo].[CoberturaPorPolizaCliente] CHECK CONSTRAINT [FK_CoberturaPorPolizaCliente_Cobertura]
GO
ALTER TABLE [dbo].[CoberturaPorPolizaCliente]  WITH CHECK ADD  CONSTRAINT [FK_CoberturaPorPolizaCliente_PolizaPorCliente] FOREIGN KEY([FK_IDPolizaPorCliente])
REFERENCES [dbo].[PolizaPorCliente] ([ID_PolizaCliente])
GO
ALTER TABLE [dbo].[CoberturaPorPolizaCliente] CHECK CONSTRAINT [FK_CoberturaPorPolizaCliente_PolizaPorCliente]
GO
ALTER TABLE [dbo].[Poliza]  WITH CHECK ADD  CONSTRAINT [FK_Poliza_TipoRiesgo] FOREIGN KEY([FK_TipoRiesgo])
REFERENCES [dbo].[TipoRiesgo] ([ID_Riesgo])
GO
ALTER TABLE [dbo].[Poliza] CHECK CONSTRAINT [FK_Poliza_TipoRiesgo]
GO
ALTER TABLE [dbo].[PolizaPorCliente]  WITH CHECK ADD  CONSTRAINT [FK_PolizaPorCliente_Cliente] FOREIGN KEY([FK_IDCliente])
REFERENCES [dbo].[Cliente] ([Identificacion])
GO
ALTER TABLE [dbo].[PolizaPorCliente] CHECK CONSTRAINT [FK_PolizaPorCliente_Cliente]
GO
ALTER TABLE [dbo].[PolizaPorCliente]  WITH CHECK ADD  CONSTRAINT [FK_PolizaPorCliente_EstadoPoliza] FOREIGN KEY([FK_IDEstado])
REFERENCES [dbo].[EstadoPoliza] ([Codigo])
GO
ALTER TABLE [dbo].[PolizaPorCliente] CHECK CONSTRAINT [FK_PolizaPorCliente_EstadoPoliza]
GO
ALTER TABLE [dbo].[PolizaPorCliente]  WITH CHECK ADD  CONSTRAINT [FK_PolizaPorCliente_Poliza] FOREIGN KEY([FK_IDPoliza])
REFERENCES [dbo].[Poliza] ([ID_Poliza])
GO
ALTER TABLE [dbo].[PolizaPorCliente] CHECK CONSTRAINT [FK_PolizaPorCliente_Poliza]
GO
USE [master]
GO
ALTER DATABASE [SistemaSeguros] SET  READ_WRITE 
GO
