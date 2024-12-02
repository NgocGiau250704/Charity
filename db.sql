USE [master]
GO
/****** Object:  Database [CharityWebsite]    Script Date: 11/11/2024 2:05:07 PM ******/
CREATE DATABASE [CharityWebsite]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CharityWebsite', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\CharityWebsite.mdf' , SIZE = 4288KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'CharityWebsite_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\CharityWebsite_log.ldf' , SIZE = 1072KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [CharityWebsite] SET COMPATIBILITY_LEVEL = 120
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
ALTER DATABASE [CharityWebsite] SET AUTO_CLOSE ON 
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
ALTER DATABASE [CharityWebsite] SET  ENABLE_BROKER 
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
ALTER DATABASE [CharityWebsite] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [CharityWebsite] SET  MULTI_USER 
GO
ALTER DATABASE [CharityWebsite] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CharityWebsite] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CharityWebsite] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CharityWebsite] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [CharityWebsite] SET DELAYED_DURABILITY = DISABLED 
GO
USE [CharityWebsite]
GO
/****** Object:  Table [dbo].[About]    Script Date: 11/11/2024 2:05:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[About](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[MoTaNgan] [nvarchar](max) NULL,
	[MoTaDayDu] [nvarchar](max) NULL,
	[image1] [nvarchar](max) NULL,
	[image2] [nvarchar](max) NULL,
	[meta] [nvarchar](max) NULL,
	[hide] [bit] NULL,
	[order] [int] NULL,
	[datebegin] [smalldatetime] NULL,
 CONSTRAINT [PK_About] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ContactInfor]    Script Date: 11/11/2024 2:05:07 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Donate]    Script Date: 11/11/2024 2:05:07 PM ******/
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
	[meta] [nvarchar](max) NULL,
	[order] [int] NULL,
	[hide] [bit] NULL,
 CONSTRAINT [PK__Donate__5C6A5BF3E13A8826] PRIMARY KEY CLUSTERED 
