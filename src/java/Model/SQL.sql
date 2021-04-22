USE [master]
GO
/****** Object:  Database [ChoOnline]    Script Date: 4/22/2021 6:39:06 PM ******/
CREATE DATABASE [ChoOnline]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ChoOnline', FILENAME = N'E:\soft\sqlsever\MSSQL15.MSSQLSERVER\MSSQL\DATA\ChoOnline.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ChoOnline_log', FILENAME = N'E:\soft\sqlsever\MSSQL15.MSSQLSERVER\MSSQL\DATA\ChoOnline_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [ChoOnline] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ChoOnline].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ChoOnline] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ChoOnline] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ChoOnline] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ChoOnline] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ChoOnline] SET ARITHABORT OFF 
GO
ALTER DATABASE [ChoOnline] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ChoOnline] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ChoOnline] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ChoOnline] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ChoOnline] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ChoOnline] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ChoOnline] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ChoOnline] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ChoOnline] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ChoOnline] SET  ENABLE_BROKER 
GO
ALTER DATABASE [ChoOnline] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ChoOnline] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ChoOnline] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ChoOnline] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ChoOnline] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ChoOnline] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ChoOnline] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ChoOnline] SET RECOVERY FULL 
GO
ALTER DATABASE [ChoOnline] SET  MULTI_USER 
GO
ALTER DATABASE [ChoOnline] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ChoOnline] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ChoOnline] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ChoOnline] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ChoOnline] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'ChoOnline', N'ON'
GO
ALTER DATABASE [ChoOnline] SET QUERY_STORE = OFF
GO
USE [ChoOnline]
GO
/****** Object:  Table [dbo].[admin]    Script Date: 4/22/2021 6:39:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[admin](
	[id] [int] NOT NULL,
	[account] [varchar](30) NOT NULL,
	[password] [varchar](30) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblCataLog]    Script Date: 4/22/2021 6:39:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCataLog](
	[id] [int] NOT NULL,
	[name] [varchar](128) NOT NULL,
	[parentId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblMatHang]    Script Date: 4/22/2021 6:39:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblMatHang](
	[id] [int] NOT NULL,
	[catalongId] [int] NOT NULL,
	[price] [decimal](15, 4) NOT NULL,
	[quantity] [int] NULL,
	[url_img] [varchar](500) NULL,
	[name] [nvarchar](500) NULL,
	[describe] [nvarchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblOder]    Script Date: 4/22/2021 6:39:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblOder](
	[id] [int] NOT NULL,
	[name] [nvarchar](128) NULL,
	[amount] [decimal](15, 4) NOT NULL,
	[address] [nvarchar](500) NULL,
	[phone] [nvarchar](128) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblUser]    Script Date: 4/22/2021 6:39:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblUser](
	[id] [int] NOT NULL,
	[account] [varchar](30) NOT NULL,
	[password] [varchar](30) NOT NULL,
	[email] [varchar](50) NULL,
	[phone] [varchar](15) NULL,
	[address] [varchar](128) NULL,
	[name] [nvarchar](128) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[tblCataLog] ([id], [name], [parentId]) VALUES (1, N'dienthoai', 1)
GO
INSERT [dbo].[tblCataLog] ([id], [name], [parentId]) VALUES (2, N'quan', 2)
GO
INSERT [dbo].[tblCataLog] ([id], [name], [parentId]) VALUES (3, N'ao', 3)
GO
INSERT [dbo].[tblCataLog] ([id], [name], [parentId]) VALUES (4, N'maytinhbang', 4)
GO
INSERT [dbo].[tblCataLog] ([id], [name], [parentId]) VALUES (5, N'maytinh', 5)
GO
INSERT [dbo].[tblCataLog] ([id], [name], [parentId]) VALUES (6, N'trangtri', 6)
GO
INSERT [dbo].[tblCataLog] ([id], [name], [parentId]) VALUES (7, N'giaitri', 7)
GO
INSERT [dbo].[tblCataLog] ([id], [name], [parentId]) VALUES (8, N'phukien', 8)
GO
INSERT [dbo].[tblMatHang] ([id], [catalongId], [price], [quantity], [url_img], [name], [describe]) VALUES (1, 1, CAST(3000000.0000 AS Decimal(15, 4)), 12, N'assets/img/dummyimg.png', N'SamSung Galaxy', N'Chiếc điện thoại thời thượng giá cả phải chăng')
GO
INSERT [dbo].[tblMatHang] ([id], [catalongId], [price], [quantity], [url_img], [name], [describe]) VALUES (2, 2, CAST(40000.0000 AS Decimal(15, 4)), 25, N'assets/img/quandui.jpg', N'Quần Đùi Nam', N'Quần đùi siêu đẹp cho nam')
GO
INSERT [dbo].[tblMatHang] ([id], [catalongId], [price], [quantity], [url_img], [name], [describe]) VALUES (3, 2, CAST(40000.0000 AS Decimal(15, 4)), 12, N'assets/img/quandui2.jpg', N'Quần Đùi Nam', N'Quần đùi siêu đẹp siêu rẻ')
GO
INSERT [dbo].[tblMatHang] ([id], [catalongId], [price], [quantity], [url_img], [name], [describe]) VALUES (4, 3, CAST(140000.0000 AS Decimal(15, 4)), 10, N'assets/img/somi.jpg', N'Áo sơ mi nam kẻ sọc', N'Áo sơ mi siêu đẹp')
GO
INSERT [dbo].[tblOder] ([id], [name], [amount], [address], [phone]) VALUES (1, N'huy nguyen', CAST(3040000.0000 AS Decimal(15, 4)), NULL, NULL)
GO
INSERT [dbo].[tblOder] ([id], [name], [amount], [address], [phone]) VALUES (2, N'huy nguyen', CAST(3040000.0000 AS Decimal(15, 4)), NULL, NULL)
GO
INSERT [dbo].[tblOder] ([id], [name], [amount], [address], [phone]) VALUES (3, N'huy nguyen', CAST(3040000.0000 AS Decimal(15, 4)), NULL, NULL)
GO
INSERT [dbo].[tblOder] ([id], [name], [amount], [address], [phone]) VALUES (4, N'huy nguyen', CAST(3040000.0000 AS Decimal(15, 4)), NULL, NULL)
GO
INSERT [dbo].[tblOder] ([id], [name], [amount], [address], [phone]) VALUES (5, N'huy nguyen', CAST(3040000.0000 AS Decimal(15, 4)), NULL, NULL)
GO
INSERT [dbo].[tblOder] ([id], [name], [amount], [address], [phone]) VALUES (6, N'huy nguyen', CAST(3040000.0000 AS Decimal(15, 4)), NULL, NULL)
GO
INSERT [dbo].[tblOder] ([id], [name], [amount], [address], [phone]) VALUES (7, N'huy nguyen', CAST(3040000.0000 AS Decimal(15, 4)), NULL, NULL)
GO
INSERT [dbo].[tblOder] ([id], [name], [amount], [address], [phone]) VALUES (8, N'huy nguyen', CAST(3040000.0000 AS Decimal(15, 4)), NULL, NULL)
GO
INSERT [dbo].[tblOder] ([id], [name], [amount], [address], [phone]) VALUES (9, N'huy nguyen', CAST(3040000.0000 AS Decimal(15, 4)), NULL, NULL)
GO
INSERT [dbo].[tblUser] ([id], [account], [password], [email], [phone], [address], [name]) VALUES (1, N'huy', N'123', N'nqh1405@gmail.com', N'1234567890', N'bacgiang', N'quanghuy')
GO
INSERT [dbo].[tblUser] ([id], [account], [password], [email], [phone], [address], [name]) VALUES (2, N'huy2', N'123', N'nqhh1405@gmail.com', N'12345678099', N'ha noi', N'huydz')
GO
INSERT [dbo].[tblUser] ([id], [account], [password], [email], [phone], [address], [name]) VALUES (3, N'betapchoi6', N'123', NULL, N'0386624076', N'bac giang', N'nguyen quang huy')
GO
INSERT [dbo].[tblUser] ([id], [account], [password], [email], [phone], [address], [name]) VALUES (4, N'nqh140520001', N'123', N'nqhhhhh@gmail.com', N'0386624076', N'bac giang', N'nguyen quang huy')
GO
INSERT [dbo].[tblUser] ([id], [account], [password], [email], [phone], [address], [name]) VALUES (5, N'huynq11', N'123', N'nqh111111@gmail.com', N'0386624076', N'bac giang', N'nguyen quang huy')
GO
ALTER TABLE [dbo].[tblMatHang] ADD  DEFAULT ((0)) FOR [quantity]
GO
ALTER TABLE [dbo].[tblOder] ADD  DEFAULT ('0.0000') FOR [amount]
GO
ALTER TABLE [dbo].[tblMatHang]  WITH CHECK ADD FOREIGN KEY([catalongId])
REFERENCES [dbo].[tblCataLog] ([id])
GO
USE [master]
GO
ALTER DATABASE [ChoOnline] SET  READ_WRITE 
GO
