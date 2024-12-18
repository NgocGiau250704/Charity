USE [master]
GO
/****** Object:  Database [CharityWebsite]    Script Date: 12/7/2024 5:45:20 PM ******/
CREATE DATABASE [CharityWebsite]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CharityWebsite', FILENAME = N'F:\Nam3\DOTNET\CharityWebsite.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'CharityWebsite_log', FILENAME = N'F:\Nam3\DOTNET\CharityWebsite_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [CharityWebsite] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CharityWebsite].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CharityWebsite] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CharityWebsite] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CharityWebsite] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CharityWebsite] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CharityWebsite] SET ARITHABORT OFF 
GO
ALTER DATABASE [CharityWebsite] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CharityWebsite] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CharityWebsite] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CharityWebsite] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CharityWebsite] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CharityWebsite] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CharityWebsite] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CharityWebsite] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CharityWebsite] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CharityWebsite] SET  DISABLE_BROKER 
GO
ALTER DATABASE [CharityWebsite] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CharityWebsite] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CharityWebsite] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CharityWebsite] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CharityWebsite] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CharityWebsite] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CharityWebsite] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CharityWebsite] SET RECOVERY FULL 
GO
ALTER DATABASE [CharityWebsite] SET  MULTI_USER 
GO
ALTER DATABASE [CharityWebsite] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CharityWebsite] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CharityWebsite] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CharityWebsite] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [CharityWebsite] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [CharityWebsite] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'CharityWebsite', N'ON'
GO
ALTER DATABASE [CharityWebsite] SET QUERY_STORE = ON
GO
ALTER DATABASE [CharityWebsite] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [CharityWebsite]
GO
/****** Object:  Table [dbo].[About]    Script Date: 12/7/2024 5:45:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[About](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[MoTaNgan] [nvarchar](max) NULL,
	[MoTaDayDu] [nvarchar](max) NULL,
	[image1] [nvarchar](50) NULL,
	[image2] [nvarchar](50) NULL,
	[meta] [nvarchar](max) NULL,
	[hide] [bit] NULL,
	[order] [int] NULL,
	[datebegin] [smalldatetime] NULL,
 CONSTRAINT [PK_About] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ContactInfor]    Script Date: 12/7/2024 5:45:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ContactInfor](
	[id] [int] NOT NULL,
	[address] [nvarchar](max) NULL,
	[phone] [nvarchar](max) NULL,
	[email] [nvarchar](max) NULL,
	[meta] [nvarchar](max) NULL,
	[hide] [bit] NULL,
	[order] [int] NULL,
	[datebegin] [smalldatetime] NULL,
 CONSTRAINT [PK_ContactInfor] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Donate]    Script Date: 12/7/2024 5:45:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Donate](
	[IDdonate] [int] IDENTITY(1,1) NOT NULL,
	[DonateMoney] [int] NULL,
	[PersonDonateName] [nvarchar](max) NULL,
	[Infor] [nvarchar](max) NULL,
	[datebegin] [smalldatetime] NULL,
	[meta] [nvarchar](50) NULL,
	[order] [int] NULL,
	[hide] [bit] NULL,
 CONSTRAINT [PK__Donate__5C6A5BF3E13A8826] PRIMARY KEY CLUSTERED 
(
	[IDdonate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DuAn]    Script Date: 12/7/2024 5:45:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DuAn](
	[IDduan] [int] IDENTITY(1,1) NOT NULL,
	[ProjectName] [nvarchar](max) NULL,
	[datebegin] [smalldatetime] NULL,
	[meta] [nvarchar](50) NULL,
	[hide] [bit] NULL,
	[order] [int] NULL,
	[ProjectState] [bit] NULL,
	[TotalMoney] [int] NULL,
	[QRcode] [int] NULL,
	[Infor] [nvarchar](max) NULL,
	[Situation] [nvarchar](max) NULL,
	[ProjectImage] [nvarchar](max) NULL,
	[Result] [nvarchar](max) NULL,
	[WayToSupport] [nvarchar](max) NULL,
 CONSTRAINT [PK__DuAn__1019A91AD3263485] PRIMARY KEY CLUSTERED 
(
	[IDduan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[InforDonate]    Script Date: 12/7/2024 5:45:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InforDonate](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Message] [nvarchar](max) NULL,
	[Image] [nvarchar](50) NULL,
	[Banknumber] [nvarchar](max) NULL,
	[Beneficiary] [nvarchar](max) NULL,
	[Bank] [nvarchar](max) NULL,
	[meta] [nvarchar](max) NULL,
	[hide] [bit] NULL,
	[order] [int] NULL,
	[datebegin] [smalldatetime] NULL,
 CONSTRAINT [PK_InforDonate] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Menu]    Script Date: 12/7/2024 5:45:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Menu](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
	[link] [nvarchar](max) NULL,
	[meta] [nvarchar](50) NULL,
	[hide] [int] NULL,
	[order] [int] NULL,
	[datebegin] [smalldatetime] NULL,
 CONSTRAINT [PK_Menu] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[News]    Script Date: 12/7/2024 5:45:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[News](
	[IDnews] [int] IDENTITY(1,1) NOT NULL,
	[NewsImage] [nvarchar](50) NULL,
	[NewsName] [nvarchar](max) NULL,
	[Descrpition] [nvarchar](max) NULL,
	[meta] [nvarchar](max) NULL,
	[hide] [bit] NULL,
	[order] [int] NULL,
	[datebegin] [smalldatetime] NULL,
 CONSTRAINT [PK__News__E16520A008DB2C6A] PRIMARY KEY CLUSTERED 
(
	[IDnews] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[submenu]    Script Date: 12/7/2024 5:45:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[submenu](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idparent] [int] NULL,
	[name] [nvarchar](50) NULL,
	[link] [nvarchar](max) NULL,
	[meta] [nvarchar](max) NULL,
	[hide] [bit] NULL,
	[order] [int] NULL,
	[datebegin] [smalldatetime] NULL,
 CONSTRAINT [PK_submenu] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserAccount]    Script Date: 12/7/2024 5:45:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserAccount](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[username] [nvarchar](max) NULL,
	[password] [nvarchar](max) NULL,
	[userrole] [nchar](10) NULL,
	[meta] [nvarchar](max) NULL,
	[hide] [bit] NULL,
	[datebegin] [smalldatetime] NULL,
	[order] [int] NULL,
 CONSTRAINT [PK_UserAccount] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[About] ON 

INSERT [dbo].[About] ([id], [MoTaNgan], [MoTaDayDu], [image1], [image2], [meta], [hide], [order], [datebegin]) VALUES (1, N'<p><em>D&ugrave; trong bất kỳ ho&agrave;n cảnh n&agrave;o, khi xem lại những c&aacute;i m&igrave;nh đ&atilde; c&oacute;, so với những người kh&ocirc;ng c&oacute; c&aacute;i m&igrave;nh đang c&oacute;, th&igrave; ch&uacute;ng ta sẽ thấy m&igrave;nh may mắn hơn rất nhiều. D&ugrave; m&igrave;nh kh&ocirc;ng c&oacute; nh&agrave; ri&ecirc;ng nhưng &iacute;t nhất m&igrave;nh kh&ocirc;ng ở đầu đường x&oacute; chợ. D&ugrave; con c&aacute;i m&igrave;nh kh&ocirc;ng đầy đủ như con nh&agrave; gi&agrave;u nhưng &iacute;t ra cũng cơm no, &aacute;o ấm. Khi m&igrave;nh tập trung v&agrave;o c&aacute;i m&igrave;nh đ&atilde; c&oacute; thay v&igrave; chỉ tập trung v&agrave;o c&aacute;i m&igrave;nh chưa c&oacute; th&igrave; l&uacute;c n&agrave;o m&igrave;nh cũng thấy m&igrave;nh hạnh ph&uacute;c hơn. Khi m&igrave;nh tập trung v&agrave;o c&aacute;i m&igrave;nh c&oacute; so với nhiều người thấp h&egrave;n, k&eacute;m may mắn hơn m&igrave;nh th&igrave; m&igrave;nh sẽ thấy cuộc đời m&igrave;nh l&agrave; một đặc &acirc;n, thật may mắn biết bao nhi&ecirc;u.</em></p>

<p>Thấy được như vậy, cho đi một phần, cho lại cuộc đời n&agrave;y một ch&uacute;t để xem như m&igrave;nh trả ơn cho sự may mắn, cho c&aacute;i đặc &acirc;n m&igrave;nh c&oacute; được cũng l&agrave; để m&igrave;nh tu tập cho bản th&acirc;n m&igrave;nh l&ograve;ng biết ơn cuộc đời. C&oacute; biết ơn cuộc đời, biết ơn với những g&igrave; m&igrave;nh đ&atilde; c&oacute; th&igrave; m&igrave;nh thấy cuộc sống n&agrave;y &yacute; nghĩa nhiều hơn m&igrave;nh nghĩ.</p>

<p>X&eacute;t về nghi&ecirc;n cứu khoa học th&igrave; hạnh ph&uacute;c thực chất v&agrave; hạnh ph&uacute;c l&acirc;u d&agrave;i xuất ph&aacute;t từ việc cho đi, từ việc hy sinh gi&uacute;p đỡ người kh&aacute;c. Cho đi v&agrave; biết ơn cuộc đời gi&uacute;p cuộc sống con người c&oacute; sự thỏa m&atilde;n s&acirc;u sắc về t&acirc;m thức, an vui hơn, dễ d&agrave;ng vượt qua nghịch cảnh v&agrave; gi&uacute;p x&acirc;y dựng nhiều mối quan hệ tốt trong x&atilde; hội. Cho đi cũng để l&agrave;m gương cho những người xung quanh, l&agrave;m gương cho con ch&aacute;u m&igrave;nh sau n&agrave;y để noi theo một lối sống nh&acirc;n văn, c&oacute; t&igrave;nh thương, c&oacute; t&iacute;nh người.</p>

<p>Cho đi để gi&uacute;p đời l&agrave; một h&agrave;nh động cao thượng nhất trong tất cả c&aacute;c đạo. Theo lời Đức Phật dạy v&agrave; theo lời Ch&uacute;a dạy th&igrave; bố th&iacute;, đưa tay ra để gi&uacute;p người kh&aacute;c l&agrave; một trong những cử chỉ cao thượng nhất của một con người, một con đường gần nhất trở về với Ch&uacute;a, một con đường gần nhất để trở về ch&acirc;n ng&atilde;.</p>

<h1><samp><strong>Khi n&agrave;o mới cho</strong></samp></h1>

<p>Chưa bao giờ l&agrave; đ&uacute;ng l&uacute;c v&igrave; cuộc sống v&ocirc; thường, kh&ocirc;ng c&oacute; g&igrave; l&agrave; m&atilde;i m&atilde;i, kh&ocirc;ng c&oacute; g&igrave; tồn tại như vậy m&atilde;i. Vạn vật t&ugrave;y duy&ecirc;n. Sẽ kh&ocirc;ng bao giờ l&agrave; đ&uacute;ng l&uacute;c để cho đi. Khi t&ocirc;i c&oacute; th&ecirc;m v&agrave;i trăm triệu, v&agrave;i tỷ rồi t&ocirc;i sẽ cho đi, rồi khi đến đ&oacute; m&igrave;nh lại n&oacute;i khi t&ocirc;i dư th&ecirc;m ch&uacute;t nữa th&igrave; t&ocirc;i sẽ cho đi. Sẽ kh&ocirc;ng bao giờ c&oacute; thời gian n&agrave;o gọi l&agrave; đ&uacute;ng l&uacute;c để cho đi m&agrave; chỉ c&oacute; l&uacute;c n&agrave;y, khi ta c&ograve;n c&oacute; thể l&agrave;m g&igrave; đ&oacute; &yacute; nghĩa, l&agrave; ng&agrave;y h&ocirc;m nay.</p>

<h1><samp><strong>Cho bao nhi&ecirc;u l&agrave; đủ</strong></samp></h1>

<p>Việc cho đi bao nhi&ecirc;u kh&ocirc;ng quan trọng. Cho đi với c&aacute;i t&acirc;m thiện l&agrave;nh của m&igrave;nh mới l&agrave; quan trọng. N&oacute; c&oacute; thể 50 ngh&igrave;n, 100 ngh&igrave;n đồng, n&oacute; c&oacute; thể chỉ l&agrave; 1% của thu nhập của m&igrave;nh mỗi th&aacute;ng. Việc cho đi như việc gom g&oacute;p tiền v&agrave;o một t&agrave;i khoản tiết kiệm d&agrave;i hạn, mỗi th&aacute;ng một ch&uacute;t nhưng về l&acirc;u d&agrave;i th&igrave; kết quả n&oacute; mang lại rất lớn lao. Trong trường hợp n&agrave;y, 100, 200 ngh&igrave;n đồng mỗi th&aacute;ng của bạn c&oacute; thể l&agrave;m thay đổi số phận của một học sinh ngh&egrave;o.</p>
', N'<p style="margin-left:40px"><em>D&ugrave; trong bất kỳ ho&agrave;n cảnh n&agrave;o, khi xem lại những c&aacute;i m&igrave;nh đ&atilde; c&oacute;, so với những người kh&ocirc;ng c&oacute; c&aacute;i m&igrave;nh đang c&oacute;, th&igrave; ch&uacute;ng ta sẽ thấy m&igrave;nh may mắn hơn rất nhiều. D&ugrave; m&igrave;nh kh&ocirc;ng c&oacute; nh&agrave; ri&ecirc;ng nhưng &iacute;t nhất m&igrave;nh kh&ocirc;ng ở đầu đường x&oacute; chợ. D&ugrave; con c&aacute;i m&igrave;nh kh&ocirc;ng đầy đủ như con nh&agrave; gi&agrave;u nhưng &iacute;t ra cũng cơm no, &aacute;o ấm. Khi m&igrave;nh tập trung v&agrave;o c&aacute;i m&igrave;nh đ&atilde; c&oacute; thay v&igrave; chỉ tập trung v&agrave;o c&aacute;i m&igrave;nh chưa c&oacute; th&igrave; l&uacute;c n&agrave;o m&igrave;nh cũng thấy m&igrave;nh hạnh ph&uacute;c hơn. Khi m&igrave;nh tập trung v&agrave;o c&aacute;i m&igrave;nh c&oacute; so với nhiều người thấp h&egrave;n, k&eacute;m may mắn hơn m&igrave;nh th&igrave; m&igrave;nh sẽ thấy cuộc đời m&igrave;nh l&agrave; một đặc &acirc;n, thật may mắn biết bao nhi&ecirc;u.</em></p>

<p style="margin-left:40px">Thấy được như vậy, cho đi một phần, cho lại cuộc đời n&agrave;y một ch&uacute;t để xem như m&igrave;nh trả ơn cho sự may mắn, cho c&aacute;i đặc &acirc;n m&igrave;nh c&oacute; được cũng l&agrave; để m&igrave;nh tu tập cho bản th&acirc;n m&igrave;nh l&ograve;ng biết ơn cuộc đời. C&oacute; biết ơn cuộc đời, biết ơn với những g&igrave; m&igrave;nh đ&atilde; c&oacute; th&igrave; m&igrave;nh thấy cuộc sống n&agrave;y &yacute; nghĩa nhiều hơn m&igrave;nh nghĩ.</p>

<p style="margin-left:40px">X&eacute;t về nghi&ecirc;n cứu khoa học th&igrave; hạnh ph&uacute;c thực chất v&agrave; hạnh ph&uacute;c l&acirc;u d&agrave;i xuất ph&aacute;t từ việc cho đi, từ việc hy sinh gi&uacute;p đỡ người kh&aacute;c. Cho đi v&agrave; biết ơn cuộc đời gi&uacute;p cuộc sống con người c&oacute; sự thỏa m&atilde;n s&acirc;u sắc về t&acirc;m thức, an vui hơn, dễ d&agrave;ng vượt qua nghịch cảnh v&agrave; gi&uacute;p x&acirc;y dựng nhiều mối quan hệ tốt trong x&atilde; hội. Cho đi cũng để l&agrave;m gương cho những người xung quanh, l&agrave;m gương cho con ch&aacute;u m&igrave;nh sau n&agrave;y để noi theo một lối sống nh&acirc;n văn, c&oacute; t&igrave;nh thương, c&oacute; t&iacute;nh người.</p>

<p style="margin-left:40px">Cho đi để gi&uacute;p đời l&agrave; một h&agrave;nh động cao thượng nhất trong tất cả c&aacute;c đạo. Theo lời Đức Phật dạy v&agrave; theo lời Ch&uacute;a dạy th&igrave; bố th&iacute;, đưa tay ra để gi&uacute;p người kh&aacute;c l&agrave; một trong những cử chỉ cao thượng nhất của một con người, một con đường gần nhất trở về với Ch&uacute;a, một con đường gần nhất để trở về ch&acirc;n ng&atilde;.</p>

<h1 style="margin-left:40px"><samp><strong>Khi n&agrave;o mới cho</strong></samp></h1>

<p style="margin-left:40px">Chưa bao giờ l&agrave; đ&uacute;ng l&uacute;c v&igrave; cuộc sống v&ocirc; thường, kh&ocirc;ng c&oacute; g&igrave; l&agrave; m&atilde;i m&atilde;i, kh&ocirc;ng c&oacute; g&igrave; tồn tại như vậy m&atilde;i. Vạn vật t&ugrave;y duy&ecirc;n. Sẽ kh&ocirc;ng bao giờ l&agrave; đ&uacute;ng l&uacute;c để cho đi. Khi t&ocirc;i c&oacute; th&ecirc;m v&agrave;i trăm triệu, v&agrave;i tỷ rồi t&ocirc;i sẽ cho đi, rồi khi đến đ&oacute; m&igrave;nh lại n&oacute;i khi t&ocirc;i dư th&ecirc;m ch&uacute;t nữa th&igrave; t&ocirc;i sẽ cho đi. Sẽ kh&ocirc;ng bao giờ c&oacute; thời gian n&agrave;o gọi l&agrave; đ&uacute;ng l&uacute;c để cho đi m&agrave; chỉ c&oacute; l&uacute;c n&agrave;y, khi ta c&ograve;n c&oacute; thể l&agrave;m g&igrave; đ&oacute; &yacute; nghĩa, l&agrave; ng&agrave;y h&ocirc;m nay.</p>

<h1 style="margin-left:40px"><samp><strong>Cho bao nhi&ecirc;u l&agrave; đủ</strong></samp></h1>

<p style="margin-left:40px">Việc cho đi bao nhi&ecirc;u kh&ocirc;ng quan trọng. Cho đi với c&aacute;i t&acirc;m thiện l&agrave;nh của m&igrave;nh mới l&agrave; quan trọng. N&oacute; c&oacute; thể 50 ngh&igrave;n, 100 ngh&igrave;n đồng, n&oacute; c&oacute; thể chỉ l&agrave; 1% của thu nhập của m&igrave;nh mỗi th&aacute;ng. Việc cho đi như việc gom g&oacute;p tiền v&agrave;o một t&agrave;i khoản tiết kiệm d&agrave;i hạn, mỗi th&aacute;ng một ch&uacute;t nhưng về l&acirc;u d&agrave;i th&igrave; kết quả n&oacute; mang lại rất lớn lao. Trong trường hợp n&agrave;y, 100, 200 ngh&igrave;n đồng mỗi th&aacute;ng của bạn c&oacute; thể l&agrave;m thay đổi số phận của một học sinh ngh&egrave;o.</p>
', N'about-1.jpg', N'about-2.jpg', N'pemdugrave-trong-bat-ky-hoagraven-canh-nagraveo-khi-xem-lai-nhung-caacutei-migravenh-atilde-coacute-so-voi-nhung-nguoi-khocircng-coacute-caacutei-migravenh-ang-coacute-thigrave-chuacuteng-ta-se-thay-migravenh-may-man-hon-rat-nhieu-dugrave-migravenh-khocircng-coacute-nhagrave-riecircng-nhung-iacutet-nhat-migravenh-khocircng-o-au-uong-xoacute-cho-dugrave-con-caacutei-migravenh-khocircng-ay-u-nhu-con-nhagrave-giagraveu-nhung-iacutet-ra-cung-com-no-aacuteo-am-khi-migravenh-tap-trung-vagraveo-caacutei-migravenh-atilde-coacute-thay-vigrave-chi-tap-trung-vagraveo-caacutei-migravenh-chua-coacute-thigrave-luacutec-nagraveo-migravenh-cung-thay-migravenh-hanh-phuacutec-hon-khi-migravenh-tap-trung-vagraveo-caacutei-migravenh-coacute-so-voi-nhieu-nguoi-thap-hegraven-keacutem-may-man-hon-migravenh-thigrave-migravenh-se-thay-cuoc-oi-migravenh-lagrave-mot-ac-acircn-that-may-man-biet-bao-nhiecircuemp-pthay-uoc-nhu-vay-cho-i-mot-phan-cho-lai-cuoc-oi-nagravey-mot-chuacutet-e-xem-nhu-migravenh-tra-on-cho-su-may-man-cho-caacutei-ac-acircn-migravenh-coacute-uoc-cung-lagrave-e-migravenh-tu-tap-cho-ban-thacircn-migravenh-lograveng-biet-on-cuoc-oi-coacute-biet-on-cuoc-oi-biet-on-voi-nhung-gigrave-migravenh-atilde-coacute-thigrave-migravenh-thay-cuoc-song-nagravey-yacute-nghia-nhieu-hon-migravenh-nghip-pxeacutet-ve-nghiecircn-cuu-khoa-hoc-thigrave-hanh-phuacutec-thuc-chat-vagrave-hanh-phuacutec-lacircu-dagravei-xuat-phaacutet-tu-viec-cho-i-tu-viec-hy-sinh-giuacutep-o-nguoi-khaacutec-cho-i-vagrave-biet-on-cuoc-oi-giuacutep-cuoc-song-con-nguoi-coacute-su-thoa-matilden-sacircu-sac-ve-tacircm-thuc-an-vui-hon-de-dagraveng-vuot-qua-nghich-canh-vagrave-giuacutep-xacircy-dung-nhieu-moi-quan-he-tot-trong-xatilde-hoi-cho-i-cung-e-lagravem-guong-cho-nhung-nguoi-xung-quanh-lagravem-guong-cho-con-chaacuteu-migravenh-sau-nagravey-e-noi-theo-mot-loi-song-nhacircn-van-coacute-tigravenh-thuong-coacute-tiacutenh-nguoip-pcho-i-e-giuacutep-oi-lagrave-mot-hagravenh-ong-cao-thuong-nhat-trong-tat-ca-caacutec-ao-theo-loi-uc-phat-day-vagrave-theo-loi-chuacutea-day-thigrave-bo-thiacute-ua-tay-ra-e-giuacutep-nguoi-khaacutec-lagrave-mot-trong-nhung-cu-chi-cao-thuong-nhat-cua-mot-con-nguoi-mot-con-uong-gan-nhat-tro-ve-voi-chuacutea-mot-con-uong-gan-nhat-e-tro-ve-chacircn-ngatildep-h1sampstrongkhi-nagraveo-moi-chostrongsamph1-pchua-bao-gio-lagrave-uacuteng-luacutec-vigrave-cuoc-song-vocirc-thuong-khocircng-coacute-gigrave-lagrave-matildei-matildei-khocircng-coacute-gigrave-ton-tai-nhu-vay-matildei-van-vat-tugravey-duyecircn-se-khocircng-bao-gio-lagrave-uacuteng-luacutec-e-cho-i-khi-tocirci-coacute-thecircm-vagravei-tram-trieu-vagravei-ty-roi-tocirci-se-cho-i-roi-khi-en-oacute-migravenh-lai-noacutei-khi-tocirci-du-thecircm-chuacutet-nua-thigrave-tocirci-se-cho-i-se-khocircng-bao-gio-coacute-thoi-gian-nagraveo-goi-lagrave-uacuteng-luacutec-e-cho-i-magrave-chi-coacute-luacutec-nagravey-khi-ta-cograven-coacute-the-lagravem-gigrave-oacute-yacute-nghia-lagrave-ngagravey-hocircm-nayp-h1sampstrongcho-bao-nhiecircu-lagrave-ustrongsamph1-pviec-cho-i-bao-nhiecircu-khocircng-quan-trong-cho-i-voi-caacutei-tacircm-thien-lagravenh-cua-migravenh-moi-lagrave-quan-trong-noacute-coacute-the-50-nghigraven-100-nghigraven-ong-noacute-coacute-the-chi-lagrave-1-cua-thu-nhap-cua-migravenh-moi-thaacuteng-viec-cho-i-nhu-viec-gom-goacutep-tien-vagraveo-mot-tagravei-khoan-tiet-kiem-dagravei-han-moi-thaacuteng-mot-chuacutet-nhung-ve-lacircu-dagravei-thigrave-ket-qua-noacute-mang-lai-rat-lon-lao-trong-truong-hop-nagravey-100-200-nghigraven-ong-moi-thaacuteng-cua-ban-coacute-the-lagravem-thay-oi-so-phan-cua-mot-hoc-sinh-nghegraveop-', NULL, NULL, CAST(N'2024-12-07T17:18:00' AS SmallDateTime))
SET IDENTITY_INSERT [dbo].[About] OFF
GO
INSERT [dbo].[ContactInfor] ([id], [address], [phone], [email], [meta], [hide], [order], [datebegin]) VALUES (1, N'Ton Duc Thang University', N'0123456789', N'tdt@gmail.com', NULL, NULL, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[Donate] ON 

INSERT [dbo].[Donate] ([IDdonate], [DonateMoney], [PersonDonateName], [Infor], [datebegin], [meta], [order], [hide]) VALUES (2, 100000, N'Nguyen Van A', N'Nguyen Van A đóng góp', CAST(N'2024-01-01T00:00:00' AS SmallDateTime), NULL, NULL, NULL)
INSERT [dbo].[Donate] ([IDdonate], [DonateMoney], [PersonDonateName], [Infor], [datebegin], [meta], [order], [hide]) VALUES (3, 100000, N'Nguyen Van A', N'Nguyen Van A đóng góp', CAST(N'2024-01-01T00:00:00' AS SmallDateTime), NULL, NULL, NULL)
INSERT [dbo].[Donate] ([IDdonate], [DonateMoney], [PersonDonateName], [Infor], [datebegin], [meta], [order], [hide]) VALUES (4, 100000, N'Nguyen Van A', N'Nguyen Van A đóng góp', CAST(N'2024-01-01T00:00:00' AS SmallDateTime), NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Donate] OFF
GO
SET IDENTITY_INSERT [dbo].[DuAn] ON 

INSERT [dbo].[DuAn] ([IDduan], [ProjectName], [datebegin], [meta], [hide], [order], [ProjectState], [TotalMoney], [QRcode], [Infor], [Situation], [ProjectImage], [Result], [WayToSupport]) VALUES (1, N'dự án 1', NULL, N'du-an-1', NULL, NULL, 1, 0, NULL, N'Nguyễn Văn A (sinh năm 2000)
Trường THPT , huyện Bình Tân, tỉnh Vĩnh Long', N'Ba chị em của Thanh Hằng lớn lên nhờ công việc đồng áng của cha mẹ. Chị cả – Thanh Hằng là người hiểu rõ nhất nỗi khổ tâm và sự vất vả của cha mẹ mình. Cha em năm nay đã 53 tuổi, chứng bệnh đau lưng và bệnh về máu là tác hại của nhiều năm mưu sinh bằng nghề trồng lúa. Mẹ em năm nay cũng đã 47 tuổi, công việc và nguồn thu nhập không ổn định, nếu không ai thuê gì thì mẹ sẽ ở nhà nội trợ, hoặc sẽ vụ tiếp việc đồng áng của cha. Ba trồng lúa, mẹ thì trồng đậu bắp để trang trải thêm phần nào cuộc sống. Cực nhọc là vậy, nhưng thu nhập của cả ba và mẹ trung bình chỉ khoảng 2-3 triệu đồng/ 1 tháng, nếu lỡ không may mất mùa, thì có thể con số sẽ còn thấp hơn rất nhiều. Mức thu nhập đó vừa phải chi trả chi phí sinh hoạt cho gia đình, vừa phải lo cho Thanh Hằng và hai đứa con nhỏ đi học. Mỗi ngày Thanh Hằng được cha mẹ cho 10 nghìn đi học, đối với người khác, đó có thể là một con số rất nhỏ, nhưng đối với em và những đứa trẻ như em, đó là tiền ăn cho cả một ngày. Dưới Thanh Hằng còn có hai em, đứa lớn hơn thì đang học tiểu học, đứa nhỏ nhất thì vừa vào mẫu giáo. Nếu không có bất kỳ sự giúp đỡ nào, việc Thanh Hằng được tiếp cận ngưỡng cửa đại học là một việc rất xa vời.', N'about-1.jpg', NULL, N'Tài trợ 100%học phí khi em học Nghề, Cao đẳng hoặc Đại học
Hỗ trợ tư vấn và định hướng nghề nghiệp, hỗ trợ công việc làm thêm, hỗ trợ chương trình Mentorship – giáo dục và định hướng tư duy chuẩn bị vào đời.
Điều kiện tiếp tục hỗ trợ:
Học sinh/sinh viên phải có sự nỗ lực trong học tập, trong việc cải thiện cuộc sống.
Hằng năm, Quỹ Be Better sẽ tổ chức xét tái cấp học bổng “Thay đổi tương lai” nhằm theo dõi và nhận định sát sao về mức độ cải thiện hoàn cảnh, kinh tế, cuộc sống và học tập của các em. Để tiếp tục nhận được học bổng qua mỗi năm, các em phải có sự nỗ lực và phát triển trong học tập, cuộc sống đồng thời đáp ứng được các tiêu chí Quỹ nêu ra.')
INSERT [dbo].[DuAn] ([IDduan], [ProjectName], [datebegin], [meta], [hide], [order], [ProjectState], [TotalMoney], [QRcode], [Infor], [Situation], [ProjectImage], [Result], [WayToSupport]) VALUES (2, N'dự án 2', NULL, N'du-an-2', NULL, NULL, 0, 0, NULL, N'Nguyễn Văn A (sinh năm 2000)
Trường THPT , huyện Bình Tân, tỉnh Vĩnh Long', N'Ba chị em của Thanh Hằng lớn lên nhờ công việc đồng áng của cha mẹ. Chị cả – Thanh Hằng là người hiểu rõ nhất nỗi khổ tâm và sự vất vả của cha mẹ mình. Cha em năm nay đã 53 tuổi, chứng bệnh đau lưng và bệnh về máu là tác hại của nhiều năm mưu sinh bằng nghề trồng lúa. Mẹ em năm nay cũng đã 47 tuổi, công việc và nguồn thu nhập không ổn định, nếu không ai thuê gì thì mẹ sẽ ở nhà nội trợ, hoặc sẽ vụ tiếp việc đồng áng của cha. Ba trồng lúa, mẹ thì trồng đậu bắp để trang trải thêm phần nào cuộc sống. Cực nhọc là vậy, nhưng thu nhập của cả ba và mẹ trung bình chỉ khoảng 2-3 triệu đồng/ 1 tháng, nếu lỡ không may mất mùa, thì có thể con số sẽ còn thấp hơn rất nhiều. Mức thu nhập đó vừa phải chi trả chi phí sinh hoạt cho gia đình, vừa phải lo cho Thanh Hằng và hai đứa con nhỏ đi học. Mỗi ngày Thanh Hằng được cha mẹ cho 10 nghìn đi học, đối với người khác, đó có thể là một con số rất nhỏ, nhưng đối với em và những đứa trẻ như em, đó là tiền ăn cho cả một ngày. Dưới Thanh Hằng còn có hai em, đứa lớn hơn thì đang học tiểu học, đứa nhỏ nhất thì vừa vào mẫu giáo. Nếu không có bất kỳ sự giúp đỡ nào, việc Thanh Hằng được tiếp cận ngưỡng cửa đại học là một việc rất xa vời.', N'about-1.jpg', NULL, N'Tài trợ 100%học phí khi em học Nghề, Cao đẳng hoặc Đại học
Hỗ trợ tư vấn và định hướng nghề nghiệp, hỗ trợ công việc làm thêm, hỗ trợ chương trình Mentorship – giáo dục và định hướng tư duy chuẩn bị vào đời.
Điều kiện tiếp tục hỗ trợ:
Học sinh/sinh viên phải có sự nỗ lực trong học tập, trong việc cải thiện cuộc sống.
Hằng năm, Quỹ Be Better sẽ tổ chức xét tái cấp học bổng “Thay đổi tương lai” nhằm theo dõi và nhận định sát sao về mức độ cải thiện hoàn cảnh, kinh tế, cuộc sống và học tập của các em. Để tiếp tục nhận được học bổng qua mỗi năm, các em phải có sự nỗ lực và phát triển trong học tập, cuộc sống đồng thời đáp ứng được các tiêu chí Quỹ nêu ra.')
INSERT [dbo].[DuAn] ([IDduan], [ProjectName], [datebegin], [meta], [hide], [order], [ProjectState], [TotalMoney], [QRcode], [Infor], [Situation], [ProjectImage], [Result], [WayToSupport]) VALUES (3, N'dự án 3', NULL, N'du-an-3', NULL, NULL, 0, 0, NULL, N'Nguyễn Văn A (sinh năm 2000)
Trường THPT , huyện Bình Tân, tỉnh Vĩnh LongNguyễn Văn A (sinh năm 2000)
Trường THPT , huyện Bình Tân, tỉnh Vĩnh Long', N'Ba chị em của Thanh Hằng lớn lên nhờ công việc đồng áng của cha mẹ. Chị cả – Thanh Hằng là người hiểu rõ nhất nỗi khổ tâm và sự vất vả của cha mẹ mình. Cha em năm nay đã 53 tuổi, chứng bệnh đau lưng và bệnh về máu là tác hại của nhiều năm mưu sinh bằng nghề trồng lúa. Mẹ em năm nay cũng đã 47 tuổi, công việc và nguồn thu nhập không ổn định, nếu không ai thuê gì thì mẹ sẽ ở nhà nội trợ, hoặc sẽ vụ tiếp việc đồng áng của cha. Ba trồng lúa, mẹ thì trồng đậu bắp để trang trải thêm phần nào cuộc sống. Cực nhọc là vậy, nhưng thu nhập của cả ba và mẹ trung bình chỉ khoảng 2-3 triệu đồng/ 1 tháng, nếu lỡ không may mất mùa, thì có thể con số sẽ còn thấp hơn rất nhiều. Mức thu nhập đó vừa phải chi trả chi phí sinh hoạt cho gia đình, vừa phải lo cho Thanh Hằng và hai đứa con nhỏ đi học. Mỗi ngày Thanh Hằng được cha mẹ cho 10 nghìn đi học, đối với người khác, đó có thể là một con số rất nhỏ, nhưng đối với em và những đứa trẻ như em, đó là tiền ăn cho cả một ngày. Dưới Thanh Hằng còn có hai em, đứa lớn hơn thì đang học tiểu học, đứa nhỏ nhất thì vừa vào mẫu giáo. Nếu không có bất kỳ sự giúp đỡ nào, việc Thanh Hằng được tiếp cận ngưỡng cửa đại học là một việc rất xa vời.', N'about-1.jpg', NULL, N'Tài trợ 100%học phí khi em học Nghề, Cao đẳng hoặc Đại học
Hỗ trợ tư vấn và định hướng nghề nghiệp, hỗ trợ công việc làm thêm, hỗ trợ chương trình Mentorship – giáo dục và định hướng tư duy chuẩn bị vào đời.
Điều kiện tiếp tục hỗ trợ:
Học sinh/sinh viên phải có sự nỗ lực trong học tập, trong việc cải thiện cuộc sống.
Hằng năm, Quỹ Be Better sẽ tổ chức xét tái cấp học bổng “Thay đổi tương lai” nhằm theo dõi và nhận định sát sao về mức độ cải thiện hoàn cảnh, kinh tế, cuộc sống và học tập của các em. Để tiếp tục nhận được học bổng qua mỗi năm, các em phải có sự nỗ lực và phát triển trong học tập, cuộc sống đồng thời đáp ứng được các tiêu chí Quỹ nêu ra.')
INSERT [dbo].[DuAn] ([IDduan], [ProjectName], [datebegin], [meta], [hide], [order], [ProjectState], [TotalMoney], [QRcode], [Infor], [Situation], [ProjectImage], [Result], [WayToSupport]) VALUES (4, N'dự án 4', NULL, N'du-an-4', NULL, NULL, 1, 0, NULL, N'Nguyễn Văn A (sinh năm 2000)
Trường THPT , huyện Bình Tân, tỉnh Vĩnh Long', N'Ba chị em của Thanh Hằng lớn lên nhờ công việc đồng áng của cha mẹ. Chị cả – Thanh Hằng là người hiểu rõ nhất nỗi khổ tâm và sự vất vả của cha mẹ mình. Cha em năm nay đã 53 tuổi, chứng bệnh đau lưng và bệnh về máu là tác hại của nhiều năm mưu sinh bằng nghề trồng lúa. Mẹ em năm nay cũng đã 47 tuổi, công việc và nguồn thu nhập không ổn định, nếu không ai thuê gì thì mẹ sẽ ở nhà nội trợ, hoặc sẽ vụ tiếp việc đồng áng của cha. Ba trồng lúa, mẹ thì trồng đậu bắp để trang trải thêm phần nào cuộc sống. Cực nhọc là vậy, nhưng thu nhập của cả ba và mẹ trung bình chỉ khoảng 2-3 triệu đồng/ 1 tháng, nếu lỡ không may mất mùa, thì có thể con số sẽ còn thấp hơn rất nhiều. Mức thu nhập đó vừa phải chi trả chi phí sinh hoạt cho gia đình, vừa phải lo cho Thanh Hằng và hai đứa con nhỏ đi học. Mỗi ngày Thanh Hằng được cha mẹ cho 10 nghìn đi học, đối với người khác, đó có thể là một con số rất nhỏ, nhưng đối với em và những đứa trẻ như em, đó là tiền ăn cho cả một ngày. Dưới Thanh Hằng còn có hai em, đứa lớn hơn thì đang học tiểu học, đứa nhỏ nhất thì vừa vào mẫu giáo. Nếu không có bất kỳ sự giúp đỡ nào, việc Thanh Hằng được tiếp cận ngưỡng cửa đại học là một việc rất xa vời.', N'about-1.jpg', NULL, N'Tài trợ 100%học phí khi em học Nghề, Cao đẳng hoặc Đại học
Hỗ trợ tư vấn và định hướng nghề nghiệp, hỗ trợ công việc làm thêm, hỗ trợ chương trình Mentorship – giáo dục và định hướng tư duy chuẩn bị vào đời.
Điều kiện tiếp tục hỗ trợ:
Học sinh/sinh viên phải có sự nỗ lực trong học tập, trong việc cải thiện cuộc sống.
Hằng năm, Quỹ Be Better sẽ tổ chức xét tái cấp học bổng “Thay đổi tương lai” nhằm theo dõi và nhận định sát sao về mức độ cải thiện hoàn cảnh, kinh tế, cuộc sống và học tập của các em. Để tiếp tục nhận được học bổng qua mỗi năm, các em phải có sự nỗ lực và phát triển trong học tập, cuộc sống đồng thời đáp ứng được các tiêu chí Quỹ nêu ra.')
INSERT [dbo].[DuAn] ([IDduan], [ProjectName], [datebegin], [meta], [hide], [order], [ProjectState], [TotalMoney], [QRcode], [Infor], [Situation], [ProjectImage], [Result], [WayToSupport]) VALUES (5, N'dự án 5', NULL, N'du-an-5', NULL, NULL, 0, 0, NULL, N'Nguyễn Văn A (sinh năm 2000)
Trường THPT , huyện Bình Tân, tỉnh Vĩnh Long', N'Ba chị em của Thanh Hằng lớn lên nhờ công việc đồng áng của cha mẹ. Chị cả – Thanh Hằng là người hiểu rõ nhất nỗi khổ tâm và sự vất vả của cha mẹ mình. Cha em năm nay đã 53 tuổi, chứng bệnh đau lưng và bệnh về máu là tác hại của nhiều năm mưu sinh bằng nghề trồng lúa. Mẹ em năm nay cũng đã 47 tuổi, công việc và nguồn thu nhập không ổn định, nếu không ai thuê gì thì mẹ sẽ ở nhà nội trợ, hoặc sẽ vụ tiếp việc đồng áng của cha. Ba trồng lúa, mẹ thì trồng đậu bắp để trang trải thêm phần nào cuộc sống. Cực nhọc là vậy, nhưng thu nhập của cả ba và mẹ trung bình chỉ khoảng 2-3 triệu đồng/ 1 tháng, nếu lỡ không may mất mùa, thì có thể con số sẽ còn thấp hơn rất nhiều. Mức thu nhập đó vừa phải chi trả chi phí sinh hoạt cho gia đình, vừa phải lo cho Thanh Hằng và hai đứa con nhỏ đi học. Mỗi ngày Thanh Hằng được cha mẹ cho 10 nghìn đi học, đối với người khác, đó có thể là một con số rất nhỏ, nhưng đối với em và những đứa trẻ như em, đó là tiền ăn cho cả một ngày. Dưới Thanh Hằng còn có hai em, đứa lớn hơn thì đang học tiểu học, đứa nhỏ nhất thì vừa vào mẫu giáo. Nếu không có bất kỳ sự giúp đỡ nào, việc Thanh Hằng được tiếp cận ngưỡng cửa đại học là một việc rất xa vời.', N'about-1.jpg', NULL, N'Tài trợ 100%học phí khi em học Nghề, Cao đẳng hoặc Đại học
Hỗ trợ tư vấn và định hướng nghề nghiệp, hỗ trợ công việc làm thêm, hỗ trợ chương trình Mentorship – giáo dục và định hướng tư duy chuẩn bị vào đời.
Điều kiện tiếp tục hỗ trợ:
Học sinh/sinh viên phải có sự nỗ lực trong học tập, trong việc cải thiện cuộc sống.
Hằng năm, Quỹ Be Better sẽ tổ chức xét tái cấp học bổng “Thay đổi tương lai” nhằm theo dõi và nhận định sát sao về mức độ cải thiện hoàn cảnh, kinh tế, cuộc sống và học tập của các em. Để tiếp tục nhận được học bổng qua mỗi năm, các em phải có sự nỗ lực và phát triển trong học tập, cuộc sống đồng thời đáp ứng được các tiêu chí Quỹ nêu ra.')
INSERT [dbo].[DuAn] ([IDduan], [ProjectName], [datebegin], [meta], [hide], [order], [ProjectState], [TotalMoney], [QRcode], [Infor], [Situation], [ProjectImage], [Result], [WayToSupport]) VALUES (6, N'dự án 6', NULL, N'du-an-6', NULL, NULL, 1, 0, NULL, N'Nguyễn Văn A (sinh năm 2000)
Trường THPT , huyện Bình Tân, tỉnh Vĩnh Long', N'Ba chị em của Thanh Hằng lớn lên nhờ công việc đồng áng của cha mẹ. Chị cả – Thanh Hằng là người hiểu rõ nhất nỗi khổ tâm và sự vất vả của cha mẹ mình. Cha em năm nay đã 53 tuổi, chứng bệnh đau lưng và bệnh về máu là tác hại của nhiều năm mưu sinh bằng nghề trồng lúa. Mẹ em năm nay cũng đã 47 tuổi, công việc và nguồn thu nhập không ổn định, nếu không ai thuê gì thì mẹ sẽ ở nhà nội trợ, hoặc sẽ vụ tiếp việc đồng áng của cha. Ba trồng lúa, mẹ thì trồng đậu bắp để trang trải thêm phần nào cuộc sống. Cực nhọc là vậy, nhưng thu nhập của cả ba và mẹ trung bình chỉ khoảng 2-3 triệu đồng/ 1 tháng, nếu lỡ không may mất mùa, thì có thể con số sẽ còn thấp hơn rất nhiều. Mức thu nhập đó vừa phải chi trả chi phí sinh hoạt cho gia đình, vừa phải lo cho Thanh Hằng và hai đứa con nhỏ đi học. Mỗi ngày Thanh Hằng được cha mẹ cho 10 nghìn đi học, đối với người khác, đó có thể là một con số rất nhỏ, nhưng đối với em và những đứa trẻ như em, đó là tiền ăn cho cả một ngày. Dưới Thanh Hằng còn có hai em, đứa lớn hơn thì đang học tiểu học, đứa nhỏ nhất thì vừa vào mẫu giáo. Nếu không có bất kỳ sự giúp đỡ nào, việc Thanh Hằng được tiếp cận ngưỡng cửa đại học là một việc rất xa vời.', N'about-1.jpg', NULL, N'Tài trợ 100%học phí khi em học Nghề, Cao đẳng hoặc Đại học
Hỗ trợ tư vấn và định hướng nghề nghiệp, hỗ trợ công việc làm thêm, hỗ trợ chương trình Mentorship – giáo dục và định hướng tư duy chuẩn bị vào đời.
Điều kiện tiếp tục hỗ trợ:
Học sinh/sinh viên phải có sự nỗ lực trong học tập, trong việc cải thiện cuộc sống.
Hằng năm, Quỹ Be Better sẽ tổ chức xét tái cấp học bổng “Thay đổi tương lai” nhằm theo dõi và nhận định sát sao về mức độ cải thiện hoàn cảnh, kinh tế, cuộc sống và học tập của các em. Để tiếp tục nhận được học bổng qua mỗi năm, các em phải có sự nỗ lực và phát triển trong học tập, cuộc sống đồng thời đáp ứng được các tiêu chí Quỹ nêu ra.')
INSERT [dbo].[DuAn] ([IDduan], [ProjectName], [datebegin], [meta], [hide], [order], [ProjectState], [TotalMoney], [QRcode], [Infor], [Situation], [ProjectImage], [Result], [WayToSupport]) VALUES (7, N'dự án 7', NULL, N'du-an-7', NULL, NULL, 1, 0, NULL, N'Nguyễn Văn A (sinh năm 2000)
Trường THPT , huyện Bình Tân, tỉnh Vĩnh Long', N'Ba chị em của Thanh Hằng lớn lên nhờ công việc đồng áng của cha mẹ. Chị cả – Thanh Hằng là người hiểu rõ nhất nỗi khổ tâm và sự vất vả của cha mẹ mình. Cha em năm nay đã 53 tuổi, chứng bệnh đau lưng và bệnh về máu là tác hại của nhiều năm mưu sinh bằng nghề trồng lúa. Mẹ em năm nay cũng đã 47 tuổi, công việc và nguồn thu nhập không ổn định, nếu không ai thuê gì thì mẹ sẽ ở nhà nội trợ, hoặc sẽ vụ tiếp việc đồng áng của cha. Ba trồng lúa, mẹ thì trồng đậu bắp để trang trải thêm phần nào cuộc sống. Cực nhọc là vậy, nhưng thu nhập của cả ba và mẹ trung bình chỉ khoảng 2-3 triệu đồng/ 1 tháng, nếu lỡ không may mất mùa, thì có thể con số sẽ còn thấp hơn rất nhiều. Mức thu nhập đó vừa phải chi trả chi phí sinh hoạt cho gia đình, vừa phải lo cho Thanh Hằng và hai đứa con nhỏ đi học. Mỗi ngày Thanh Hằng được cha mẹ cho 10 nghìn đi học, đối với người khác, đó có thể là một con số rất nhỏ, nhưng đối với em và những đứa trẻ như em, đó là tiền ăn cho cả một ngày. Dưới Thanh Hằng còn có hai em, đứa lớn hơn thì đang học tiểu học, đứa nhỏ nhất thì vừa vào mẫu giáo. Nếu không có bất kỳ sự giúp đỡ nào, việc Thanh Hằng được tiếp cận ngưỡng cửa đại học là một việc rất xa vời.', N'about-1.jpg', NULL, N'Tài trợ 100%học phí khi em học Nghề, Cao đẳng hoặc Đại học
Hỗ trợ tư vấn và định hướng nghề nghiệp, hỗ trợ công việc làm thêm, hỗ trợ chương trình Mentorship – giáo dục và định hướng tư duy chuẩn bị vào đời.
Điều kiện tiếp tục hỗ trợ:
Học sinh/sinh viên phải có sự nỗ lực trong học tập, trong việc cải thiện cuộc sống.
Hằng năm, Quỹ Be Better sẽ tổ chức xét tái cấp học bổng “Thay đổi tương lai” nhằm theo dõi và nhận định sát sao về mức độ cải thiện hoàn cảnh, kinh tế, cuộc sống và học tập của các em. Để tiếp tục nhận được học bổng qua mỗi năm, các em phải có sự nỗ lực và phát triển trong học tập, cuộc sống đồng thời đáp ứng được các tiêu chí Quỹ nêu ra.')
INSERT [dbo].[DuAn] ([IDduan], [ProjectName], [datebegin], [meta], [hide], [order], [ProjectState], [TotalMoney], [QRcode], [Infor], [Situation], [ProjectImage], [Result], [WayToSupport]) VALUES (8, N'dự án 8', NULL, N'du-an-8', NULL, NULL, 1, 0, NULL, N'Nguyễn Văn A (sinh năm 2000)
Trường THPT , huyện Bình Tân, tỉnh Vĩnh Long', N'Ba chị em của Thanh Hằng lớn lên nhờ công việc đồng áng của cha mẹ. Chị cả – Thanh Hằng là người hiểu rõ nhất nỗi khổ tâm và sự vất vả của cha mẹ mình. Cha em năm nay đã 53 tuổi, chứng bệnh đau lưng và bệnh về máu là tác hại của nhiều năm mưu sinh bằng nghề trồng lúa. Mẹ em năm nay cũng đã 47 tuổi, công việc và nguồn thu nhập không ổn định, nếu không ai thuê gì thì mẹ sẽ ở nhà nội trợ, hoặc sẽ vụ tiếp việc đồng áng của cha. Ba trồng lúa, mẹ thì trồng đậu bắp để trang trải thêm phần nào cuộc sống. Cực nhọc là vậy, nhưng thu nhập của cả ba và mẹ trung bình chỉ khoảng 2-3 triệu đồng/ 1 tháng, nếu lỡ không may mất mùa, thì có thể con số sẽ còn thấp hơn rất nhiều. Mức thu nhập đó vừa phải chi trả chi phí sinh hoạt cho gia đình, vừa phải lo cho Thanh Hằng và hai đứa con nhỏ đi học. Mỗi ngày Thanh Hằng được cha mẹ cho 10 nghìn đi học, đối với người khác, đó có thể là một con số rất nhỏ, nhưng đối với em và những đứa trẻ như em, đó là tiền ăn cho cả một ngày. Dưới Thanh Hằng còn có hai em, đứa lớn hơn thì đang học tiểu học, đứa nhỏ nhất thì vừa vào mẫu giáo. Nếu không có bất kỳ sự giúp đỡ nào, việc Thanh Hằng được tiếp cận ngưỡng cửa đại học là một việc rất xa vời.', N'about-1.jpg', NULL, N'Tài trợ 100%học phí khi em học Nghề, Cao đẳng hoặc Đại học
Hỗ trợ tư vấn và định hướng nghề nghiệp, hỗ trợ công việc làm thêm, hỗ trợ chương trình Mentorship – giáo dục và định hướng tư duy chuẩn bị vào đời.
Điều kiện tiếp tục hỗ trợ:
Học sinh/sinh viên phải có sự nỗ lực trong học tập, trong việc cải thiện cuộc sống.
Hằng năm, Quỹ Be Better sẽ tổ chức xét tái cấp học bổng “Thay đổi tương lai” nhằm theo dõi và nhận định sát sao về mức độ cải thiện hoàn cảnh, kinh tế, cuộc sống và học tập của các em. Để tiếp tục nhận được học bổng qua mỗi năm, các em phải có sự nỗ lực và phát triển trong học tập, cuộc sống đồng thời đáp ứng được các tiêu chí Quỹ nêu ra.')
INSERT [dbo].[DuAn] ([IDduan], [ProjectName], [datebegin], [meta], [hide], [order], [ProjectState], [TotalMoney], [QRcode], [Infor], [Situation], [ProjectImage], [Result], [WayToSupport]) VALUES (9, N'dự án 9', NULL, N'du-an-9', NULL, NULL, 0, 0, NULL, N'Nguyễn Văn A (sinh năm 2000)
Trường THPT , huyện Bình Tân, tỉnh Vĩnh Long', N'Ba chị em của Thanh Hằng lớn lên nhờ công việc đồng áng của cha mẹ. Chị cả – Thanh Hằng là người hiểu rõ nhất nỗi khổ tâm và sự vất vả của cha mẹ mình. Cha em năm nay đã 53 tuổi, chứng bệnh đau lưng và bệnh về máu là tác hại của nhiều năm mưu sinh bằng nghề trồng lúa. Mẹ em năm nay cũng đã 47 tuổi, công việc và nguồn thu nhập không ổn định, nếu không ai thuê gì thì mẹ sẽ ở nhà nội trợ, hoặc sẽ vụ tiếp việc đồng áng của cha. Ba trồng lúa, mẹ thì trồng đậu bắp để trang trải thêm phần nào cuộc sống. Cực nhọc là vậy, nhưng thu nhập của cả ba và mẹ trung bình chỉ khoảng 2-3 triệu đồng/ 1 tháng, nếu lỡ không may mất mùa, thì có thể con số sẽ còn thấp hơn rất nhiều. Mức thu nhập đó vừa phải chi trả chi phí sinh hoạt cho gia đình, vừa phải lo cho Thanh Hằng và hai đứa con nhỏ đi học. Mỗi ngày Thanh Hằng được cha mẹ cho 10 nghìn đi học, đối với người khác, đó có thể là một con số rất nhỏ, nhưng đối với em và những đứa trẻ như em, đó là tiền ăn cho cả một ngày. Dưới Thanh Hằng còn có hai em, đứa lớn hơn thì đang học tiểu học, đứa nhỏ nhất thì vừa vào mẫu giáo. Nếu không có bất kỳ sự giúp đỡ nào, việc Thanh Hằng được tiếp cận ngưỡng cửa đại học là một việc rất xa vời.', N'about-1.jpg', NULL, N'Tài trợ 100%học phí khi em học Nghề, Cao đẳng hoặc Đại học
Hỗ trợ tư vấn và định hướng nghề nghiệp, hỗ trợ công việc làm thêm, hỗ trợ chương trình Mentorship – giáo dục và định hướng tư duy chuẩn bị vào đời.
Điều kiện tiếp tục hỗ trợ:
Học sinh/sinh viên phải có sự nỗ lực trong học tập, trong việc cải thiện cuộc sống.
Hằng năm, Quỹ Be Better sẽ tổ chức xét tái cấp học bổng “Thay đổi tương lai” nhằm theo dõi và nhận định sát sao về mức độ cải thiện hoàn cảnh, kinh tế, cuộc sống và học tập của các em. Để tiếp tục nhận được học bổng qua mỗi năm, các em phải có sự nỗ lực và phát triển trong học tập, cuộc sống đồng thời đáp ứng được các tiêu chí Quỹ nêu ra.')
SET IDENTITY_INSERT [dbo].[DuAn] OFF
GO
SET IDENTITY_INSERT [dbo].[InforDonate] ON 

INSERT [dbo].[InforDonate] ([id], [Message], [Image], [Banknumber], [Beneficiary], [Bank], [meta], [hide], [order], [datebegin]) VALUES (1, N'Tên người gửi + Nội dung tài trợ Ví dụ: Nguyen Van A – giup em den truong', N'qrcode.png', N'012345', N'Nguyen Van A', N'vietcombank', NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[InforDonate] OFF
GO
SET IDENTITY_INSERT [dbo].[Menu] ON 

INSERT [dbo].[Menu] ([id], [name], [link], [meta], [hide], [order], [datebegin]) VALUES (1, N'Trang chủ', NULL, N'trang-chu', NULL, 1, NULL)
INSERT [dbo].[Menu] ([id], [name], [link], [meta], [hide], [order], [datebegin]) VALUES (2, N'Về chúng tôi', NULL, N've-chung-toi', NULL, 2, NULL)
INSERT [dbo].[Menu] ([id], [name], [link], [meta], [hide], [order], [datebegin]) VALUES (3, N'Dự án thiện nguyện', NULL, N'du-an-thien-nguyen', NULL, 3, NULL)
INSERT [dbo].[Menu] ([id], [name], [link], [meta], [hide], [order], [datebegin]) VALUES (4, N'Tin tức - Sự kiện', NULL, N'tin-tuc-su-kien', NULL, 4, NULL)
INSERT [dbo].[Menu] ([id], [name], [link], [meta], [hide], [order], [datebegin]) VALUES (5, N'Danh sách ủng hộ', NULL, N'danh-sach-ung-ho', NULL, 5, NULL)
INSERT [dbo].[Menu] ([id], [name], [link], [meta], [hide], [order], [datebegin]) VALUES (6, N'Đóng góp', NULL, N'dong-gop', NULL, 6, NULL)
SET IDENTITY_INSERT [dbo].[Menu] OFF
GO
SET IDENTITY_INSERT [dbo].[News] ON 

INSERT [dbo].[News] ([IDnews], [NewsImage], [NewsName], [Descrpition], [meta], [hide], [order], [datebegin]) VALUES (1, N'about-1.jpg', N'Cùng chung tay giúp đỡ 7 sinh viên mồ côi đến trường', N'<p>V&agrave;o ng&agrave;y 17/11/2024, Quỹ Be Better đ&atilde; c&oacute; cơ hội đồng h&agrave;nh c&ugrave;ng thầy c&ocirc; v&agrave; c&aacute;c em học sinh Trường THCS Dương Văn Th&igrave; trong một chuyến thiện nguyện đầy &yacute; nghĩa.</p>

<p>Đ&acirc;y l&agrave; chương tr&igrave;nh Mentorship lần thứ 13 được triển khai. Đặc biệt hơn, đ&acirc;y l&agrave; lần đầu ti&ecirc;n Quỹ thực hiện Mentorship d&agrave;nh ri&ecirc;ng cho học sinh cấp 2. Format chương tr&igrave;nh được điều chỉnh để ph&ugrave; hợp với lứa tuổi 14-15, mang đến kh&ocirc;ng kh&iacute; mới mẻ nhưng vẫn lan tỏa được gi&aacute; trị m&agrave; Quỹ Be Better gửi gắm qua Mentorship.</p>

<p>Ch&uacute;ng t&ocirc;i vui mừng chia sẻ những kết quả t&iacute;ch cực v&agrave; ấn tượng m&agrave; chuyến thiện nguyện đ&atilde; đạt được.</p>

<h2><strong>I. Mục ti&ecirc;u chương tr&igrave;nh:</strong></h2>

<ul>
	<li>Truyền cảm hứng v&agrave; định hướng: Khơi dậy tinh thần học tập, định hướng tương lai, gi&uacute;p c&aacute;c em học sinh cấp 2 nu&ocirc;i dưỡng v&agrave; theo đuổi ước mơ.</li>
	<li>Hỗ trợ t&agrave;i ch&iacute;nh: trao học bổng khuyến học &ndash; t&agrave;i trợ học ph&iacute; v&agrave; bảo hiểm y tế cho học sinh c&oacute; ho&agrave;n cảnh kh&oacute; khăn, gi&uacute;p c&aacute;c em an t&acirc;m đến trường.</li>
	<li>X&eacute;t tuyển học bổng &ldquo;Thay Đổi Tương Lai&rdquo; cho c&aacute;c em học sinh c&oacute; ho&agrave;n cảnh kh&oacute; khăn nhưng gi&agrave;u ho&agrave;i b&atilde;o v&agrave; &yacute; ch&iacute; vươn l&ecirc;n.</li>
</ul>

<h2><strong>II. Th&ocirc;ng tin chi tiết:</strong></h2>

<ul>
	<li>Thời gian: Chủ nhật, ng&agrave;y 17/11/2024</li>
	<li>Địa điểm: Trường THCS Dương Văn Th&igrave;, huyện Nhơn Trạch, tỉnh Đồng Nai.</li>
</ul>

<h2><strong>III. C&aacute;c hoạt động nổi bật:</strong></h2>

<ol>
	<li>Buổi s&aacute;ng:</li>
</ol>

<ul>
	<li>Tổ chức chương tr&igrave;nh Mentorship lần thứ 7 với sự tham gia của hơn 300 học sinh khối 8 v&agrave; khối 9.</li>
</ul>

<p>&ndash; Chủ đề ch&iacute;nh: &ldquo;Chỉ c&oacute; kiến thức v&agrave; sự hiểu biết đ&uacute;ng đắn mới thay đổi cuộc đời&rdquo;.</p>

<p>&ndash; Cuộc thi Người Tri Thức: Kh&ocirc;ng chỉ truyền tải kinh nghiệm v&agrave; c&acirc;u chuyện từ c&aacute;c diễn giả, chương tr&igrave;nh c&ograve;n tạo kh&ocirc;ng gian đối thoại để hiểu r&otilde; suy nghĩ v&agrave; g&oacute;c nh&igrave;n của c&aacute;c em học sinh th&ocirc;ng qua cuộc thi Người Tri Thức. Tổng cộng c&oacute; 11 giải thưởng với tổng gi&aacute; trị 7,4 triệu đồng được trao cho c&aacute;c em học sinh tham gia thi.</p>

<ul>
	<li>&nbsp;T&agrave;i trợ học ph&iacute; v&agrave; bảo hiểm y tế cho 73 học sinh c&oacute; ho&agrave;n cảnh kh&oacute; khăn, cụ thể:</li>
</ul>

<p>&ndash; 20 học sinh diện hộ ngh&egrave;o/cận ngh&egrave;o: T&agrave;i trợ học ph&iacute; 405.000 đồng/em (9 th&aacute;ng), tổng cộng: 8,100,000 đồng.</p>

<p>&ndash; 53 học sinh ho&agrave;n cảnh đặc biệt kh&oacute; khăn:</p>

<p>+ T&agrave;i trợ bảo hiểm y tế: 884.520 đồng/em, tổng cộng: 46,879,560 đồng.</p>

<p>+ Trong đ&oacute;, 8 em được t&agrave;i trợ th&ecirc;m học ph&iacute;: 405.000 đồng/em, tổng cộng: 3,240,000 đồng.</p>

<p>&ndash; Tổng ng&acirc;n s&aacute;ch hỗ trợ: 58,219,560 đồng.</p>

<ol start="2">
	<li>Buổi chiều:</li>
</ol>

<p>Tổ chức phỏng vấn v&agrave; đ&aacute;nh gi&aacute; hồ sơ học bổng d&agrave;i hạn &ldquo;Thay Đổi Tương Lai&rdquo;:</p>

<p>&ndash; 14 học sinh được đề xuất v&agrave; l&agrave;m b&agrave;i kiểm tra tư duy, qua sơ loại c&ograve;n 11 em đủ điều kiện tham gia phỏng vấn.</p>

<p>&ndash; Kết quả sẽ được c&ocirc;ng bố sau khi chấm điểm v&agrave; x&eacute;t duyệt từ hội đồng.</p>
', N'cung-chung-tay-giup-o-7-sinh-vien-mo-coi-en-truong', NULL, NULL, CAST(N'2024-12-07T17:21:00' AS SmallDateTime))
INSERT [dbo].[News] ([IDnews], [NewsImage], [NewsName], [Descrpition], [meta], [hide], [order], [datebegin]) VALUES (2, N'about-1.jpg', N'Cùng chung tay giúp đỡ 7 sinh viên mồ côi đến trường', N'Tổng số học phí cần kêu gọi cho 7 sinh viên là 102.000.000 đồng. Quỹ Be Better cam kết sẽ dùng 100% số tiền kêu gọi để đóng học phí cho các em theo hạn mức học bổng mà các em đang nhận. Trong đó: 4 sinh viên nhận học bổng toàn phần, 2 sinh viên nhận học bổng bán phần, 1 sinh viên nhận học bổng khuyến khích. Bên cạnh đó, sau khi hoàn tất việc tài trợ học phí năm học 2024-2025 cho các em, Quỹ Be Better sẽ gửi báo cáo chi tiết đến quý mạnh thường quân. 

Kính mong quý mạnh thường quân, quý bạn thiện nguyện có thể dành thời gian đọc qua câu chuyện về các em trên bài viết Momo (bên link dưới), để có thể thấu hiểu hết được quá khứ tối tăm, cái khó khăn và hy vọng sống mãnh liệt của từng đứa trẻ mồ côi. 

Việc giúp đỡ các em được tiếp tục đi học, không chỉ là để các em có cơ hội nghề nghiệp sau này. Mà còn giúp các em thoát khỏi được một tuổi thơ, một hoàn cảnh vốn không còn lối thoát nào ngoài con đường học vấn. Để một ngày không xa nào đó, các em sẽ thực hiện được ước mơ của mình, kiến tạo nên một cuộc đời mới, một thế hệ mới – và sự thay đổi này, khởi nguồn là các em. ', N'cung-chung-tay-giup-do-7-sinh-vien-mo-coi-den-truong', NULL, NULL, NULL)
INSERT [dbo].[News] ([IDnews], [NewsImage], [NewsName], [Descrpition], [meta], [hide], [order], [datebegin]) VALUES (3, N'about-1.jpg', N'Cùng chung tay giúp đỡ 7 sinh viên mồ côi đến trường', N'Tổng số học phí cần kêu gọi cho 7 sinh viên là 102.000.000 đồng. Quỹ Be Better cam kết sẽ dùng 100% số tiền kêu gọi để đóng học phí cho các em theo hạn mức học bổng mà các em đang nhận. Trong đó: 4 sinh viên nhận học bổng toàn phần, 2 sinh viên nhận học bổng bán phần, 1 sinh viên nhận học bổng khuyến khích. Bên cạnh đó, sau khi hoàn tất việc tài trợ học phí năm học 2024-2025 cho các em, Quỹ Be Better sẽ gửi báo cáo chi tiết đến quý mạnh thường quân. 

Kính mong quý mạnh thường quân, quý bạn thiện nguyện có thể dành thời gian đọc qua câu chuyện về các em trên bài viết Momo (bên link dưới), để có thể thấu hiểu hết được quá khứ tối tăm, cái khó khăn và hy vọng sống mãnh liệt của từng đứa trẻ mồ côi. 

Việc giúp đỡ các em được tiếp tục đi học, không chỉ là để các em có cơ hội nghề nghiệp sau này. Mà còn giúp các em thoát khỏi được một tuổi thơ, một hoàn cảnh vốn không còn lối thoát nào ngoài con đường học vấn. Để một ngày không xa nào đó, các em sẽ thực hiện được ước mơ của mình, kiến tạo nên một cuộc đời mới, một thế hệ mới – và sự thay đổi này, khởi nguồn là các em. ', N'cung-chung-tay-giup-do-7-sinh-vien-mo-coi-den-truong', NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[News] OFF
GO
SET IDENTITY_INSERT [dbo].[submenu] ON 

INSERT [dbo].[submenu] ([id], [idparent], [name], [link], [meta], [hide], [order], [datebegin]) VALUES (1, 3, N'Dự án đang thực hiện', NULL, N'du-an-dang-thuc-hien', NULL, NULL, NULL)
INSERT [dbo].[submenu] ([id], [idparent], [name], [link], [meta], [hide], [order], [datebegin]) VALUES (2, 3, N'Dự án đã hoàn thành', NULL, N'du-an-da-hoan-thanh', NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[submenu] OFF
GO
SET IDENTITY_INSERT [dbo].[UserAccount] ON 

INSERT [dbo].[UserAccount] ([id], [username], [password], [userrole], [meta], [hide], [datebegin], [order]) VALUES (1, N'admin', N'123', NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[UserAccount] OFF
GO
ALTER TABLE [dbo].[submenu]  WITH CHECK ADD  CONSTRAINT [FK_submenu_Menu] FOREIGN KEY([idparent])
REFERENCES [dbo].[Menu] ([id])
GO
ALTER TABLE [dbo].[submenu] CHECK CONSTRAINT [FK_submenu_Menu]
GO
USE [master]
GO
ALTER DATABASE [CharityWebsite] SET  READ_WRITE 
GO