(
	[IDdonate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DuAn]    Script Date: 11/11/2024 2:05:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DuAn](
	[IDduan] [int] IDENTITY(1,1) NOT NULL,
	[ProjectName] [nvarchar](max) NULL,
	[datebegin] [smalldatetime] NULL,
	[meta] [nvarchar](max) NULL,
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[InforDonate]    Script Date: 11/11/2024 2:05:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InforDonate](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Message] [nvarchar](max) NULL,
	[Image] [nvarchar](max) NULL,
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Menu]    Script Date: 11/11/2024 2:05:07 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[News]    Script Date: 11/11/2024 2:05:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[News](
	[IDnews] [int] IDENTITY(1,1) NOT NULL,
	[NewsImage] [nvarchar](max) NULL,
	[NewsName] [nvarchar](max) NULL,
	[Descrpition] [nvarchar](max) NULL,
	[meta] [nvarchar](max) NULL,
	[hide] [bit] NULL,
	[order] [int] NULL,
	[datebegin] [smalldatetime] NULL,
 CONSTRAINT [PK__News__E16520A008DB2C6A] PRIMARY KEY CLUSTERED 
(
	[IDnews] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[submenu]    Script Date: 11/11/2024 2:05:07 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserAccount]    Script Date: 11/11/2024 2:05:07 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[About] ON 

INSERT [dbo].[About] ([id], [MoTaNgan], [MoTaDayDu], [image1], [image2], [meta], [hide], [order], [datebegin]) VALUES (1, N'1Chúng tôi là một tổ chức thiện nguyện không lợi nhuận, cam kết mang lại sự thay đổi tích cực cho cộng đồng thông qua các chương trình hỗ trợ giáo dục, chăm sóc sức khỏe và phát triển bền vững. Bằng cách kết nối những tấm lòng hảo tâm với những người cần giúp đỡ, chúng tôi nỗ lực xây dựng một xã hội công bằng và tốt đẹp hơn.', N'Chúng tôi tin rằng chỉ có kiến thức và sự hiểu biết đúng đắn mới có thể thay đổi cuộc đời. Thiện nguyện có rất nhiều việc cần làm. Tuy nhiên, Quỹ chúng tôi rất hạn hẹp tài chính và nguồn lực nên chúng tôi chỉ tập trung vào giáo dục cho các em cuối cấp II và cuối cấp III, giúp các em thật sự cần giúp đỡ để vượt qua những ngã rẽ quan trọng của cuộc đời, để thay đổi tương lai của các em và từ đó có thể thay đổi các thế hệ nối tiếp.

Mục tiêu chính và quan trọng nhất của Quỹ Be Better là giúp đỡ trẻ em có hoàn cảnh đặc biệt khó khăn được đến trường. “Hoàn cảnh đặc biệt khó khăn” có thể hiểu là gia cảnh nghèo ở vùng sâu, vùng xa, người đồng bào dân tộc thiểu số, hoặc mồ côi cha mẹ, gia đình không còn trụ cột chính có khả năng lao động kiếm tiền, nhưng các em có ý chí, có khả năng học, có ước mơ muốn thay đổi cuộc đời trong tương lai. Việc giúp đỡ các em học sinh, sinh viên có hoàn cảnh đặc biệt khó khăn bao gồm:', N'7028050b-e8f7-43ed-992f-b4822db990cc_courses-1.jpg', N'cd213222-193c-4d06-aec2-cc8c2056ec93_308c7248-5ba5-402f-ae69-5666334da9c0_team-4.jpg', N'1chung-toi-la-mot-to-chuc-thien-nguyen-khong-loi-nhuan-cam-ket-mang-lai-su-thay-oi-tich-cuc-cho-cong-ong-thong-qua-cac-chuong-trinh-ho-tro-giao-duc-cham-soc-suc-khoe-va-phat-trien-ben-vung-bang-cach-ket-noi-nhung-tam-long-hao-tam-voi-nhung-nguoi-can-giup-o-chung-toi-no-luc-xay-dung-mot-xa-hoi-cong-bang-va-tot-ep-hon', 1, NULL, CAST(N'2024-11-10 21:04:00' AS SmallDateTime))
INSERT [dbo].[About] ([id], [MoTaNgan], [MoTaDayDu], [image1], [image2], [meta], [hide], [order], [datebegin]) VALUES (2, N'123dasfads', N'342tewgijoasg', N'208ed9e4-8c70-4876-b744-de7ea4111fe2_3fffb21a-1610-4af0-aaff-3c8558bf8057_testimonial-3.jpg', N'6f139f91-8ce7-4a8c-90ef-83a5e935704e_carousel-1.jpg', N'123dasfads', 1, NULL, CAST(N'2024-11-10 20:14:00' AS SmallDateTime))
SET IDENTITY_INSERT [dbo].[About] OFF
INSERT [dbo].[ContactInfor] ([id], [address], [phone], [email], [meta], [hide], [order], [datebegin]) VALUES (1, N'Ton Duc Thang University', N'0123456789', N'tdt@gmail.com', NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Donate] ON 

INSERT [dbo].[Donate] ([IDdonate], [DonateMoney], [PersonDonateName], [Infor], [datebegin], [meta], [order], [hide]) VALUES (2, 100000, N'Nguyen Van A2', N'Nguyen Van A đóng góp', CAST(N'2024-11-11 10:18:00' AS SmallDateTime), NULL, NULL, NULL)
INSERT [dbo].[Donate] ([IDdonate], [DonateMoney], [PersonDonateName], [Infor], [datebegin], [meta], [order], [hide]) VALUES (3, 100000, N'Nguyen Van A', N'Nguyen Van A đóng góp', CAST(N'2024-01-01 00:00:00' AS SmallDateTime), NULL, NULL, NULL)
INSERT [dbo].[Donate] ([IDdonate], [DonateMoney], [PersonDonateName], [Infor], [datebegin], [meta], [order], [hide]) VALUES (4, 100000, N'Nguyen Van A', N'Nguyen Van A đóng góp', CAST(N'2024-01-01 00:00:00' AS SmallDateTime), NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Donate] OFF
SET IDENTITY_INSERT [dbo].[DuAn] ON 

INSERT [dbo].[DuAn] ([IDduan], [ProjectName], [datebegin], [meta], [hide], [order], [ProjectState], [TotalMoney], [QRcode], [Infor], [Situation], [ProjectImage], [Result], [WayToSupport]) VALUES (1, N'dự án 1', NULL, N'du-an-1', NULL, NULL, 1, 0, NULL, N'Nguyễn Văn A (sinh năm 2000)
Trường THPT , huyện Bình Tân, tỉnh Vĩnh Long', N'Ba chị em của Thanh Hằng lớn lên nhờ công việc đồng áng của cha mẹ. Chị cả – Thanh Hằng là người hiểu rõ nhất nỗi khổ tâm và sự vất vả của cha mẹ mình. Cha em năm nay đã 53 tuổi, chứng bệnh đau lưng và bệnh về máu là tác hại của nhiều năm mưu sinh bằng nghề trồng lúa. Mẹ em năm nay cũng đã 47 tuổi, công việc và nguồn thu nhập không ổn định, nếu không ai thuê gì thì mẹ sẽ ở nhà nội trợ, hoặc sẽ vụ tiếp việc đồng áng của cha. Ba trồng lúa, mẹ thì trồng đậu bắp để trang trải thêm phần nào cuộc sống. Cực nhọc là vậy, nhưng thu nhập của cả ba và mẹ trung bình chỉ khoảng 2-3 triệu đồng/ 1 tháng, nếu lỡ không may mất mùa, thì có thể con số sẽ còn thấp hơn rất nhiều. Mức thu nhập đó vừa phải chi trả chi phí sinh hoạt cho gia đình, vừa phải lo cho Thanh Hằng và hai đứa con nhỏ đi học. Mỗi ngày Thanh Hằng được cha mẹ cho 10 nghìn đi học, đối với người khác, đó có thể là một con số rất nhỏ, nhưng đối với em và những đứa trẻ như em, đó là tiền ăn cho cả một ngày. Dưới Thanh Hằng còn có hai em, đứa lớn hơn thì đang học tiểu học, đứa nhỏ nhất thì vừa vào mẫu giáo. Nếu không có bất kỳ sự giúp đỡ nào, việc Thanh Hằng được tiếp cận ngưỡng cửa đại học là một việc rất xa vời.', N'about-1.jpg', NULL, N'Tài trợ 100%học phí khi em học Nghề, Cao đẳng hoặc Đại học
Hỗ trợ tư vấn và định hướng nghề nghiệp, hỗ trợ công việc làm thêm, hỗ trợ chương trình Mentorship – giáo dục và định hướng tư duy chuẩn bị vào đời.
Điều kiện tiếp tục hỗ trợ:
Học sinh/sinh viên phải có sự nỗ lực trong học tập, trong việc cải thiện cuộc sống.
Hằng năm, Quỹ Be Better sẽ tổ chức xét tái cấp học bổng “Thay đổi tương lai” nhằm theo dõi và nhận định sát sao về mức độ cải thiện hoàn cảnh, kinh tế, cuộc sống và học tập của các em. Để tiếp tục nhận được học bổng qua mỗi năm, các em phải có sự nỗ lực và phát triển trong học tập, cuộc sống đồng thời đáp ứng được các tiêu chí Quỹ nêu ra.')
INSERT [dbo].[DuAn] ([IDduan], [ProjectName], [datebegin], [meta], [hide], [order], [ProjectState], [TotalMoney], [QRcode], [Infor], [Situation], [ProjectImage], [Result], [WayToSupport]) VALUES (2, N'dự án 2', CAST(N'2024-11-10 23:06:00' AS SmallDateTime), N'du-an-2', NULL, NULL, 0, 0, NULL, N'Nguyễn Văn A (sinh năm 2000)
Trường THPT , huyện Bình Tân, tỉnh Vĩnh Long', N'Ba chị em của Thanh Hằng lớn lên nhờ công việc đồng áng của cha mẹ. Chị cả – Thanh Hằng là người hiểu rõ nhất nỗi khổ tâm và sự vất vả của cha mẹ mình. Cha em năm nay đã 53 tuổi, chứng bệnh đau lưng và bệnh về máu là tác hại của nhiều năm mưu sinh bằng nghề trồng lúa. Mẹ em năm nay cũng đã 47 tuổi, công việc và nguồn thu nhập không ổn định, nếu không ai thuê gì thì mẹ sẽ ở nhà nội trợ, hoặc sẽ vụ tiếp việc đồng áng của cha. Ba trồng lúa, mẹ thì trồng đậu bắp để trang trải thêm phần nào cuộc sống. Cực nhọc là vậy, nhưng thu nhập của cả ba và mẹ trung bình chỉ khoảng 2-3 triệu đồng/ 1 tháng, nếu lỡ không may mất mùa, thì có thể con số sẽ còn thấp hơn rất nhiều. Mức thu nhập đó vừa phải chi trả chi phí sinh hoạt cho gia đình, vừa phải lo cho Thanh Hằng và hai đứa con nhỏ đi học. Mỗi ngày Thanh Hằng được cha mẹ cho 10 nghìn đi học, đối với người khác, đó có thể là một con số rất nhỏ, nhưng đối với em và những đứa trẻ như em, đó là tiền ăn cho cả một ngày. Dưới Thanh Hằng còn có hai em, đứa lớn hơn thì đang học tiểu học, đứa nhỏ nhất thì vừa vào mẫu giáo. Nếu không có bất kỳ sự giúp đỡ nào, việc Thanh Hằng được tiếp cận ngưỡng cửa đại học là một việc rất xa vời.', N'about-1.jpg', NULL, N'Tài trợ 100%học phí khi em học Nghề, Cao đẳng hoặc Đại học
Hỗ trợ tư vấn và định hướng nghề nghiệp, hỗ trợ công việc làm thêm, hỗ trợ chương trình Mentorship – giáo dục và định hướng tư duy chuẩn bị vào đời.
Điều kiện tiếp tục hỗ trợ:
Học sinh/sinh viên phải có sự nỗ lực trong học tập, trong việc cải thiện cuộc sống.
Hằng năm, Quỹ Be Better sẽ tổ chức xét tái cấp học bổng “Thay đổi tương lai” nhằm theo dõi và nhận định sát sao về mức độ cải thiện hoàn cảnh, kinh tế, cuộc sống và học tập của các em. Để tiếp tục nhận được học bổng qua mỗi năm, các em phải có sự nỗ lực và phát triển trong học tập, cuộc sống đồng thời đáp ứng được các tiêu chí Quỹ nêu ra.')
INSERT [dbo].[DuAn] ([IDduan], [ProjectName], [datebegin], [meta], [hide], [order], [ProjectState], [TotalMoney], [QRcode], [Infor], [Situation], [ProjectImage], [Result], [WayToSupport]) VALUES (3, N'dự án 3', CAST(N'2024-11-10 23:06:00' AS SmallDateTime), N'du-an-3', NULL, NULL, 0, 0, NULL, N'Nguyễn Văn A (sinh năm 2000)
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
INSERT [dbo].[DuAn] ([IDduan], [ProjectName], [datebegin], [meta], [hide], [order], [ProjectState], [TotalMoney], [QRcode], [Infor], [Situation], [ProjectImage], [Result], [WayToSupport]) VALUES (5, N'dự án 5', CAST(N'2024-11-10 23:05:00' AS SmallDateTime), N'du-an-5', NULL, NULL, 0, 0, NULL, N'Nguyễn Văn A (sinh năm 2000)
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
INSERT [dbo].[DuAn] ([IDduan], [ProjectName], [datebegin], [meta], [hide], [order], [ProjectState], [TotalMoney], [QRcode], [Infor], [Situation], [ProjectImage], [Result], [WayToSupport]) VALUES (8, N'dự án 8', CAST(N'2024-11-11 09:46:00' AS SmallDateTime), N'du-an-8', NULL, NULL, 0, 0, NULL, N'Nguyễn Văn A (sinh năm 2000)
Trường THPT , huyện Bình Tân, tỉnh Vĩnh Long', N'Ba chị em của Thanh Hằng lớn lên nhờ công việc đồng áng của cha mẹ. Chị cả – Thanh Hằng là người hiểu rõ nhất nỗi khổ tâm và sự vất vả của cha mẹ mình. Cha em năm nay đã 53 tuổi, chứng bệnh đau lưng và bệnh về máu là tác hại của nhiều năm mưu sinh bằng nghề trồng lúa. Mẹ em năm nay cũng đã 47 tuổi, công việc và nguồn thu nhập không ổn định, nếu không ai thuê gì thì mẹ sẽ ở nhà nội trợ, hoặc sẽ vụ tiếp việc đồng áng của cha. Ba trồng lúa, mẹ thì trồng đậu bắp để trang trải thêm phần nào cuộc sống. Cực nhọc là vậy, nhưng thu nhập của cả ba và mẹ trung bình chỉ khoảng 2-3 triệu đồng/ 1 tháng, nếu lỡ không may mất mùa, thì có thể con số sẽ còn thấp hơn rất nhiều. Mức thu nhập đó vừa phải chi trả chi phí sinh hoạt cho gia đình, vừa phải lo cho Thanh Hằng và hai đứa con nhỏ đi học. Mỗi ngày Thanh Hằng được cha mẹ cho 10 nghìn đi học, đối với người khác, đó có thể là một con số rất nhỏ, nhưng đối với em và những đứa trẻ như em, đó là tiền ăn cho cả một ngày. Dưới Thanh Hằng còn có hai em, đứa lớn hơn thì đang học tiểu học, đứa nhỏ nhất thì vừa vào mẫu giáo. Nếu không có bất kỳ sự giúp đỡ nào, việc Thanh Hằng được tiếp cận ngưỡng cửa đại học là một việc rất xa vời.', N'about-1.jpg', NULL, N'Tài trợ 100%học phí khi em học Nghề, Cao đẳng hoặc Đại học
Hỗ trợ tư vấn và định hướng nghề nghiệp, hỗ trợ công việc làm thêm, hỗ trợ chương trình Mentorship – giáo dục và định hướng tư duy chuẩn bị vào đời.
Điều kiện tiếp tục hỗ trợ:
Học sinh/sinh viên phải có sự nỗ lực trong học tập, trong việc cải thiện cuộc sống.
Hằng năm, Quỹ Be Better sẽ tổ chức xét tái cấp học bổng “Thay đổi tương lai” nhằm theo dõi và nhận định sát sao về mức độ cải thiện hoàn cảnh, kinh tế, cuộc sống và học tập của các em. Để tiếp tục nhận được học bổng qua mỗi năm, các em phải có sự nỗ lực và phát triển trong học tập, cuộc sống đồng thời đáp ứng được các tiêu chí Quỹ nêu ra.')
INSERT [dbo].[DuAn] ([IDduan], [ProjectName], [datebegin], [meta], [hide], [order], [ProjectState], [TotalMoney], [QRcode], [Infor], [Situation], [ProjectImage], [Result], [WayToSupport]) VALUES (9, N'dự án 9', CAST(N'2024-11-10 23:06:00' AS SmallDateTime), N'du-an-9', NULL, NULL, 0, 0, NULL, N'Nguyễn Văn A (sinh năm 2000)
Trường THPT , huyện Bình Tân, tỉnh Vĩnh Long', N'Ba chị em của Thanh Hằng lớn lên nhờ công việc đồng áng của cha mẹ. Chị cả – Thanh Hằng là người hiểu rõ nhất nỗi khổ tâm và sự vất vả của cha mẹ mình. Cha em năm nay đã 53 tuổi, chứng bệnh đau lưng và bệnh về máu là tác hại của nhiều năm mưu sinh bằng nghề trồng lúa. Mẹ em năm nay cũng đã 47 tuổi, công việc và nguồn thu nhập không ổn định, nếu không ai thuê gì thì mẹ sẽ ở nhà nội trợ, hoặc sẽ vụ tiếp việc đồng áng của cha. Ba trồng lúa, mẹ thì trồng đậu bắp để trang trải thêm phần nào cuộc sống. Cực nhọc là vậy, nhưng thu nhập của cả ba và mẹ trung bình chỉ khoảng 2-3 triệu đồng/ 1 tháng, nếu lỡ không may mất mùa, thì có thể con số sẽ còn thấp hơn rất nhiều. Mức thu nhập đó vừa phải chi trả chi phí sinh hoạt cho gia đình, vừa phải lo cho Thanh Hằng và hai đứa con nhỏ đi học. Mỗi ngày Thanh Hằng được cha mẹ cho 10 nghìn đi học, đối với người khác, đó có thể là một con số rất nhỏ, nhưng đối với em và những đứa trẻ như em, đó là tiền ăn cho cả một ngày. Dưới Thanh Hằng còn có hai em, đứa lớn hơn thì đang học tiểu học, đứa nhỏ nhất thì vừa vào mẫu giáo. Nếu không có bất kỳ sự giúp đỡ nào, việc Thanh Hằng được tiếp cận ngưỡng cửa đại học là một việc rất xa vời.', N'about-1.jpg', NULL, N'Tài trợ 100%học phí khi em học Nghề, Cao đẳng hoặc Đại học
Hỗ trợ tư vấn và định hướng nghề nghiệp, hỗ trợ công việc làm thêm, hỗ trợ chương trình Mentorship – giáo dục và định hướng tư duy chuẩn bị vào đời.
Điều kiện tiếp tục hỗ trợ:
Học sinh/sinh viên phải có sự nỗ lực trong học tập, trong việc cải thiện cuộc sống.
Hằng năm, Quỹ Be Better sẽ tổ chức xét tái cấp học bổng “Thay đổi tương lai” nhằm theo dõi và nhận định sát sao về mức độ cải thiện hoàn cảnh, kinh tế, cuộc sống và học tập của các em. Để tiếp tục nhận được học bổng qua mỗi năm, các em phải có sự nỗ lực và phát triển trong học tập, cuộc sống đồng thời đáp ứng được các tiêu chí Quỹ nêu ra.')
INSERT [dbo].[DuAn] ([IDduan], [ProjectName], [datebegin], [meta], [hide], [order], [ProjectState], [TotalMoney], [QRcode], [Infor], [Situation], [ProjectImage], [Result], [WayToSupport]) VALUES (11, N'dự án 15', CAST(N'2024-11-11 09:46:00' AS SmallDateTime), N'du-an-15', NULL, NULL, 1, 54512356, NULL, N'Nguyễn Văn A (sinh năm 2000) Trường THPT , huyện Bình Tân, tỉnh Vĩnh Long', N'Ba chị em của Thanh Hằng lớn lên nhờ công việc đồng áng của cha mẹ. Chị cả – Thanh Hằng là người hiểu rõ nhất nỗi khổ tâm và sự vất vả của cha mẹ mình. Cha em năm nay đã 53 tuổi, chứng bệnh đau lưng và bệnh về máu là tác hại của nhiều năm mưu sinh bằng nghề trồng lúa. Mẹ em năm nay cũng đã 47 tuổi, công việc và nguồn thu nhập không ổn định, nếu không ai thuê gì thì mẹ sẽ ở nhà nội trợ, hoặc sẽ vụ tiếp việc đồng áng của cha. Ba trồng lúa, mẹ thì trồng đậu bắp để trang trải thêm phần nào cuộc sống. Cực nhọc là vậy, nhưng thu nhập của cả ba và mẹ trung bình chỉ khoảng 2-3 triệu đồng/ 1 tháng, nếu lỡ không may mất mùa, thì có thể con số sẽ còn thấp hơn rất nhiều. Mức thu nhập đó vừa phải chi trả chi phí sinh hoạt cho gia đình, vừa phải lo cho Thanh Hằng và hai đứa con nhỏ đi học. Mỗi ngày Thanh Hằng được cha mẹ cho 10 nghìn đi học, đối với người khác, đó có thể là một con số rất nhỏ, nhưng đối với em và những đứa trẻ như em, đó là tiền ăn cho cả một ngày. Dưới Thanh Hằng còn có hai em, đứa lớn hơn thì đang học tiểu học, đứa nhỏ nhất thì vừa vào mẫu giáo. Nếu không có bất kỳ sự giúp đỡ nào, việc Thanh Hằng được tiếp cận ngưỡng cửa đại học là một việc rất xa vời.', N'684be90c-fdfa-4771-9ff4-647e8c67f1c2_courses-1.jpg', NULL, N'Tài trợ 100%học phí khi em học Nghề, Cao đẳng hoặc Đại học Hỗ trợ tư vấn và định hướng nghề nghiệp, hỗ trợ công việc làm thêm, hỗ trợ chương trình Mentorship – giáo dục và định hướng tư duy chuẩn bị vào đời. Điều kiện tiếp tục hỗ trợ: Học sinh/sinh viên phải có sự nỗ lực trong học tập, trong việc cải thiện cuộc sống. Hằng năm, Quỹ Be Better sẽ tổ chức xét tái cấp học bổng “Thay đổi tương lai” nhằm theo dõi và nhận định sát sao về mức độ cải thiện hoàn cảnh, kinh tế, cuộc sống và học tập của các em. Để tiếp tục nhận được học bổng qua mỗi năm, các em phải có sự nỗ lực và phát triển trong học tập, cuộc sống đồng thời đáp ứng được các tiêu chí Quỹ nêu ra.')
SET IDENTITY_INSERT [dbo].[DuAn] OFF
SET IDENTITY_INSERT [dbo].[InforDonate] ON 

INSERT [dbo].[InforDonate] ([id], [Message], [Image], [Banknumber], [Beneficiary], [Bank], [meta], [hide], [order], [datebegin]) VALUES (1, N'Tên người gửi + Nội dung tài trợ Ví dụ: Nguyen Van A – giup em den truong', N'qrcode.png', N'012345', N'Nguyen Van A', N'vietcombank', NULL, NULL, NULL, NULL)
INSERT [dbo].[InforDonate] ([id], [Message], [Image], [Banknumber], [Beneficiary], [Bank], [meta], [hide], [order], [datebegin]) VALUES (2, N'123123', N'52700824-f14b-4049-99d7-f635bfb60291_88ac3d2c-974f-4b67-9dc5-0dd7b9c1ca96_e154f6b0-294d-4b0b-a050-9bf724e8add5_team-4.jpg', N'123', N'123', N'123', NULL, 1, NULL, CAST(N'2024-11-11 13:48:00' AS SmallDateTime))
SET IDENTITY_INSERT [dbo].[InforDonate] OFF
SET IDENTITY_INSERT [dbo].[Menu] ON 

INSERT [dbo].[Menu] ([id], [name], [link], [meta], [hide], [order], [datebegin]) VALUES (1, N'Trang chủ', NULL, N'trang-chu', NULL, 1, NULL)
INSERT [dbo].[Menu] ([id], [name], [link], [meta], [hide], [order], [datebegin]) VALUES (2, N'Về chúng tôi', NULL, N've-chung-toi', NULL, 2, NULL)
INSERT [dbo].[Menu] ([id], [name], [link], [meta], [hide], [order], [datebegin]) VALUES (3, N'Dự án thiện nguyện', NULL, N'du-an-thien-nguyen', NULL, 3, NULL)
INSERT [dbo].[Menu] ([id], [name], [link], [meta], [hide], [order], [datebegin]) VALUES (4, N'Tin tức - Sự kiện', NULL, N'tin-tuc-su-kien', NULL, 4, NULL)
INSERT [dbo].[Menu] ([id], [name], [link], [meta], [hide], [order], [datebegin]) VALUES (5, N'Danh sách ủng hộ', NULL, N'danh-sach-ung-ho', NULL, 5, NULL)
INSERT [dbo].[Menu] ([id], [name], [link], [meta], [hide], [order], [datebegin]) VALUES (6, N'Đóng góp', NULL, N'dong-gop', NULL, 6, NULL)
SET IDENTITY_INSERT [dbo].[Menu] OFF
SET IDENTITY_INSERT [dbo].[News] ON 

INSERT [dbo].[News] ([IDnews], [NewsImage], [NewsName], [Descrpition], [meta], [hide], [order], [datebegin]) VALUES (1, N'c596b868-b897-4fd0-a518-ee039b9980a7_courses-1.jpg', N'Cùng chung tay giúp đỡ 7 sinh viên mồ côi đến trường', N'1Tổng số học phí cần kêu gọi cho 7 sinh viên là 102.000.000 đồng. Quỹ Be Better cam kết sẽ dùng 100% số tiền kêu gọi để đóng học phí cho các em theo hạn mức học bổng mà các em đang nhận. Trong đó: 4 sinh viên nhận học bổng toàn phần, 2 sinh viên nhận học bổng bán phần, 1 sinh viên nhận học bổng khuyến khích. Bên cạnh đó, sau khi hoàn tất việc tài trợ học phí năm học 2024-2025 cho các em, Quỹ Be Better sẽ gửi báo cáo chi tiết đến quý mạnh thường quân. 
Kính mong quý mạnh thường quân, quý bạn thiện nguyện có thể dành thời gian đọc qua câu chuyện về các em trên bài viết Momo (bên link dưới), để có thể thấu hiểu hết được quá khứ tối tăm, cái khó khăn và hy vọng sống mãnh liệt của từng đứa trẻ mồ côi. 

Việc giúp đỡ các em được tiếp tục đi học, không chỉ là để các em có cơ hội nghề nghiệp sau này. Mà còn giúp các em thoát khỏi được một tuổi thơ, một hoàn cảnh vốn không còn lối thoát nào ngoài con đường học vấn. Để một ngày không xa nào đó, các em sẽ thực hiện được ước mơ của mình, kiến tạo nên một cuộc đời mới, một thế hệ mới – và sự thay đổi này, khởi nguồn là các em. ', N'cung-chung-tay-giup-do-7-sinh-vien-mo-coi-den-truong', 1, NULL, CAST(N'2024-11-10 19:31:00' AS SmallDateTime))
INSERT [dbo].[News] ([IDnews], [NewsImage], [NewsName], [Descrpition], [meta], [hide], [order], [datebegin]) VALUES (2, N'7ec368a3-7b45-40b8-bd46-379443d7db90_courses-1.jpg', N'Cùng chung tay giúp đỡ 7 sinh viên mồ côi đến trường', N'2Tổng số học phí cần kêu gọi cho 7 sinh viên là 102.000.000 đồng. Quỹ Be Better cam kết sẽ dùng 100% số tiền kêu gọi để đóng học phí cho các em theo hạn mức học bổng mà các em đang nhận. Trong đó: 4 sinh viên nhận học bổng toàn phần, 2 sinh viên nhận học bổng bán phần, 1 sinh viên nhận học bổng khuyến khích. Bên cạnh đó, sau khi hoàn tất việc tài trợ học phí năm học 2024-2025 cho các em, Quỹ Be Better sẽ gửi báo cáo chi tiết đến quý mạnh thường quân. 

Kính mong quý mạnh thường quân, quý bạn thiện nguyện có thể dành thời gian đọc qua câu chuyện về các em trên bài viết Momo (bên link dưới), để có thể thấu hiểu hết được quá khứ tối tăm, cái khó khăn và hy vọng sống mãnh liệt của từng đứa trẻ mồ côi. 

Việc giúp đỡ các em được tiếp tục đi học, không chỉ là để các em có cơ hội nghề nghiệp sau này. Mà còn giúp các em thoát khỏi được một tuổi thơ, một hoàn cảnh vốn không còn lối thoát nào ngoài con đường học vấn. Để một ngày không xa nào đó, các em sẽ thực hiện được ước mơ của mình, kiến tạo nên một cuộc đời mới, một thế hệ mới – và sự thay đổi này, khởi nguồn là các em. ', N'cung-chung-tay-giup-do-7-sinh-vien-mo-coi-den-truong', 1, NULL, CAST(N'2024-11-10 19:31:00' AS SmallDateTime))
INSERT [dbo].[News] ([IDnews], [NewsImage], [NewsName], [Descrpition], [meta], [hide], [order], [datebegin]) VALUES (17, N'274a3283-24f0-4ffa-8e88-a59df3ae0d83_team-4.jpg', N'dinh dung nè em', N'qua tuyệt vời', N'dinh-dung-ne-em', 1, NULL, CAST(N'2024-11-10 21:01:00' AS SmallDateTime))
SET IDENTITY_INSERT [dbo].[News] OFF
SET IDENTITY_INSERT [dbo].[submenu] ON 

INSERT [dbo].[submenu] ([id], [idparent], [name], [link], [meta], [hide], [order], [datebegin]) VALUES (1, 3, N'Dự án đang thực hiện', NULL, N'du-an-dang-thuc-hien', NULL, NULL, NULL)
INSERT [dbo].[submenu] ([id], [idparent], [name], [link], [meta], [hide], [order], [datebegin]) VALUES (2, 3, N'Dự án đã hoàn thành', NULL, N'du-an-da-hoan-thanh', NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[submenu] OFF
SET IDENTITY_INSERT [dbo].[UserAccount] ON 

INSERT [dbo].[UserAccount] ([id], [username], [password], [userrole], [meta], [hide], [datebegin], [order]) VALUES (1, N'admin', N'123', NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[UserAccount] OFF
ALTER TABLE [dbo].[submenu]  WITH CHECK ADD  CONSTRAINT [FK_submenu_Menu] FOREIGN KEY([idparent])
REFERENCES [dbo].[Menu] ([id])
GO
ALTER TABLE [dbo].[submenu] CHECK CONSTRAINT [FK_submenu_Menu]
GO
USE [master]
GO
ALTER DATABASE [CharityWebsite] SET  READ_WRITE 
GO

