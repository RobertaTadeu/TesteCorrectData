USE [master]
GO
/****** Object:  Database [ContatosTCD]    Script Date: 15/02/2019 10:16:10 ******/
CREATE DATABASE [ContatosTCD]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ContatosTCD', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLSERVER2017\MSSQL\DATA\ContatosTCD.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ContatosTCD_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLSERVER2017\MSSQL\DATA\ContatosTCD_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [ContatosTCD] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ContatosTCD].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ContatosTCD] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ContatosTCD] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ContatosTCD] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ContatosTCD] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ContatosTCD] SET ARITHABORT OFF 
GO
ALTER DATABASE [ContatosTCD] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ContatosTCD] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ContatosTCD] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ContatosTCD] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ContatosTCD] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ContatosTCD] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ContatosTCD] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ContatosTCD] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ContatosTCD] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ContatosTCD] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ContatosTCD] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ContatosTCD] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ContatosTCD] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ContatosTCD] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ContatosTCD] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ContatosTCD] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ContatosTCD] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ContatosTCD] SET RECOVERY FULL 
GO
ALTER DATABASE [ContatosTCD] SET  MULTI_USER 
GO
ALTER DATABASE [ContatosTCD] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ContatosTCD] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ContatosTCD] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ContatosTCD] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ContatosTCD] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'ContatosTCD', N'ON'
GO
ALTER DATABASE [ContatosTCD] SET QUERY_STORE = OFF
GO
USE [ContatosTCD]
GO
ALTER DATABASE SCOPED CONFIGURATION SET IDENTITY_CACHE = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [ContatosTCD]
GO
/****** Object:  Table [dbo].[Contatos]    Script Date: 15/02/2019 10:16:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contatos](
	[Cod_Contato] [int] IDENTITY(1,1) NOT NULL,
	[Nome Completo] [varchar](200) NOT NULL,
	[Data Nascimento] [date] NULL,
	[Email] [varchar](100) NULL,
	[Telefone] [varchar](100) NULL,
	[TipoEmail] [varchar](100) NULL,
	[TipoTelefone] [varchar](100) NULL,
 CONSTRAINT [PK_Contatos] PRIMARY KEY CLUSTERED 
(
	[Cod_Contato] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Emails]    Script Date: 15/02/2019 10:16:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Emails](
	[Cod_Email] [int] IDENTITY(1,1) NOT NULL,
	[Email] [varchar](150) NULL,
	[TipoEmail] [varchar](100) NULL,
	[Cod_Tipo_Email] [int] NULL,
	[CodContato] [int] NOT NULL,
 CONSTRAINT [PK_Emails] PRIMARY KEY CLUSTERED 
(
	[Cod_Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoEmail]    Script Date: 15/02/2019 10:16:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoEmail](
	[Cod_Tipo_Email] [int] IDENTITY(1,1) NOT NULL,
	[TipoEmail] [varchar](100) NULL,
 CONSTRAINT [PK_TipoEmail] PRIMARY KEY CLUSTERED 
(
	[Cod_Tipo_Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vw_Emails]    Script Date: 15/02/2019 10:16:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vw_Emails]
AS
SELECT        dbo.Emails.Email, dbo.TipoEmail.TipoEmail, dbo.Contatos.[Nome Completo], dbo.Emails.CodContato
FROM            dbo.Emails INNER JOIN
                         dbo.TipoEmail ON dbo.Emails.Cod_Tipo_Email = dbo.TipoEmail.Cod_Tipo_Email INNER JOIN
                         dbo.Contatos ON dbo.Emails.CodContato = dbo.Contatos.Cod_Contato
GO
/****** Object:  Table [dbo].[Telefones]    Script Date: 15/02/2019 10:16:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Telefones](
	[Cod_Telefone] [int] IDENTITY(1,1) NOT NULL,
	[Telefone] [varchar](15) NULL,
	[TipoTelefone] [varchar](100) NULL,
	[Cod_Tipo_Telefone] [int] NULL,
	[CodContato] [int] NOT NULL,
 CONSTRAINT [PK_Telefones] PRIMARY KEY CLUSTERED 
(
	[Cod_Telefone] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoTelefone]    Script Date: 15/02/2019 10:16:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoTelefone](
	[Cod_Tipo_Telefone] [int] IDENTITY(1,1) NOT NULL,
	[TipoTelefone] [varchar](100) NULL,
 CONSTRAINT [PK_TipoTelefone] PRIMARY KEY CLUSTERED 
(
	[Cod_Tipo_Telefone] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vw_Telefone]    Script Date: 15/02/2019 10:16:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vw_Telefone]
AS
SELECT        dbo.Telefones.Telefone, dbo.TipoTelefone.TipoTelefone, dbo.Contatos.[Nome Completo], dbo.Telefones.CodContato
FROM            dbo.Telefones INNER JOIN
                         dbo.TipoTelefone ON dbo.Telefones.Cod_Tipo_Telefone = dbo.TipoTelefone.Cod_Tipo_Telefone INNER JOIN
                         dbo.Contatos ON dbo.Telefones.CodContato = dbo.Contatos.Cod_Contato
GO
/****** Object:  View [dbo].[vw_Contatos]    Script Date: 15/02/2019 10:16:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vw_Contatos]
AS
SELECT        dbo.Contatos.[Nome Completo], dbo.Contatos.[Data Nascimento], dbo.vw_Emails.Email + ' ' + '(' + dbo.vw_Emails.TipoEmail + ')' AS [E-mail], 
                         dbo.vw_Telefone.Telefone + ' ' + '(' + dbo.vw_Telefone.TipoTelefone + ')' AS Telefones
FROM            dbo.Contatos INNER JOIN
                         dbo.vw_Emails ON dbo.Contatos.Cod_Contato = dbo.vw_Emails.CodContato INNER JOIN
                         dbo.vw_Telefone ON dbo.Contatos.Cod_Contato = dbo.vw_Telefone.CodContato
GO
ALTER TABLE [dbo].[Emails]  WITH CHECK ADD  CONSTRAINT [FK_Emails_Contatos] FOREIGN KEY([CodContato])
REFERENCES [dbo].[Contatos] ([Cod_Contato])
GO
ALTER TABLE [dbo].[Emails] CHECK CONSTRAINT [FK_Emails_Contatos]
GO
ALTER TABLE [dbo].[Emails]  WITH CHECK ADD  CONSTRAINT [FK_Emails_TipoEmail] FOREIGN KEY([Cod_Tipo_Email])
REFERENCES [dbo].[TipoEmail] ([Cod_Tipo_Email])
GO
ALTER TABLE [dbo].[Emails] CHECK CONSTRAINT [FK_Emails_TipoEmail]
GO
ALTER TABLE [dbo].[Telefones]  WITH CHECK ADD  CONSTRAINT [FK_Telefones_Contatos] FOREIGN KEY([CodContato])
REFERENCES [dbo].[Contatos] ([Cod_Contato])
GO
ALTER TABLE [dbo].[Telefones] CHECK CONSTRAINT [FK_Telefones_Contatos]
GO
ALTER TABLE [dbo].[Telefones]  WITH CHECK ADD  CONSTRAINT [FK_Telefones_TipoTelefone] FOREIGN KEY([Cod_Tipo_Telefone])
REFERENCES [dbo].[TipoTelefone] ([Cod_Tipo_Telefone])
GO
ALTER TABLE [dbo].[Telefones] CHECK CONSTRAINT [FK_Telefones_TipoTelefone]
GO
/****** Object:  StoredProcedure [dbo].[sp_filtracontatoporletra]    Script Date: 15/02/2019 10:16:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_filtracontatoporletra]
as begin
declare @letra varchar(10)
select @letra=LEFT([Nome Completo],1) from vw_Contatos

select * from vw_Contatos
where [Nome Completo] LIKE @letra +'%'
end
GO
/****** Object:  StoredProcedure [dbo].[sp_listatodoscontatos]    Script Date: 15/02/2019 10:16:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_listatodoscontatos]
as begin

select * from vw_Contatos
where [Nome Completo] is not null
order by [Nome Completo] asc
end
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Contatos"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 177
               Right = 235
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "vw_Emails"
            Begin Extent = 
               Top = 6
               Left = 273
               Bottom = 150
               Right = 470
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "vw_Telefone"
            Begin Extent = 
               Top = 6
               Left = 508
               Bottom = 152
               Right = 705
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 5385
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vw_Contatos'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vw_Contatos'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Emails"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 157
               Right = 235
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "TipoEmail"
            Begin Extent = 
               Top = 6
               Left = 273
               Bottom = 102
               Right = 470
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Contatos"
            Begin Extent = 
               Top = 6
               Left = 508
               Bottom = 190
               Right = 705
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vw_Emails'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vw_Emails'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Telefones"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 161
               Right = 235
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "TipoTelefone"
            Begin Extent = 
               Top = 6
               Left = 273
               Bottom = 102
               Right = 470
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Contatos"
            Begin Extent = 
               Top = 6
               Left = 508
               Bottom = 136
               Right = 705
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vw_Telefone'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vw_Telefone'
GO
USE [master]
GO
ALTER DATABASE [ContatosTCD] SET  READ_WRITE 
GO
