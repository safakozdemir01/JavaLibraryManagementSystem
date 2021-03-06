USE [master]
GO
/****** Object:  Database [Kutuphane]    Script Date: 20.01.2021 19:29:05 ******/
CREATE DATABASE [Kutuphane]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Kutuphane', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\Kutuphane.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Kutuphane_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\Kutuphane_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Kutuphane] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Kutuphane].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Kutuphane] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Kutuphane] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Kutuphane] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Kutuphane] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Kutuphane] SET ARITHABORT OFF 
GO
ALTER DATABASE [Kutuphane] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Kutuphane] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [Kutuphane] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Kutuphane] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Kutuphane] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Kutuphane] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Kutuphane] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Kutuphane] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Kutuphane] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Kutuphane] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Kutuphane] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Kutuphane] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Kutuphane] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Kutuphane] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Kutuphane] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Kutuphane] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Kutuphane] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Kutuphane] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Kutuphane] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Kutuphane] SET  MULTI_USER 
GO
ALTER DATABASE [Kutuphane] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Kutuphane] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Kutuphane] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Kutuphane] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [Kutuphane]
GO
/****** Object:  Table [dbo].[emanetDurum]    Script Date: 20.01.2021 19:29:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[emanetDurum](
	[emanetID] [int] IDENTITY(1,1) NOT NULL,
	[kullaniciTC] [varchar](15) NOT NULL,
	[kullaniciAdi] [varchar](50) NOT NULL,
	[kitapID] [varchar](50) NOT NULL,
	[kitapAdi] [varchar](100) NOT NULL,
	[alinmaTarihi] [date] NOT NULL,
	[teslimTarihi] [date] NULL,
	[teslimEdildiMi] [bit] NOT NULL,
 CONSTRAINT [PK_emanetDurum] PRIMARY KEY CLUSTERED 
(
	[emanetID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[kitaplar]    Script Date: 20.01.2021 19:29:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[kitaplar](
	[kitapID] [int] NOT NULL,
	[kitapAdi] [varchar](100) NOT NULL,
	[yazar] [varchar](50) NOT NULL,
	[yayinevi] [varchar](50) NOT NULL,
	[sayfaSayisi] [int] NOT NULL,
	[turu] [varchar](50) NOT NULL,
	[stok] [int] NOT NULL,
 CONSTRAINT [PK_kitaplar] PRIMARY KEY CLUSTERED 
(
	[kitapID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[kullanicilar]    Script Date: 20.01.2021 19:29:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[kullanicilar](
	[kullaniciID] [varchar](50) NOT NULL,
	[kullaniciAdi] [varchar](50) NOT NULL,
	[kullaniciTC] [varchar](15) NOT NULL,
	[dogumTarihi] [date] NOT NULL,
	[eposta] [varchar](50) NOT NULL,
	[telefon] [varchar](15) NOT NULL,
	[uyelikTarihi] [date] NOT NULL,
	[cinsiyet] [varchar](10) NOT NULL,
 CONSTRAINT [PK_kullanicilar] PRIMARY KEY CLUSTERED 
(
	[kullaniciID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[yoneticiler]    Script Date: 20.01.2021 19:29:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[yoneticiler](
	[userName] [varchar](50) NOT NULL,
	[pass] [varchar](50) NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[emanetDurum] ON 

INSERT [dbo].[emanetDurum] ([emanetID], [kullaniciTC], [kullaniciAdi], [kitapID], [kitapAdi], [alinmaTarihi], [teslimTarihi], [teslimEdildiMi]) VALUES (23, N'57389175839', N'suleyman', N'4', N'kitap4', CAST(0xF2410B00 AS Date), CAST(0xFF410B00 AS Date), 1)
INSERT [dbo].[emanetDurum] ([emanetID], [kullaniciTC], [kullaniciAdi], [kitapID], [kitapAdi], [alinmaTarihi], [teslimTarihi], [teslimEdildiMi]) VALUES (26, N'14372357436', N'sfkzdmr', N'4', N'kitap4', CAST(0xEA410B00 AS Date), CAST(0xEA410B00 AS Date), 1)
INSERT [dbo].[emanetDurum] ([emanetID], [kullaniciTC], [kullaniciAdi], [kitapID], [kitapAdi], [alinmaTarihi], [teslimTarihi], [teslimEdildiMi]) VALUES (28, N'45463236237', N'şerafettin', N'3', N'kitap3', CAST(0xF2410B00 AS Date), NULL, 0)
INSERT [dbo].[emanetDurum] ([emanetID], [kullaniciTC], [kullaniciAdi], [kitapID], [kitapAdi], [alinmaTarihi], [teslimTarihi], [teslimEdildiMi]) VALUES (29, N'14372357436', N'sfkzdmr', N'4', N'kitap4', CAST(0x0C420B00 AS Date), NULL, 0)
INSERT [dbo].[emanetDurum] ([emanetID], [kullaniciTC], [kullaniciAdi], [kitapID], [kitapAdi], [alinmaTarihi], [teslimTarihi], [teslimEdildiMi]) VALUES (30, N'12798247917', N'nehir', N'2', N'kitap2', CAST(0xFC410B00 AS Date), NULL, 0)
INSERT [dbo].[emanetDurum] ([emanetID], [kullaniciTC], [kullaniciAdi], [kitapID], [kitapAdi], [alinmaTarihi], [teslimTarihi], [teslimEdildiMi]) VALUES (31, N'34281947829', N'sule', N'3', N'kitap3', CAST(0x05420B00 AS Date), NULL, 0)
INSERT [dbo].[emanetDurum] ([emanetID], [kullaniciTC], [kullaniciAdi], [kitapID], [kitapAdi], [alinmaTarihi], [teslimTarihi], [teslimEdildiMi]) VALUES (32, N'45463236237', N'şerafettin', N'1', N'kitap1', CAST(0x11420B00 AS Date), CAST(0x11420B00 AS Date), 1)
INSERT [dbo].[emanetDurum] ([emanetID], [kullaniciTC], [kullaniciAdi], [kitapID], [kitapAdi], [alinmaTarihi], [teslimTarihi], [teslimEdildiMi]) VALUES (35, N'38275923794798', N'suleyman', N'1', N'kitap1', CAST(0xEA410B00 AS Date), CAST(0xFC410B00 AS Date), 1)
SET IDENTITY_INSERT [dbo].[emanetDurum] OFF
INSERT [dbo].[kitaplar] ([kitapID], [kitapAdi], [yazar], [yayinevi], [sayfaSayisi], [turu], [stok]) VALUES (1, N'kitap1', N'yazar1', N'yayınevi1', 123, N'hikaye', 20)
INSERT [dbo].[kitaplar] ([kitapID], [kitapAdi], [yazar], [yayinevi], [sayfaSayisi], [turu], [stok]) VALUES (2, N'kitap2', N'yazar2', N'yayinevi2', 200, N'roman', 0)
INSERT [dbo].[kitaplar] ([kitapID], [kitapAdi], [yazar], [yayinevi], [sayfaSayisi], [turu], [stok]) VALUES (3, N'kitap3', N'yazar3', N'yayınevi3', 300, N'roman', 12)
INSERT [dbo].[kitaplar] ([kitapID], [kitapAdi], [yazar], [yayinevi], [sayfaSayisi], [turu], [stok]) VALUES (4, N'kitap4', N'yazar4', N'yayinevi4', 450, N'roman', 19)
INSERT [dbo].[kullanicilar] ([kullaniciID], [kullaniciAdi], [kullaniciTC], [dogumTarihi], [eposta], [telefon], [uyelikTarihi], [cinsiyet]) VALUES (N'1', N'sfkzdmr', N'14372357436', CAST(0xB01F0B00 AS Date), N'sfkzdmr@gmail.com', N'05347883293', CAST(0xF6410B00 AS Date), N'Erkek')
INSERT [dbo].[kullanicilar] ([kullaniciID], [kullaniciAdi], [kullaniciTC], [dogumTarihi], [eposta], [telefon], [uyelikTarihi], [cinsiyet]) VALUES (N'2', N'suleyman', N'38275923794798', CAST(0x61250B00 AS Date), N'bisey@gmail.com', N'0293752905234', CAST(0xFE410B00 AS Date), N'Erkek')
INSERT [dbo].[kullanicilar] ([kullaniciID], [kullaniciAdi], [kullaniciTC], [dogumTarihi], [eposta], [telefon], [uyelikTarihi], [cinsiyet]) VALUES (N'3', N'sule', N'34281947829', CAST(0x29230B00 AS Date), N'sule@gmail.com', N'4564563463', CAST(0x00420B00 AS Date), N'Kadın')
INSERT [dbo].[kullanicilar] ([kullaniciID], [kullaniciAdi], [kullaniciTC], [dogumTarihi], [eposta], [telefon], [uyelikTarihi], [cinsiyet]) VALUES (N'4', N'şerafettin', N'45463236237', CAST(0xD6200B00 AS Date), N'şeraf@hotmail.com', N'05385638292', CAST(0xFC410B00 AS Date), N'Erkek')
INSERT [dbo].[kullanicilar] ([kullaniciID], [kullaniciAdi], [kullaniciTC], [dogumTarihi], [eposta], [telefon], [uyelikTarihi], [cinsiyet]) VALUES (N'6', N'nehir', N'12798247917', CAST(0xCB210B00 AS Date), N'nehir@gmail.com', N'05329523628', CAST(0x00420B00 AS Date), N'Kadın')
INSERT [dbo].[yoneticiler] ([userName], [pass]) VALUES (N'admin', N'admin')
INSERT [dbo].[yoneticiler] ([userName], [pass]) VALUES (N'safak', N'123')
INSERT [dbo].[yoneticiler] ([userName], [pass]) VALUES (N'123', N'123')
INSERT [dbo].[yoneticiler] ([userName], [pass]) VALUES (N'1', N'1')
USE [master]
GO
ALTER DATABASE [Kutuphane] SET  READ_WRITE 
GO
