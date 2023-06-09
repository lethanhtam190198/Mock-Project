USE [master]
GO
/****** Object:  Database [quiz]    Script Date: 6/1/2023 3:08:17 PM ******/
CREATE DATABASE [quiz]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'quiz', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER01\MSSQL\DATA\quiz.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'quiz_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER01\MSSQL\DATA\quiz_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [quiz] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [quiz].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [quiz] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [quiz] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [quiz] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [quiz] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [quiz] SET ARITHABORT OFF 
GO
ALTER DATABASE [quiz] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [quiz] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [quiz] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [quiz] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [quiz] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [quiz] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [quiz] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [quiz] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [quiz] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [quiz] SET  ENABLE_BROKER 
GO
ALTER DATABASE [quiz] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [quiz] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [quiz] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [quiz] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [quiz] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [quiz] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [quiz] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [quiz] SET RECOVERY FULL 
GO
ALTER DATABASE [quiz] SET  MULTI_USER 
GO
ALTER DATABASE [quiz] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [quiz] SET DB_CHAINING OFF 
GO
ALTER DATABASE [quiz] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [quiz] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [quiz] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [quiz] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'quiz', N'ON'
GO
ALTER DATABASE [quiz] SET QUERY_STORE = OFF
GO
USE [quiz]
GO
/****** Object:  Table [dbo].[category]    Script Date: 6/1/2023 3:08:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[category](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[classes]    Script Date: 6/1/2023 3:08:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[classes](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[course]    Script Date: 6/1/2023 3:08:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[course](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[categoryid] [int] NULL,
	[classid] [int] NULL,
	[name] [nvarchar](100) NULL,
	[status] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[exam]    Script Date: 6/1/2023 3:08:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[exam](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[userid] [int] NULL,
	[point] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[purchaseVIP]    Script Date: 6/1/2023 3:08:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[purchaseVIP](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[userid] [int] NULL,
	[vipid] [int] NULL,
	[timepurchase] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[question]    Script Date: 6/1/2023 3:08:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[question](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[content] [nvarchar](200) NULL,
	[trueAnswer] [nvarchar](100) NULL,
	[falseAnswer] [nvarchar](100) NULL,
	[courseid] [int] NULL,
	[status] [varchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[questionforexam]    Script Date: 6/1/2023 3:08:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[questionforexam](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[examid] [int] NULL,
	[questionid] [int] NULL,
	[answer] [ntext] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[roles]    Script Date: 6/1/2023 3:08:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[roles](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[userrole]    Script Date: 6/1/2023 3:08:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[userrole](
	[username] [varchar](100) NULL,
	[roleid] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users]    Script Date: 6/1/2023 3:08:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nameofparent] [nvarchar](100) NULL,
	[nameofstudent] [nvarchar](100) NULL,
	[username] [varchar](100) NULL,
	[email] [varchar](100) NULL,
	[phone] [varchar](20) NULL,
	[password] [ntext] NULL,
	[avatar] [ntext] NULL,
	[status] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[vip]    Script Date: 6/1/2023 3:08:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[vip](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](20) NULL,
	[price] [money] NULL,
	[duration] [int] NULL,
	[status] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[category] ON 

INSERT [dbo].[category] ([id], [name]) VALUES (1, N'MATH')
INSERT [dbo].[category] ([id], [name]) VALUES (2, N'VIETNAMESE')
INSERT [dbo].[category] ([id], [name]) VALUES (3, N'ENGLISH')
SET IDENTITY_INSERT [dbo].[category] OFF
GO
SET IDENTITY_INSERT [dbo].[classes] ON 

INSERT [dbo].[classes] ([id], [name]) VALUES (1, N'1')
INSERT [dbo].[classes] ([id], [name]) VALUES (2, N'2')
INSERT [dbo].[classes] ([id], [name]) VALUES (3, N'3')
INSERT [dbo].[classes] ([id], [name]) VALUES (4, N'4')
INSERT [dbo].[classes] ([id], [name]) VALUES (5, N'5')
SET IDENTITY_INSERT [dbo].[classes] OFF
GO
SET IDENTITY_INSERT [dbo].[course] ON 

INSERT [dbo].[course] ([id], [categoryid], [classid], [name], [status]) VALUES (6, 1, 5, N'Toán số thập phân', N'on')
INSERT [dbo].[course] ([id], [categoryid], [classid], [name], [status]) VALUES (7, 1, 5, N'Hình học tam giác', N'on')
INSERT [dbo].[course] ([id], [categoryid], [classid], [name], [status]) VALUES (8, 1, 5, N'Hình học hình tròn', N'on')
INSERT [dbo].[course] ([id], [categoryid], [classid], [name], [status]) VALUES (9, 1, 5, N'Hình hộp chữ nhật. Hình lập phương', N'on')
INSERT [dbo].[course] ([id], [categoryid], [classid], [name], [status]) VALUES (10, 3, 5, N'What is your address?', N'on')
INSERT [dbo].[course] ([id], [categoryid], [classid], [name], [status]) VALUES (11, 3, 5, N'Where did you go on vacation?', N'on')
INSERT [dbo].[course] ([id], [categoryid], [classid], [name], [status]) VALUES (12, 3, 5, N'Where will you be this weekend?', N'on')
INSERT [dbo].[course] ([id], [categoryid], [classid], [name], [status]) VALUES (13, 3, 5, N'What are you reading?', N'on')
INSERT [dbo].[course] ([id], [categoryid], [classid], [name], [status]) VALUES (14, 2, 5, N'Việt Nam - tổ quốc em', N'on')
INSERT [dbo].[course] ([id], [categoryid], [classid], [name], [status]) VALUES (15, 2, 5, N'Cánh chim hòa bình', N'on')
INSERT [dbo].[course] ([id], [categoryid], [classid], [name], [status]) VALUES (16, 2, 5, N'Con người với thiên nhiên', N'on')
INSERT [dbo].[course] ([id], [categoryid], [classid], [name], [status]) VALUES (17, 2, 5, N'Vì hạnh phúc con người', N'on')
INSERT [dbo].[course] ([id], [categoryid], [classid], [name], [status]) VALUES (18, 1, 1, N'So sánh số', N'on')
INSERT [dbo].[course] ([id], [categoryid], [classid], [name], [status]) VALUES (19, 1, 1, N'Nhiều hơn - ít hơn', N'on')
INSERT [dbo].[course] ([id], [categoryid], [classid], [name], [status]) VALUES (20, 1, 1, N'Hình vuông - hình tròn', N'on')
INSERT [dbo].[course] ([id], [categoryid], [classid], [name], [status]) VALUES (21, 1, 1, N'Hình tam giác', N'on')
INSERT [dbo].[course] ([id], [categoryid], [classid], [name], [status]) VALUES (22, 1, 1, N'Cộng hai số có 1 chữ số', N'vip')
INSERT [dbo].[course] ([id], [categoryid], [classid], [name], [status]) VALUES (23, 1, 1, N'Nhiều hơn - ít hơn - bằng nhau', N'vip')
INSERT [dbo].[course] ([id], [categoryid], [classid], [name], [status]) VALUES (24, 2, 1, N'Bông hoa niềm vui', N'on')
INSERT [dbo].[course] ([id], [categoryid], [classid], [name], [status]) VALUES (25, 2, 1, N'Những bông hoa nhỏ trên sân', N'on')
INSERT [dbo].[course] ([id], [categoryid], [classid], [name], [status]) VALUES (26, 2, 1, N'Cô chổi rơm', N'on')
INSERT [dbo].[course] ([id], [categoryid], [classid], [name], [status]) VALUES (27, 2, 1, N'Mít học vẽ tranh', N'on')
INSERT [dbo].[course] ([id], [categoryid], [classid], [name], [status]) VALUES (28, 2, 1, N'Cùng vui chơi', N'vip')
INSERT [dbo].[course] ([id], [categoryid], [classid], [name], [status]) VALUES (29, 2, 1, N'Câu chuyện về giấy kẻ', N'vip')
INSERT [dbo].[course] ([id], [categoryid], [classid], [name], [status]) VALUES (30, 3, 1, N'In the school playground', N'on')
INSERT [dbo].[course] ([id], [categoryid], [classid], [name], [status]) VALUES (31, 3, 1, N'In the dining room', N'on')
INSERT [dbo].[course] ([id], [categoryid], [classid], [name], [status]) VALUES (32, 3, 1, N'At the street market', N'on')
INSERT [dbo].[course] ([id], [categoryid], [classid], [name], [status]) VALUES (33, 3, 1, N'In the bedroom', N'on')
INSERT [dbo].[course] ([id], [categoryid], [classid], [name], [status]) VALUES (34, 3, 1, N'At the fish and chip shop', N'vip')
INSERT [dbo].[course] ([id], [categoryid], [classid], [name], [status]) VALUES (35, 3, 1, N'In the classroom', N'vip')
INSERT [dbo].[course] ([id], [categoryid], [classid], [name], [status]) VALUES (36, 1, 2, N'Đề-xi-mét', N'on')
INSERT [dbo].[course] ([id], [categoryid], [classid], [name], [status]) VALUES (37, 1, 2, N'Số hạng - Tổng', N'on')
INSERT [dbo].[course] ([id], [categoryid], [classid], [name], [status]) VALUES (38, 1, 2, N'Số bị trừ - Số trừ - Hiệu', N'on')
INSERT [dbo].[course] ([id], [categoryid], [classid], [name], [status]) VALUES (39, 1, 2, N'Cộng không nhớ - trong phạm vi 20', N'on')
INSERT [dbo].[course] ([id], [categoryid], [classid], [name], [status]) VALUES (40, 1, 2, N'Cộng hai số có 2 chữ số', N'vip')
INSERT [dbo].[course] ([id], [categoryid], [classid], [name], [status]) VALUES (41, 1, 2, N'Trừ hai số có 2 chữ số', N'vip')
INSERT [dbo].[course] ([id], [categoryid], [classid], [name], [status]) VALUES (42, 2, 2, N'Tôi là học sinh lớp 2', N'on')
INSERT [dbo].[course] ([id], [categoryid], [classid], [name], [status]) VALUES (43, 2, 2, N'Ngày hôm qua đâu rồi', N'on')
INSERT [dbo].[course] ([id], [categoryid], [classid], [name], [status]) VALUES (44, 2, 2, N'Niềm vui của Bi và Bống', N'on')
INSERT [dbo].[course] ([id], [categoryid], [classid], [name], [status]) VALUES (45, 2, 2, N'Một giờ học', N'on')
INSERT [dbo].[course] ([id], [categoryid], [classid], [name], [status]) VALUES (46, 2, 2, N'Cây xấu hổ', N'vip')
INSERT [dbo].[course] ([id], [categoryid], [classid], [name], [status]) VALUES (47, 2, 2, N'Cô giáo lớp em', N'vip')
INSERT [dbo].[course] ([id], [categoryid], [classid], [name], [status]) VALUES (48, 3, 2, N'At my birthday party', N'on')
INSERT [dbo].[course] ([id], [categoryid], [classid], [name], [status]) VALUES (49, 3, 2, N'In the backyard', N'on')
INSERT [dbo].[course] ([id], [categoryid], [classid], [name], [status]) VALUES (50, 3, 2, N'At the seaside', N'on')
INSERT [dbo].[course] ([id], [categoryid], [classid], [name], [status]) VALUES (51, 3, 2, N'In the countryside', N'on')
INSERT [dbo].[course] ([id], [categoryid], [classid], [name], [status]) VALUES (52, 3, 2, N'In the classroom', N'vip')
INSERT [dbo].[course] ([id], [categoryid], [classid], [name], [status]) VALUES (53, 3, 2, N'On the farm', N'vip')
INSERT [dbo].[course] ([id], [categoryid], [classid], [name], [status]) VALUES (54, 1, 3, N'Mét', N'on')
INSERT [dbo].[course] ([id], [categoryid], [classid], [name], [status]) VALUES (55, 1, 3, N'Xem đồng hồ', N'on')
INSERT [dbo].[course] ([id], [categoryid], [classid], [name], [status]) VALUES (56, 1, 3, N'Bài toán giải bằng hai bước tính', N'on')
INSERT [dbo].[course] ([id], [categoryid], [classid], [name], [status]) VALUES (57, 1, 3, N'Tìm thừa số', N'on')
INSERT [dbo].[course] ([id], [categoryid], [classid], [name], [status]) VALUES (58, 1, 3, N'Tìm số bị chia - tìm số chia', N'vip')
INSERT [dbo].[course] ([id], [categoryid], [classid], [name], [status]) VALUES (59, 1, 3, N'Làm tròn số', N'vip')
INSERT [dbo].[course] ([id], [categoryid], [classid], [name], [status]) VALUES (60, 2, 3, N'Chiếc nhãn vở đặc biệt', N'on')
INSERT [dbo].[course] ([id], [categoryid], [classid], [name], [status]) VALUES (61, 2, 3, N'Lắng nghe những ước mơ', N'on')
INSERT [dbo].[course] ([id], [categoryid], [classid], [name], [status]) VALUES (62, 2, 3, N'Em vui tới trường', N'on')
INSERT [dbo].[course] ([id], [categoryid], [classid], [name], [status]) VALUES (63, 2, 3, N'Nhớ lại buổi học đầu tiên', N'on')
INSERT [dbo].[course] ([id], [categoryid], [classid], [name], [status]) VALUES (64, 2, 3, N'Cậu học sinh mới', N'vip')
INSERT [dbo].[course] ([id], [categoryid], [classid], [name], [status]) VALUES (65, 2, 3, N'Bản tin Ngày hội Nghệ sĩ nhí', N'vip')
INSERT [dbo].[course] ([id], [categoryid], [classid], [name], [status]) VALUES (66, 3, 3, N'This is your doll', N'on')
INSERT [dbo].[course] ([id], [categoryid], [classid], [name], [status]) VALUES (67, 3, 3, N'That is his ruler', N'on')
INSERT [dbo].[course] ([id], [categoryid], [classid], [name], [status]) VALUES (68, 3, 3, N'Let’s find mom', N'on')
INSERT [dbo].[course] ([id], [categoryid], [classid], [name], [status]) VALUES (69, 3, 3, N'I like monkeys', N'on')
INSERT [dbo].[course] ([id], [categoryid], [classid], [name], [status]) VALUES (70, 3, 3, N'Do you like yogurt?', N'vip')
INSERT [dbo].[course] ([id], [categoryid], [classid], [name], [status]) VALUES (71, 3, 3, N'I have a new friend', N'vip')
INSERT [dbo].[course] ([id], [categoryid], [classid], [name], [status]) VALUES (72, 1, 4, N'Ôn tập chương 1', N'on')
INSERT [dbo].[course] ([id], [categoryid], [classid], [name], [status]) VALUES (73, 1, 4, N'Số tự nhiên', N'on')
INSERT [dbo].[course] ([id], [categoryid], [classid], [name], [status]) VALUES (74, 1, 4, N'Đơn vị do lường', N'on')
INSERT [dbo].[course] ([id], [categoryid], [classid], [name], [status]) VALUES (75, 1, 4, N'Số chia hết', N'on')
INSERT [dbo].[course] ([id], [categoryid], [classid], [name], [status]) VALUES (76, 2, 4, N'Ôn tập giữa kì 1', N'on')
INSERT [dbo].[course] ([id], [categoryid], [classid], [name], [status]) VALUES (77, 2, 4, N'Ôn tập cuối kì 1', N'on')
INSERT [dbo].[course] ([id], [categoryid], [classid], [name], [status]) VALUES (78, 2, 4, N'Ôn tập giữa kì 2', N'on')
INSERT [dbo].[course] ([id], [categoryid], [classid], [name], [status]) VALUES (79, 2, 4, N'Ôn tập cuối năm', N'on')
INSERT [dbo].[course] ([id], [categoryid], [classid], [name], [status]) VALUES (80, 3, 4, N'Ôn tập giữa kì 1', N'on')
INSERT [dbo].[course] ([id], [categoryid], [classid], [name], [status]) VALUES (81, 3, 4, N'Ôn tập cuối kì 1', N'on')
INSERT [dbo].[course] ([id], [categoryid], [classid], [name], [status]) VALUES (82, 3, 4, N'Ôn tập giữa kì 2', N'on')
INSERT [dbo].[course] ([id], [categoryid], [classid], [name], [status]) VALUES (83, 3, 4, N'Ôn tập cuối năm', N'on')
SET IDENTITY_INSERT [dbo].[course] OFF
GO
SET IDENTITY_INSERT [dbo].[exam] ON 

INSERT [dbo].[exam] ([id], [userid], [point]) VALUES (1, 1, 0)
INSERT [dbo].[exam] ([id], [userid], [point]) VALUES (2, 1, 0)
INSERT [dbo].[exam] ([id], [userid], [point]) VALUES (3, 1, 5)
INSERT [dbo].[exam] ([id], [userid], [point]) VALUES (4, 1, 4)
INSERT [dbo].[exam] ([id], [userid], [point]) VALUES (5, 1, 0)
INSERT [dbo].[exam] ([id], [userid], [point]) VALUES (6, 1, 0)
INSERT [dbo].[exam] ([id], [userid], [point]) VALUES (7, 1, 1)
INSERT [dbo].[exam] ([id], [userid], [point]) VALUES (8, 1, 3)
INSERT [dbo].[exam] ([id], [userid], [point]) VALUES (9, 1, 1)
INSERT [dbo].[exam] ([id], [userid], [point]) VALUES (10, 1, 0)
INSERT [dbo].[exam] ([id], [userid], [point]) VALUES (11, 1, 0)
INSERT [dbo].[exam] ([id], [userid], [point]) VALUES (12, 1, 0)
INSERT [dbo].[exam] ([id], [userid], [point]) VALUES (13, 1, 0)
INSERT [dbo].[exam] ([id], [userid], [point]) VALUES (14, 1, 2)
INSERT [dbo].[exam] ([id], [userid], [point]) VALUES (15, 1, 5)
INSERT [dbo].[exam] ([id], [userid], [point]) VALUES (16, 1, 1)
INSERT [dbo].[exam] ([id], [userid], [point]) VALUES (17, 1, 0)
INSERT [dbo].[exam] ([id], [userid], [point]) VALUES (18, 1, 0)
INSERT [dbo].[exam] ([id], [userid], [point]) VALUES (19, 1, 0)
INSERT [dbo].[exam] ([id], [userid], [point]) VALUES (20, 1, 0)
INSERT [dbo].[exam] ([id], [userid], [point]) VALUES (21, 1, 0)
INSERT [dbo].[exam] ([id], [userid], [point]) VALUES (22, 1, 0)
INSERT [dbo].[exam] ([id], [userid], [point]) VALUES (23, 1, 6)
INSERT [dbo].[exam] ([id], [userid], [point]) VALUES (24, 1, 0)
INSERT [dbo].[exam] ([id], [userid], [point]) VALUES (25, 1, 0)
INSERT [dbo].[exam] ([id], [userid], [point]) VALUES (26, 1, 1)
INSERT [dbo].[exam] ([id], [userid], [point]) VALUES (27, 1, 0)
INSERT [dbo].[exam] ([id], [userid], [point]) VALUES (28, 1, 1)
INSERT [dbo].[exam] ([id], [userid], [point]) VALUES (29, 1, 2)
INSERT [dbo].[exam] ([id], [userid], [point]) VALUES (30, 1, 5)
INSERT [dbo].[exam] ([id], [userid], [point]) VALUES (31, 1, 7)
INSERT [dbo].[exam] ([id], [userid], [point]) VALUES (32, 1, 6)
INSERT [dbo].[exam] ([id], [userid], [point]) VALUES (33, 1, 7)
INSERT [dbo].[exam] ([id], [userid], [point]) VALUES (34, 1, 1)
INSERT [dbo].[exam] ([id], [userid], [point]) VALUES (35, 1, 0)
INSERT [dbo].[exam] ([id], [userid], [point]) VALUES (36, 1, 0)
INSERT [dbo].[exam] ([id], [userid], [point]) VALUES (37, 1, 0)
INSERT [dbo].[exam] ([id], [userid], [point]) VALUES (38, 1, 0)
INSERT [dbo].[exam] ([id], [userid], [point]) VALUES (39, 1, 1)
INSERT [dbo].[exam] ([id], [userid], [point]) VALUES (40, 1, 0)
INSERT [dbo].[exam] ([id], [userid], [point]) VALUES (41, 1, 1)
INSERT [dbo].[exam] ([id], [userid], [point]) VALUES (42, 1, 2)
INSERT [dbo].[exam] ([id], [userid], [point]) VALUES (43, 1, 5)
INSERT [dbo].[exam] ([id], [userid], [point]) VALUES (44, 1, 0)
INSERT [dbo].[exam] ([id], [userid], [point]) VALUES (45, 1, 1)
INSERT [dbo].[exam] ([id], [userid], [point]) VALUES (46, 1, 4)
INSERT [dbo].[exam] ([id], [userid], [point]) VALUES (47, 1, 5)
INSERT [dbo].[exam] ([id], [userid], [point]) VALUES (48, 1, 2)
INSERT [dbo].[exam] ([id], [userid], [point]) VALUES (49, 1, 3)
INSERT [dbo].[exam] ([id], [userid], [point]) VALUES (50, 1, 1)
INSERT [dbo].[exam] ([id], [userid], [point]) VALUES (51, 1, 1)
INSERT [dbo].[exam] ([id], [userid], [point]) VALUES (52, 1, 6)
INSERT [dbo].[exam] ([id], [userid], [point]) VALUES (53, 1, 0)
INSERT [dbo].[exam] ([id], [userid], [point]) VALUES (54, 1, 0)
INSERT [dbo].[exam] ([id], [userid], [point]) VALUES (55, 1, 4)
INSERT [dbo].[exam] ([id], [userid], [point]) VALUES (56, 1, 4)
INSERT [dbo].[exam] ([id], [userid], [point]) VALUES (57, 1, 0)
INSERT [dbo].[exam] ([id], [userid], [point]) VALUES (58, 1, 0)
INSERT [dbo].[exam] ([id], [userid], [point]) VALUES (59, 1, 0)
INSERT [dbo].[exam] ([id], [userid], [point]) VALUES (60, 1, 0)
INSERT [dbo].[exam] ([id], [userid], [point]) VALUES (61, 1, 0)
INSERT [dbo].[exam] ([id], [userid], [point]) VALUES (62, 1, 0)
INSERT [dbo].[exam] ([id], [userid], [point]) VALUES (63, 1, 1)
INSERT [dbo].[exam] ([id], [userid], [point]) VALUES (64, 11, 0)
INSERT [dbo].[exam] ([id], [userid], [point]) VALUES (65, 11, 0)
INSERT [dbo].[exam] ([id], [userid], [point]) VALUES (66, 11, 3)
INSERT [dbo].[exam] ([id], [userid], [point]) VALUES (67, 1, 6)
INSERT [dbo].[exam] ([id], [userid], [point]) VALUES (68, 11, 1)
INSERT [dbo].[exam] ([id], [userid], [point]) VALUES (69, 11, 5)
INSERT [dbo].[exam] ([id], [userid], [point]) VALUES (70, 11, 3)
INSERT [dbo].[exam] ([id], [userid], [point]) VALUES (71, 11, 0)
INSERT [dbo].[exam] ([id], [userid], [point]) VALUES (72, 11, 0)
INSERT [dbo].[exam] ([id], [userid], [point]) VALUES (73, 11, 1)
INSERT [dbo].[exam] ([id], [userid], [point]) VALUES (74, 11, 5)
INSERT [dbo].[exam] ([id], [userid], [point]) VALUES (75, 11, 3)
INSERT [dbo].[exam] ([id], [userid], [point]) VALUES (76, 11, 5)
SET IDENTITY_INSERT [dbo].[exam] OFF
GO
SET IDENTITY_INSERT [dbo].[purchaseVIP] ON 

INSERT [dbo].[purchaseVIP] ([id], [userid], [vipid], [timepurchase]) VALUES (1, 1, 2, CAST(N'2023-05-23' AS Date))
INSERT [dbo].[purchaseVIP] ([id], [userid], [vipid], [timepurchase]) VALUES (18, 11, 5, CAST(N'2023-05-29' AS Date))
SET IDENTITY_INSERT [dbo].[purchaseVIP] OFF
GO
SET IDENTITY_INSERT [dbo].[question] ON 

INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (207, N'Trong các số sau, số nào là số thập phân?', N'TTất cả các đáp án đều đúng', N'F0,6/F0,978/F35,7', 6, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (208, N'Chuyển phân số 7|100 thành thập phân?', N'T0,07', N'F0,7/F0,007/F0,0007', 6, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (209, N'Phần nguyên của số thập phân 14,58?', N'T14', N'F58/F45/F18', 6, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (210, N'Điền số thích hợp vào ô trống:35cm =_m?', N'T0,35m', N'F0,035m/F3,05m/F0,0035m', 6, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (211, N'Số thập phân 0,06 đọc là?', N'TKhông phẩy không sáu', N'FKhông phẩy sáu/FKhông phẩy không không sáu/FKhông phẩy không', 6, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (212, N'Số thập phân 136,269 đọc là: Một trăm ba mươi sáu phẩy hai sáu chín. Đúng hay sai?', N'TSai', N'FĐúng', 6, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (213, N'Số Bảy trăm linh năm phẩy một trăm trăm ba mươi hai được viết là?', N'T705,132', N'F705,123/F705,213/F705,321', 6, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (214, N'Số thập phân nào dưới đây được viết dưới dạng gọn nhất?', N'T90,1', N'F9,010/F90,10/F900,100', 6, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (215, N'Trong một tam giác có ?', N'TTất Cả đều đúng', N'F3 cạnh/F3 góc/F3 đỉnh', 7, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (216, N'Điền số thích hợp vào ô trống:Diện tích hình tam giác có độ dài đáy là 25cm và chiều cao là 16cm là ?', N'T200cm2', N'F100cm2/F120cm2/F150cm2', 7, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (217, N'Tính diện tích hình tam giác có độ dài đáy là 5m và chiều cao là 27dm ?', N'T675dm2', N'F67,5dm2/F68,5dm2/F66,5dm2', 7, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (218, N'Một hình tam giác có diện tích là 8m2 và độ dài cạnh đáy là 32dm,Vậy chiều cao tương ứng với cạnh đáy là ?', N'T50dm', N'F60dm/F20dm/F80dm', 7, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (219, N'Cho tam giác ABC có BC = 67dm. Nếu kéo dài đoạn BC thêm một đoạn CD = 15dm thì diện tích tam giác tăng thêm 255dm2. Tính diện tích tam giác ABC ?', N'T1139dm2', N'F568,5dm2/F1394dm2/F2278dm2', 7, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (220, N'Tính chu vi hình tròn có đường kình là d=0,6cm ?', N'T1,884 cm', N'F1,994 cm/F2,884 cm/F3,884 cm', 8, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (221, N'Tính chu vi hình tròn có bán kính r=2,75cm ?', N'T17,24 cm', N'F18,27cm/F19,27cm/F20,27cm', 8, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (222, N'Một bánh xe ô tô có đường kính là 0,75m. Tính chu vi của bánh xe đó ?', N'T2,355 m', N'F2,455 m/F2,555 m/F2,655 m', 8, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (223, N'Tính diện tích hình tròn có bán kính r=5 cm ?', N'T78,5 cm2', N'F79,5 cm2/F77,5 cm2/F76,5 cm2', 8, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (224, N'Tính diện tích hình tròn có đường kính d=12 cm ?', N'T113,04 cm2', N'F114,04 cm2/F115,04 cm2/F116,04 cm2', 8, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (225, N'Tìm diện tích một mặt bàn hình tròn có bán kính 45cm ?', N'T63,585 dm2', N'F64,585dm2/F65,585dm2/F66,585dm2', 8, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (226, N'Tính diện tích xung quanh và diện tích toàn phần của hình hộp chữ nhật có chiều dài 5dm, chiều rộng 4dm ?', N'T94 dm2', N'F95 dm2/F96 dm2/F97 dm2', 9, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (227, N'Tính diện tích toàn phần của hình hộp chữ nhật có: Chiều dài 25dm, chiều rộng 1,5m và chiều cao 18dm ?', N'T2190 dm2', N'F2290 dm2/F2390 dm2/F2490 dm2', 9, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (228, N'Tính diện tích toàn phần của hình lập phương có cạnh 1,5m ?', N'T13,5 m2', N'F12,5 m2/F11,5 m2/F10,5 m2', 9, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (229, N'Diện tích xung quanh của một hình lập phương bằng chu vi một mặt nhân với 4 ?', N'TSai', N'FĐúng', 9, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (230, N'Cho hình lập phương có cạnh là 0,5m. Diện tích xung quanh của hình lập phương đó là ?', N'T100 dm2', N'F200 dm2/F300 dm2/F400 dm2', 9, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (231, N'Một hình lập phương có chu vi đáy là 28dm. Diện tích toàn phần của hình lập phương đó là ?', N'T294 dm2', N'F295 dm2/F296 dm22/F297 dm2', 9, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (232, N'My Linh is staying with his _ _ cle on a farm. It is very large', N'Tun', N'Fum/Fon/Fen', 10, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (233, N'We went to the rest _ _ rant with our family last week', N'Tau', N'Fua/Faa/Fen', 10, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (234, N'Tony and Huong w_ _t to Ha Noi yesterday. Ha Noi is very beautyful and attractive', N'Tem', N'Fne/Fme/Fen', 10, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (235, N'Choose the odd one out', N'Taddress', N'Fvillage/Fcity/FTower', 10, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (236, N'My parents live _ _ a small house in the countryside', N'Tin', N'Fon/Fwith/Fto', 10, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (237, N'His flat is far _ _ the city center', N'Tfrom', N'Fto/Fwith/Fof', 10, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (238, N'Did you _ _ any photographs there?', N'Ttake', N'Ftakes/Ftook/Ftaking', 11, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (239, N'What _ _ do you like? I like table tennis', N'Tsports', N'Fschool/Fbooks/Fmusic', 11, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (240, N'Duy is a good soccer player. He plays soccer _ _', N'Twell', N'Fgoodly/Fgood/F badly', 11, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (241, N'Choose the odd one out', N'TWELL', N'FOLD/FSMALL/FBIG', 11, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (242, N'How did you get to Da Nang? - We got there by pl _ _e', N'Tan', N'Fna/Fam/Fma', 11, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (243, N'Choose the odd one out', N'TWEEKEND', N'FGYM/FLIBRARY/FSCHOOL', 12, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (244, N'Choose the odd one out', N'TCAVE', N'FHOME/FBEDROOM/FFLOOR', 12, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (245, N'Nam is in the garden. He is watering some flowers and tr_ _s', N'Tee', N'Faa/Fae/Fea', 12, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (246, N'Linh thinks she will be in Paris next summer _ _liday', N'Tho', N'Fha/Fba/Fbo', 12, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (247, N'That _ _ a tiger. It is sleeping', N'Tis', N'Fare/Fis not/Fare not', 12, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (248, N'My school is _ _ Nguyen Trai Street', N'Ton', N'Fat/Fto/Fof', 12, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (249, N'Choose the odd one out', N'TSTORY', N'FKIND/FGENTLE/FCLEVER', 13, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (250, N'Choose the odd one out', N'TEVENING', N'FHELPING/FSPEAKING/FREADING', 13, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (251, N'An Tiem is very hard wor_ _ng and independent', N'Tki', N'Fdy/Fdi/Fky', 13, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (252, N'What is your father reading? He is reading n_ _s on the Internet', N'Tew', N'Fow/Fiw/Fuw', 13, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (253, N'I am _ _ a picture now', N'Tdrawing', N'Fplaying/Fwriting/Fsinging', 13, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (254, N'_ _ down, please!', N'TSit', N'FOpen/FClose/FStand', 13, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (255, N'Đọc bài văn Buổi sớm trên cánh đồng và cho biết tác giả đã quan sát sự vật bằng những giác quan nào', N'TXúc giác/TThị giác', N'FThính giác/FKhứu giác', 14, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (256, N'Bài văn tả cảnh thường gồm có mấy phần?', N'TMở bài/TThân bài/TKết bài', N'FMở bài-Thân bài', 14, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (257, N'Màu sắc nào không xuất hiện trong bài văn “Quang cảnh làng mạc ngày mùa”?', N'TVàng óng', N'FVàng mượt/FVàng xuộm/FVàng xọng', 14, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (258, N'Chi tiết nào về thời tiết làm cho bức tranh làng quê thêm đẹp và sinh động?', N'THơi thở của đất trời, mặt nước thơm thơm, nhè nhẹ/TNgày không nắng, không mưa', N'FKhông có cảm giác héo tàn hanh hao lúc sắp bước vào mùa đông', 14, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (259, N'Những sự vật nào không xuất hiện trong bài “Quang cảnh làng mạc ngày mùa”?', N'TCánh diều bay liệng trên bầu trời/TĐàn bò gặm cỏ', N'FBụi mía/FMái nhà phủ rơm', 14, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (260, N'Từ nào sau đây có nghĩa chỉ “Màu vàng gợi sự giàu có, ấm no”? ', N'TVàng trù phú, đầm ấm', N'FVàng mới/FVàng mượt/FVàng giòn', 14, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (261, N'Kể tên các nhân vật xuất hiện trong truyện  “Lý Tự Trọng”?', N'TLý Tự Trọng, mật thám, luật sư/TTên đội tây, đồng chí cách mạng', N'FBố Lý Tự Trọng, Lý Tự Trọng, luật sư, mật thám/FBố mẹ Lý Tự Trọng, Lý Tự Trọng, cán bộ cách mạng', 14, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (262, N'Vì sao Lý Tự Trọng được cử đi nước ngoài học?', N'TVì anh thông minh, sáng dạ lại sớm giác ngộ Cách mạng', N'FVì anh thông minh, sáng dạ/FVì gia đình anh giàu có nên có đủ điều kiện theo học', 14, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (263, N'Trước khi bị xử bắn Lý Tự Trọng đã hát bài hát gì?', N'TQuốc tế ca', N'FTiến quân ca/FĐoàn ca/FĐội ca', 14, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (264, N'Trước toàn án, Lý Tự Trọng đã có hành động gì?', N'TDõng dạc vạch mặt bọn đế quốc và tuyên truyền cách mạng', N'FSợ hãi xin tha mạng/FYêu cầu được gặp mặt gia đình lần cuối', 14, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (265, N'Tìm những từ trái nghĩa trong câu tục ngữ Chết vinh còn hơn sống nhục', N'Tchết – sống/Tvinh – nhục', N'Fchết – nhục', 15, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (266, N'Tìm từ trái nghĩa với từ hòa bình?', N'TCả A và C', N'FChiến tranh/FBình yên/FXung đột', 15, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (267, N'Tìm từ trái nghĩa với từ thương yêu?', N'TThù ghét/TCăm giận', N'FLo lắng', 15, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (268, N'Tìm những từ trái nghĩa với nhau về phẩm chất?', N'TThông minh - ngu dốt/THào phóng - keo kiệt', N'FĐứng - ngồi/FNgẩng mặt - cúi đầu', 15, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (269, N'Câu nào dưới đây nêu đúng nghĩa của từ hòa bình?', N'TTrạng thái không có chiến tranh', N'FTrạng thái bình thản/FTrạng thái hiền hòa, yên ả', 15, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (270, N'Câu kiến bò đĩa thịt bò đã sử dụng từ đồng âm bò trong kiến bò là chỉ một hoạt động với bò trong thịt bò là chỉ một món ăn', N'TĐúng', N'FSai', 15, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (271, N'Nên chọn thứ tự miêu tả như thế nào khi miêu tả ngôi trường?', N'TTả xuôi/TTả ngược', N'FNhớ ra chi tiết nào thì nên tả chi tiết đó luôn vì để lâu sẽ quên', 15, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (272, N'Khi làm bài văn miêu tả ngôi trường cần chú trọng vào điều gì?', N'TTả quang cảnh của ngôi trường', N'FTả hoạt động của giáo viên trong trường/FTả hoạt động của học sinh trong trường', 15, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (273, N'Từ nào sau đây ghép với đường thì mang nghĩa chuyển?', N'Tkính/Tdây', N'Fphèn', 16, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (274, N'Tiếng nào dưới đây ghép với đánh được từ mang nghĩa gốc?', N'Tnhau', N'Ftrống/Fđàn/Fcờ', 16, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (275, N'Dòng nào dưới đây giải thích đúng nghĩa của từ thiên nhiên', N'TTất cả những gì không do con người tạo ra', N'FTất cả những gì do con người tạo ra/FTất cả những thứ tồn tại xung quanh con người', 16, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (276, N'Từ nào trong các từ sau đây được dùng để miêu tả tiếng mưa rơi', N'Ttí tách', N'Fvi vu/Fcốc cốc/Fróc rách', 16, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (277, N'Từ nào sau đây có thể miêu tả một cơn mưa', N'TTấtCả đều đúng', N'Ftầm tã/Frả rích/Flộp độp', 16, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (278, N'Từ róc rách mô tả âm thanh của sự vật nào?', N'TTiếng suối chảy', N'FTiếng gió thổi/FTiếng sóng vỗ mạn thuyền/FTiếng mưa rơi', 16, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (279, N'Từ nào sau đây có thể miêu tả một cơn mưa', N'TNgười trưởng tràng', N'FCon trai Nguyễn Bá Tĩnh/FMột học trò nữ của Nguyễn Bá Tĩnh', 16, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (280, N'Tiếng nào sau đây thêm dấu hỏi thì được tiếng có nghĩa?', N'T Tất cả đều đúng', N'FNơ/FHoa/FQua', 17, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (281, N'Trong các câu sau câu nào viết đúng chính tả?', N'THỏi han', N'FChào họi/FRỏ ràng/FCỡi mở', 17, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (282, N'Trong các câu sau câu nào mắc lỗi chính tả', N'TChả lại', N'FTrao đổi/FTrồng cây/FTra lúa', 17, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (283, N'Danh từ riêng nào được viết đúng theo quy tắc viết hoa tên riêng?', N'THà Nội', N'FVích-To-Huy-Go/FBắc kinh', 17, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (284, N'Người có lòng thương người, hay làm điều tốt cho người khác thì gọi là gì?', N'TPhúc hậu', N'FPhúc tinh/FPhúc trạch/FPhúc lộc', 17, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (285, N'Trạng thái nào sau đây được coi là hạnh phúc?', N'TCả 2 ý trên', N'FMãn nguyện/FSung sướng', 17, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (286, N'Yếu tố nào sau đây tác động đến hạnh phúc của một người?', N'TCả 3 ý trên', N'FBạn bè/FGia đình/FCông việc', 17, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (287, N'Điền dấu > < = vào chỗ trống. Cho 6...9', N'T<', N'F>/F=', 18, N'off')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (288, N'Điền dấu > < = vào chỗ trống. Cho 9...9', N'T=', N'F>/F<', 18, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (289, N'Điền dấu > < = vào chỗ trống. Cho 9...7', N'T>', N'F</F=', 18, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (290, N'7 lớn hơn 8. Đúng hay sai?', N'TSai', N'FĐúng', 18, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (291, N'Số nào sau đây bé hơn 5?', N'T2', N'F6/F8/F7', 18, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (292, N'Điền số còn thiếu vào dãy sau. [1; 2;...;4; 5]', N'T3', N'F6/F7/F8', 19, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (293, N'Điền số còn thiếu vào dãy sau. [2; 3; 4;...;6; 7]', N'T5', N'F4/F7/F1', 19, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (294, N'Số liền sau số 7 là số nào?', N'T8', N'F5/F6/F9', 19, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (295, N'Số liền trước số 5 là số nào?', N'T4', N'F5/F7/F8', 19, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (296, N'Số liền sau số 2 là số nào?', N'T3', N'F1/F4/F5', 19, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (297, N'Hình vuông có bao nhiêu góc vuông?', N'T4', N'F1/F2/F3', 20, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (298, N'Hình tròn có bao nhiêu góc vuông?', N'T0', N'F2/F3/F4', 20, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (299, N'Hình vuông có bao nhiêu cạnh?', N'T4', N'F2/F1/F3', 20, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (300, N'Hình tròn có bao nhiêu cạnh?', N'T0', N'F1/F2/F3', 20, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (301, N'Hình vuông là hình chữ nhật. Đúng hay sai?', N'TĐúng', N'FSai', 20, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (302, N'Hình tam giác có bao nhiêu cạnh', N'T3', N'F1/F2/F4', 21, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (303, N'Hình tam giác có thể có tối đa bao nhiêu góc vuông?', N'T1', N'F0/F2/F3', 21, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (304, N'1 + 1 bằng bao nhiêu?', N'T2', N'F1/F3/F0', 22, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (305, N'2 + 3 bằng bao nhiêu?', N'T5', N'F4/F6/F7', 22, N'on')
GO
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (306, N'1 + 4 bằng bao nhiêu?', N'T5', N'F3/F4/F6', 22, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (307, N'0 + 5 bằng bao nhiêu?', N'T5', N'F0/F4/F6', 22, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (308, N'1 + 7 bằng bao nhiêu?', N'T8', N'F7/F6/F9', 22, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (309, N'Bạn Lan có 2 viên kẹo, bạn Tuấn có 5 viên kẹo. Hỏi bạn nào có nhiều kẹo hơn?', N'TTuấn', N'FLan', 23, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (310, N'Bạn Lan có 2 cái bánh, bạn Tuấn có 1 cái bánh. Hỏi bạn nào có nhiều bánh hơn?', N'TLan', N'FTuấn', 23, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (311, N'Bạn Hòa được mẹ cho 4 cây bút chì, bạn Giang được mẹ cho 3 cây bút chì. Hỏi bạn nào có nhiều bút chì hơn?', N'THòa', N'FGiang', 23, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (312, N'Bạn Hoa có 1 cây kẹo, mẹ cho Hoa thêm 4 cây kẹo nữa. Bạn Khoa có 5 cây kẹo. Hỏi bạn nào có nhiều kẹo hơn?', N'TCả hai có số kẹo bằng nhau.', N'FHoa/FKhoa', 23, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (313, N'Điền àn hay àng vào chỗ trống? Lau b__', N'Tàn', N'Fàng', 24, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (314, N'Điền àn hay àng vào chỗ trống? Bán h___', N'Tàng', N'Fàn', 24, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (315, N'Điền àn hay àng vào chỗ trống? An nh__', N'Tàn', N'Fàng', 24, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (316, N'Điền ãn hay ãng vào chỗ trống? Hái nh__', N'Tãn', N'Fãng', 24, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (317, N'Điền ản hay ảng vào chỗ trống? Xóa b___', N'Tảng', N'Fản', 24, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (318, N'Điền ng hay ngh vào chỗ trống? Nguệch __oạc', N'Tng', N'Fngh', 25, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (319, N'Điền ng hay ngh vào chỗ trống? __ay ngắn', N'Tng', N'Fngh', 25, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (320, N'Điền ng hay ngh vào chỗ trống? ___iêng ngả', N'Tngh', N'Fng', 25, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (321, N'Điền ng hay ngh vào chỗ trống? Ngộ ___ĩnh', N'Tngh', N'Fng', 25, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (322, N'Điền ng hay ngh vào chỗ trống? __ây thơ', N'Tng', N'Fngh', 25, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (323, N'Điền ui hay uôi vào chỗ trống? Cái đ___', N'Tuôi', N'Fui', 26, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (324, N'Điền ũi hay uỗi vào chỗ trống? Cái c__', N'Tũi', N'Fuỗi', 26, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (325, N'Điền ũi hay uỗi vào chỗ trống? Vợt m___', N'Tuỗi', N'Fũi', 26, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (326, N'Điền ủi hay uổi vào chỗ trống? 10 T___', N'Tuổi', N'Fủi', 26, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (327, N'Điền ủi hay uổi vào chỗ trống? Bàn __', N'Tủi', N'Fuổi', 26, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (328, N'Điền l hay n vào chỗ trống? _ặn đất sét', N'Tn', N'Fl', 27, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (329, N'Điền l hay n vào chỗ trống? Chơi _ắp ráp', N'Tl', N'Fn', 27, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (330, N'Điền l hay n vào chỗ trống? _ao xao', N'Tl', N'Fn', 27, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (331, N'Điền l hay n vào chỗ trống? _ắm tay', N'Tn', N'Fl', 27, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (332, N'Điền l hay n vào chỗ trống? _óng _ực', N'Tn', N'Fl', 27, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (333, N'Điền vào chỗ trống? Cầu l___', N'Tông', N'Fồng/Fống/Fộng', 28, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (334, N'Điền vào chỗ trống? Bóng đ_', N'Tá', N'Fa/Fà/Fạ', 28, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (335, N'Điền vào chỗ trống? Nh__ dây', N'Tảy', N'Fay/Fáy/Fày', 28, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (336, N'Điền vào chỗ trống? Tr__ tìm', N'Tốn', N'Fồn/Fôn/Fộn', 28, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (337, N'Điền d hay gi vào chỗ trống? con __án', N'Tgi', N'Fd', 29, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (338, N'Điền d hay gi vào chỗ trống? keo _án', N'Td', N'Fgi', 29, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (339, N'Điền d hay gi vào chỗ trống? cặp _a', N'Td', N'Fgi', 29, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (340, N'Điền c hay k vào chỗ trống? cái _éo', N'Tk', N'Fc', 29, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (341, N'Điền c hay k vào chỗ trống? _ọ vẽ', N'Tc', N'Fk', 29, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (342, N'Book là gì?', N'Tsách', N'Fbút chì/Fcặp sách/Fthước kẻ', 30, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (343, N'Đâu là từ chỉ "quả bóng"?', N'TBall', N'FBook/FBike/FBill', 30, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (344, N'Đâu là từ chỉ "hóa đơn"?', N'TBill', N'FBook/FBike/FBall', 30, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (345, N'"Chào buổi sáng" là gì?', N'TGood morning', N'FGood afternoon/FGood night/FHello', 30, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (346, N'"Xin chào" là gì?', N'THello', N'FGood afternoon/FGood night/FGood morning', 30, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (347, N'Cat là gì?', N'Tcon mèo', N'Fcon chó/Fcon hổ/Fcon heo', 31, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (348, N'Đâu là từ chỉ "xe ô tô"?', N'TCar', N'FCake/FCup/FCat', 31, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (349, N'Đâu là từ chỉ "chén"?', N'TCup', N'FCake/FCar/FCat', 31, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (350, N'"Tôi có một cái chén" là gì?', N'TI have a cup', N'FI have a car/FI have a cat/FI have a cake', 31, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (351, N'Hat là gì?', N'Tcái mũ', N'Fcái bàn/Fáo/Fquần', 32, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (352, N'Đâu là từ chỉ "quả táo"?', N'TApple', N'FBag/FCan/FHat', 32, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (353, N'Đâu là từ chỉ "cái cặp"?', N'TBag', N'FApple/FCan/FHat', 32, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (354, N'"Đây là cái lon của tôi" là gì?', N'TThis is my can', N'FThis is my apple/FThis is my hat/FThis is my bag', 32, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (355, N'Door là gì?', N'TCửa ra vào', N'FCái bàn/FCửa sổ/FCái đèn', 33, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (356, N'Đâu là từ chỉ "bàn học"?', N'TDesk', N'FTable/FWindown/FDoor', 33, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (357, N'Đâu là từ chỉ "con chó"?', N'TDog', N'FDoor/FDuck/FDesk', 33, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (358, N'"Đây là một quyển sách" là gì?', N'TThis is a book', N'FThis is a dog/FThis is a duck/FThis is a door', 33, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (359, N'Fish là gì?', N'TCon cá', N'FCon chó/FCon mèo/FCon heo', 34, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (360, N'Đâu là từ chỉ "sữa"?', N'TMilk', N'FTable/FWindown/FDoor', 34, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (361, N'Đâu là từ chỉ "con gà"?', N'TChicken', N'FDog/FDuck/FCat', 34, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (362, N'"Tôi thích khoai tây chiên" là gì?', N'TI like chips', N'FI like milk/FI like cat/FI like dog', 34, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (363, N'Pen là gì?', N'TCây bút mực', N'FCây bút chì/FThước kẻ/FCục tẩy', 35, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (364, N'Đâu là từ chỉ "cái chuông"?', N'TBell', N'FBall/FWindown/FDoor', 35, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (365, N'Đâu là từ chỉ "cây bút chì"?', N'TPencil', N'FPen/FDuck/FBell', 35, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (366, N'"Đó là cái bút mực màu đỏ" là gì?', N'TIt’s a red pen', N'FIt’s a black pen/FIt’s a white pen/FIt’s a red hat', 35, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (367, N'1 dm bằng bao nhiêu cm?', N'T10', N'F100/F1/F0', 36, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (368, N'20 cm bằng bao nhiêu dm?', N'T2', N'F4/F6/F7', 36, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (369, N'1 dm bằng bao nhiêu mm?', N'T100', N'F1000/F10/F20', 36, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (370, N'2 dm bằng bao nhiêu cm?', N'T20', N'F10/F40/F100', 36, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (371, N'100 cm bằng bao nhiêu dm?', N'T10', N'F100/F1/F0', 36, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (372, N'Cho 2 + 10 = 12. Hỏi số nào là tổng?', N'T12', N'F2/F10', 37, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (373, N'Cho 3 + 5 = 8. Hỏi số nào là số hạng?', N'T3 và 5', N'F8', 37, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (374, N'Cho _+14 = 18. Tìm số hạng chưa biết?', N'T4', N'F13/F10/F12', 37, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (375, N'Cho 11+_ = 20. Tìm số hạng chưa biết?', N'T9', N'F10/F11/F12', 37, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (376, N'Cho 12+13 =_. Tìm tổng chưa biết?', N'T25', N'F15/F24/F20', 37, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (377, N'Cho 22 - 10 = 12. Hỏi số nào là hiệu?', N'T12', N'F22/F10', 38, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (378, N'Cho 13 - 5 = 8. Hỏi số nào là số trừ?', N'T5', N'F8/F13', 38, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (379, N'Cho _-14 = 4. Tìm số bị trừ chưa biết?', N'T18', N'F17/F16/F19', 38, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (380, N'Cho 21-_ = 20. Tìm số trừ chưa biết?', N'T1', N'F2/F3/F4', 38, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (381, N'Cho 15-5 =_. Tìm hiệu chưa biết?', N'T10', N'F11/F12/F13', 38, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (382, N'Cho 15+12 =_. Tìm tổng chưa biết?', N'T27', N'F25/F24/F26', 39, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (383, N'Cho 10+7 =_. Tìm tổng chưa biết?', N'T17', N'F15/F14/F16', 39, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (384, N'Cho 5+14 =_. Tìm tổng chưa biết?', N'T19', N'F20/F18/F17', 39, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (385, N'Cho 11+13 =_. Tìm tổng chưa biết?', N'T24', N'F25/F23/F20', 39, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (386, N'Cho 12+13 =_. Tìm tổng chưa biết?', N'T25', N'F26/F24/F20', 39, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (387, N'Cho 15+13 =_. Tìm tổng chưa biết?', N'T28', N'F25/F24/F26', 40, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (388, N'Cho 10+8 =_. Tìm tổng chưa biết?', N'T18', N'F15/F14/F16', 40, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (389, N'Cho 5+12 =_. Tìm tổng chưa biết?', N'T17', N'F20/F18/F19', 40, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (390, N'Cho 11+10 =_. Tìm tổng chưa biết?', N'T21', N'F25/F23/F20', 40, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (391, N'Cho 12+16 =_. Tìm tổng chưa biết?', N'T28', N'F26/F24/F27', 40, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (392, N'Cho 15-12 =_. Tìm hiệu chưa biết?', N'T3', N'F5/F4/F6', 41, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (393, N'Cho 10-6 =_. Tìm hiệu chưa biết?', N'T4', N'F5/F3/F6', 41, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (394, N'Cho 15-4 =_. Tìm hiệu chưa biết?', N'T11', N'F12/F13/F10', 41, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (395, N'Cho 23-13 =_. Tìm hiệu chưa biết?', N'T10', N'F11/F9/F12', 41, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (396, N'Cho 25-21 =_. Tìm hiệu chưa biết?', N'T4', N'F6/F3/F5', 41, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (397, N'Bạn nhỏ đã hỏi bố điều gì? ', N'TBạn nhỏ đã hỏi bố ngày hôm qua đâu rồi', N'FBạn nhỏ đã hỏi bố ngày mai ăn sáng món gì', 43, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (398, N'Theo lời bố, ngày hôm qua ở những đâu?', N'TTất cả đều đúng', N'FTrong hạt lúa mẹ trồng/FTrên cành hoa trong vườn/FNụ hồng lớn thêm mãi/FTrong vở hồng của em', 43, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (399, N'Trong khổ thơ cuối, bố đã dặn bạn nhỏ làm gì để “ngày hôm qua vẫn còn” ?', N'THọc hành chăm chỉ', N'FChăm chỉ làm việc nhà', 43, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (400, N'Nếu có bảy hũ vàng, Bi sẽ làm gì?', N'Tmua một con ngựa hồng và một cái ô tô', N'Fmua búp bê và quần áo đẹp', 44, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (401, N'Nếu có bảy hũ vàng, Bống sẽ làm gì?', N'Tmua búp bê và quần áo đẹp', N'Fmua một con ngựa hồng và một cái ô tô', 44, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (402, N'Trong giờ học, thầy giáo yêu cầu cả lớp làm gì? ', N'Ttập nói trước lớp về bất cứ điều gì mình thích', N'Ftập nói trước lớp về bất cứ điều gì mình không thích', 45, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (403, N'Vì sao lúc đầu Quang lúng túng? ', N'Tvì bạn thấy đứng trước lớp khó nói quá', N'Fvì bạn đang đau bụng', 45, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (404, N'Nghe tiếng động lạ, cây xấu hổ đã làm gì? ', N'Tco rúm mình lại', N'Fchui xuống đất/Fnở hoa', 46, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (405, N'Cây xấu hổ nuối tiếc điều gì? ', N'Tđã không nhìn thấy con chim xanh rất đẹp', N'Fvì đã không thể nở hoa', 46, N'on')
GO
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (406, N'Cô giáo đáp lời chào của học sinh như thế nào?', N'Tmỉm cười thật tươi', N'Fbuồn bã/Fnghiêm nghị', 47, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (407, N'Qua bài thơ em thấy tình cảm bạn nhỏ dành cho cô giáo thế nào?', N'Tyêu quý, yêu thương', N'Fthờ ơ, không quan tâm', 47, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (408, N'Pasta là gì?', N'Tmì ống', N'Fbỏng ngô/Fcặp sách/Fthước kẻ', 48, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (409, N'Đâu là từ chỉ "bỏng ngô"?', N'TPopcorn', N'FBook/FPasta/FBill', 48, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (410, N'"Tôi thích mì sợi" là gì?', N'TI like pasta', N'FI like pizza/FI like cat/FI like milk', 48, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (411, N'"Bỏng ngô thì ngon" là gì?', N'TThe popcorn is yummy', N'FThe pizza is yummy/FThe milk is yummy/FThe pasta is yummy', 48, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (412, N'Kite là gì?', N'Tcái diều', N'Fbỏng ngô/Fcặp sách/Fxe đạp', 49, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (413, N'Đâu là từ chỉ "con mèo con"?', N'TKitten', N'FBike/FCat/FBill', 49, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (414, N'Điền từ vào chỗ trống. Is he ___ a kite?', N'TFlying', N'FFly', 49, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (415, N'Điền từ vào chỗ trống. Is he ___ a kitten?', N'TPlaying', N'FPlay', 49, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (416, N'Sand là gì?', N'Tcát', N'Fbiển/Fcánh buồm/Fxe đạp', 50, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (417, N'Sea là gì?', N'Tbiển', N'Fcát/Fcánh buồm/Fxe đạp', 50, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (418, N'Đâu là từ chỉ "cánh buồm"?', N'TSail', N'FSea/FCat/FBill', 50, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (419, N'"Tôi có thể thấy cát" là gì?', N'TI can see the sand', N'FI can see the sea/FI can see the cat', 50, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (420, N'"Hãy nhìn biển kìa!" là gì?', N'TLet’s look at the sea', N'FLet’s look at the dog/FLet’s look at the sand/FLet’s look at the hat', 50, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (421, N'River là gì?', N'Tdòng sông', N'Fbiển/Fcánh buồm/Fxe đạp', 51, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (422, N'Rainbow là gì?', N'Tcầu vồng', N'Fcát/Fbiển/Fxe đạp', 51, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (423, N'Đâu là từ chỉ "con đường"?', N'TRoad', N'FSea/FCat/FBill', 51, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (424, N'"Có một con sông" là gì?', N'TThere’s a river', N'FThere’s a hat/FThere’s a road', 51, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (425, N'"Mình có thể thấy cầu vồng" là gì?', N'TI can see the rainbow', N'FI can see the road/FI can see the sea/FI can see the river', 51, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (426, N'Box là gì?', N'Tcái hộp', N'Fcâu hỏi/Fcánh buồm/Fxe đạp', 53, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (427, N'Ox là gì?', N'Tcon bò', N'Fhình chữ nhật/Fhình tròn/Fxe đạp', 53, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (428, N'Đâu là từ chỉ "con cáo"?', N'TFox', N'FDog/FCat/FBill', 53, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (429, N'"Tôi có thể thấy một con cáo" là gì?', N'TI can see a fox', N'FI can see a dog/FI can see a cat/FI can see a ox', 53, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (430, N'1 m bằng bao nhiêu dm?', N'T10', N'F100/F1/F0', 54, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (431, N'20 dm bằng bao nhiêu m?', N'T2', N'F4/F6/F7', 54, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (432, N'1 m bằng bao nhiêu cm?', N'T100', N'F1000/F10/F20', 54, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (433, N'2 m bằng bao nhiêu dm?', N'T20', N'F10/F40/F100', 54, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (434, N'1000 cm bằng bao nhiêu m?', N'T10', N'F100/F1/F0', 54, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (435, N'8 h kém 15 là bằng bao nhiêu?', N'T7 h 45', N'F7 h 50/F7 h 40/F7 h 55', 55, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (436, N'8 h kém 30 là bằng bao nhiêu?', N'T7 h 30', N'F7 h 50/F7 h 40/F7 h 55', 55, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (437, N'7 h kém 20 là bằng bao nhiêu?', N'T6 h 40', N'F6 h 50/F6 h 45/F6 h 55', 55, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (438, N'Mai có 2 cây bút chì, em được mẹ mua cho 1 cây bút chì. Ngày hôm sau em làm mất 1 cây, hỏi Mai còn bao nhiêu cây bút chì', N'T2', N'F1/F3/F4', 56, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (439, N'Tuân có 2 quả cam. Ba cho Tuấn 12 quả cam, mẹ cho thêm 10 quả cam. Hỏi Tuân có bao nhiêu quả cam?', N'T24', N'F25/F23/F20', 56, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (440, N'Hoa có 3 bông hoa, Hoa tặng mẹ 1 bông, tặng cô 1 bông. Hỏi Hoa còn mấy bông hoa?', N'T1', N'F2/F0', 56, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (441, N'Cho _x2 = 18. Tìm thừa số chưa biết?', N'T9', N'F8/F10/F7', 57, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (442, N'Cho _x3 = 24. Tìm thừa số chưa biết?', N'T8', N'F7/F10/F9', 57, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (443, N'Cho _x10 = 30. Tìm thừa số chưa biết?', N'T3', N'F4/F5/F2', 57, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (444, N'Cho _x4 = 44. Tìm thừa số chưa biết?', N'T11', N'F13/F10/F12', 57, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (445, N'Cho _x5 = 35. Tìm thừa số chưa biết?', N'T7', N'F8/F10/F9', 57, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (446, N'Cho 18:_ = 9. Tìm số chia chưa biết?', N'T2', N'F3/F4/F5', 58, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (447, N'Cho _:3 = 8. Tìm số bị chia chưa biết?', N'T24', N'F27/F25/F26', 58, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (448, N'Cho _:10 = 3. Tìm số bị chia chưa biết?', N'T30', N'F24/F29/F33', 58, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (449, N'Cho 44:_ = 11. Tìm số chia chưa biết?', N'T4', N'F3/F1/F2', 58, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (450, N'Cho 35:_ = 5. Tìm số chia chưa biết?', N'T7', N'F8/F10/F9', 58, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (451, N'Làm tròn số 41 đến hàng chục thì được số ?', N'T40', N'F50', 59, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (452, N'Làm tròn số 47 đến hàng chục thì được số ?', N'T50', N'F40', 59, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (453, N'Làm tròn số 62 đến hàng chục thì được số ?', N'T60', N'F70', 59, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (454, N'Khi năm học mới sắp về, hai chị em cảm thấy thế nào?', N'Tcảm thấy náo nức, vui, nhớ những người bạn thân thương', N'Fcảm thấy sợ hãi', 60, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (455, N'Hai chị em đã làm những gì để chuẩn bị cho năm học mới?', N'Tbọc sách vở, dán nhãn vở', N'Fkhông làm gì cả', 60, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (456, N'Vì sao cô giáo bảo Hà Thu đọc bài viết cho các bạn cùng nghe?', N'Tbài viết của Hà Thu vừa hay lại vừa đẹp', N'Fvì Hà Thu ngủ gật nên bị cô gọi', 61, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (457, N'Hà Thu đã viết những gì trong bài của mình?', N'TTất cả đều đúng', N'FTên/FNgày sinh/FƯớc mơ/FSở thích', 61, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (458, N'Cô giáo cho Hà Thu và các bạn trong lớp viết về điều gì?', N'Tbài tự giới thiệu về bản thân', N'Fbài văn tả cái cây em thích nhất', 61, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (459, N'Trên đường đến trường bạn nhỏ cảm thấy như thế nào?', N'Tlòng vui phơi phới', N'Flo lắng, sầu lo', 62, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (460, N'Theo em, vì sao mỗi ngày đến lớp bạn nhỏ có thêm nhiều niềm vui?', N'Tthầy cô thân yêu, bạn bè vui vẻ, quý mến', N'Fcó những giờ học thú vị với các kiến thức mới', 62, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (461, N'Những điều gì gợi cho tác giả nhớ về buổi đầu đi học?', N'Tvào cuối thu, lá ngoài đường và trên không có những đám mây hàng bạc', N'Ftrời trong xanh không một áng mây', 63, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (462, N'Bài đọc nói về điều gì?', N'TKỉ niệm đẹp đẽ của bạn nhỏ trong buổi đầu đi học', N'FCảnh đẹp của một buổi sáng cuối mùa thu/FNiềm vui của bạn nhỏ khi được mẹ dẫn đi học', 63, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (463, N'Ông Giô-dép dắt con trai đến gặp thầy giáo để làm gì?', N'Txin cho con trai đi học', N'Ftrả lại đồ thầy giáo làm rơi', 64, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (464, N'Lu-i và các bạn chơi những trò gì?', N'Tcâu cá, đá bóng, chơi bi', N'Fcâu cá, nhảy dây, chơi bi/Fcâu cá, đá bóng, nhảy dây', 64, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (465, N'Những ai tham gia ngày hội?', N'Thọc sinh và phụ huynh', N'Fchỉ có học sinh/Fchỉ có phụ huynh', 65, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (466, N'Câu lạc bộ của Trường Tiểu học Mùa Xuân tổ chức hoạt động gì trong tháng 9?', N'Thoạt động “ Ngày hội Nghệ sĩ nhí”', N'Fhoạt động “ Ngày hội Dân Gian”/Fhoạt động “ Ngày Chủ nhật xanh”', 65, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (467, N'Doll là gì?', N'Tbúp bê', N'Fcửa ra vào/Fcánh buồm/Fxe đạp', 66, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (468, N'Teddy bear là gì?', N'Tgấu bông', N'Fbúp bê/Fcánh buồm/Fxe đạp', 66, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (469, N'Đâu là từ chỉ "tàu hỏa"?', N'TTrain', N'FSea/FCat/FBill', 66, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (470, N'"Đây là cái cặp sách của tôi" là gì?', N'TThis is my bag', N'FThis is my ball/FThis is my hat', 66, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (471, N'"My favorite color is blue" là gì?', N'TMàu sắc yêu thích của tôi là màu xanh da trời', N'FMàu sắc yêu thích của tôi là màu đỏ/FMàu sắc yêu thích của tôi là màu tím', 66, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (472, N'Eraser là gì?', N'Tcục tẩy', N'Fthước kẻ/Fbút mực/Fxe đạp', 67, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (473, N'Pencil case là gì?', N'Thộp bút', N'Fbúp bê/Fcánh buồm/Fxe đạp', 67, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (474, N'Đâu là từ chỉ "dọn dẹp"?', N'TClean up', N'FEraser/FCat/FBill', 67, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (475, N'"Kia là quyển sách của anh ấy" là gì?', N'TThat is his book', N'FThat is his ball/FThat is his hat', 67, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (476, N'Mom là gì?', N'Tmẹ', N'Fbố/Fanh|em trai/Fchị gái', 68, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (477, N'Dad là gì?', N'Tbố', N'Fmẹ/Fanh|em trai/Fchị gái', 68, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (478, N'Đâu là từ chỉ "anh|em trai"?', N'Tbrother', N'Fmom/Fdad/Fsister', 68, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (479, N'Đâu là từ chỉ "dưới"?', N'Tunder', N'Fon/Fin/Fat', 68, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (480, N'"Cái nón của nó ở trong cái cặp" là gì?', N'TIts hat is in the bag', N'FIts eraser is in the bag/FIts pen is in the bag', 68, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (481, N'Elephant là gì?', N'Tcon voi', N'Fcon chó/Fcon hổ/Fcon cá', 69, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (482, N'Giraffe là gì?', N'Thươu cao cổ', N'Fcon khỉ/Fcon hổ/Fcon cá', 69, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (483, N'Đâu là từ chỉ "cao"?', N'Ttall', N'Fthin/Fbig/Flittle', 69, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (484, N'Đâu là từ chỉ "nhỏ"?', N'Tlittle', N'Fbig/Ftall/Fthin', 69, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (485, N'"The elephant is big" là gì?', N'TCon voi thì to', N'FCon voi thì nhỏ/FCon hổ thì to', 69, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (486, N'Rice là gì?', N'Tcơm', N'Fthịt/Fsữa chua/Fcà rốt', 70, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (487, N'Yogurt là gì?', N'Tsữa chua', N'Fthịt/Fcơm/Fcà rốt', 70, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (488, N'Đâu là từ chỉ "thịt"?', N'Tmeat', N'Frice/Fcarrot/Fmilk', 70, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (489, N'Đâu là từ chỉ "bánh mì"?', N'Tbread', N'Frice/Fcarrot/Fmilk', 70, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (490, N'"Do you like ice cream?" là gì?', N'TBạn có thích kem không?', N'FBạn có thích sữa chua không?/FBạn có thích thịt không?', 70, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (491, N'Short là gì?', N'Tngắn', N'Fdài/Fsữa chua/Fcà rốt', 71, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (492, N'Straight là gì?', N'Tthẳng', N'Fcong/Fcơm/Fcà rốt', 71, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (493, N'Đâu là từ chỉ "xoăn"?', N'Tcurly', N'Frice/Fcarrot/Fmilk', 71, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (494, N'Đâu là từ chỉ "màu xanh dương"?', N'Tblue', N'Fred/Fwhite/Fblack', 71, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (495, N'"Cô ấy có mái tóc màu nâu" là gì?', N'TShe has brown hair', N'FShe has blue hair/FShe has long hair', 71, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (496, N'8 tấn 8kg = ... kg.', N'T8008', N'F880/F808/F88', 72, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (497, N'Giá trị của chữ số 6 trong số 8 365 927 là:', N'T60 000', N'F6000/F600 000/F6 000 000', 72, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (498, N'Số gồm hai tỉ và năm trăm nghìn có số chữ số 0 là:', N'T8', N'F6/F7/F9', 72, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (499, N'(68 + 32) ∶4 = ...', N'T68:4+32:4', N'F68+32∶4/F68∶4+32/F68∶4-32∶4', 72, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (500, N'1 thế kỉ = 100 năm. Đúng hay sai?', N'TĐúng', N'FSai', 72, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (501, N'Hàng nào sau đây không thuộc lớp đơn vị?', N'THàng đơn vị', N'FHàng chục/FHàng trăm/FHàng nghìn', 73, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (502, N'Chọn dấu thích hợp để điền vào chỗ chấm: 56789 ... 100001', N'T<', N'F>/F=', 73, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (503, N'Chọn dấu thích hợp để điền vào chỗ chấm: 854193 ... 852963', N'T>', N'F</F=', 73, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (504, N'Số 2 chục triệu được viết là:', N'T20000000', N'F2000000/F200000/F', 73, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (505, N'Lớp triệu gồm những hàng nào', N'THàng triệu/THàng chục triệu/THàng trăm triệu', N'FHàng trăm', 73, N'on')
GO
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (506, N'Chữ số 8 trong số 81379452 thuộc lớp nào và có giá trị bằng bao nhiêu?', N'T80000000', N'F8000000/F80000', 73, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (507, N'Trong các đơn vị đo khối lượng sau, đơn vị nào lớn hơn ki-lô-gam?', N'TTấn/TTạ/TYến', N'FGam', 74, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (508, N'7 tấn = … kg .', N'T7000', N'F70000/F70/F700', 74, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (509, N'278g + 156g = ...', N'T443g', N'F445g/F450g/F435g', 74, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (510, N'5 tạ 8kg = … kg .', N'T508kg', N'F58kg/F5008kg/F580kg', 74, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (511, N'3 tạ = ... Yến', N'T30', N'F3/F300', 74, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (512, N'Số không chia hết cho 2 là số chẵn. Đúng hay sai?', N'TSai', N'FĐúng', 75, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (513, N'Trong các số sau số nào chia hết cho 2 ?', N'T1998/T256/T48', N'F139', 75, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (514, N'các số sau: 24; 35; 99; 158; 237; 1350; 2461 Có bao nhiêu số không chia hết cho 2?', N'T3', N'F5/F4/F6', 75, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (515, N'Các số không chia hết cho 5 có chữ số tận cùng là:', N'T1, 2, 3, 4/T6,7/T8 ,9', N'F0 ;5', 75, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (516, N'Trong các số sau, số nào chia hết cho 5?', N'T35/T50', N'F89/F67', 75, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (517, N'Số có chữ số tận cùng là 0 hoặc 9 thì chia hết cho 9. Đúng hay sai?', N'TSai', N'FĐúng', 75, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (518, N'Trong các số sau, số nào chia hết cho 9?', N'T189/T243', N'F328/F471', 75, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (519, N'Số có tổng các chữ số chia hết cho 3 là số chia hết cho 3. Đúng hay sai?', N'TĐúng', N'FSai', 75, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (520, N'Trong các số sau, số nào chia hết cho 3?', N'T348/T480', N'F328/F471', 75, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (521, N'Theo con giọng đọc trầm buồn, xúc động phù hợp khi nhắc tới bài tập đọc nào?', N'TNỗi dằn vặt của An-đrây-ca', N'FMột người chính trực/FNhững hạt thóc giống/FChị em tôi', 76, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (522, N'Theo con giọng đọc nhẹ nhàng, thể hiện niềm tự hào, tin tưởng phù hợp khi nhắc tới bài tập đọc nào?', N'TTrung thu độc lập', N'FỞ Vương quốc Tương Lai/FNếu chúng mình có phép lạ/FĐôi giày ba ta màu xanh', 76, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (523, N'Trong chủ điểm Thương người như thể thương thân có những bài tập đọc nào là truyện kể?', N'TDế Mèn bênh vực kẻ yếu/TNgười ăn xin', N'FNhững hạt thóc giống/FNỗi dằn vặt của An-đrây-ca', 76, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (524, N'Cốt truyện trong một bài văn kể chuyện thường gồm mấy phần?', N'TBa phần: mở bài, thân bài và kết bài', N'FMột phần : mở bài/FHai phần: mở bài và thân bài', 76, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (525, N'Mỗi câu chuyện cần tôn trọng tính tự nhiên, tùy hứng, không nhất thiết phải đem lại ý nghĩa gì đó, đôi khi là một câu chuyện vô nghĩa', N'TSai', N'FĐúng', 76, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (526, N'Bài nào sau đây không thuộc chủ điểm Có chí thì nên?', N'TChú Đất Nung', N'FÔng Trạng thả diều/FVăn hay chữ tốt/FNgười tìm đường lên các vì sao', 77, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (527, N'Phần nhận xét sau nhắc đến nhân vật nào? Từ tay trắng, nhờ có chí đã làm nên nghiệp lớn, trở thành một bậc "anh hùng kinh tế"', N'TBạch Thái Bưởi', N'FNguyễn Hiền/FXi-ôn-cốp-xki/FLê-ô-nác-đô đa Vin-xi', 77, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (528, N'Đây là lời nhận xét về nhân vật nào? "Kiên trì luyện viết chữ, đã nổi danh là người văn hay chữ tốt."', N'TCao Bá Quát', N'FNguyễn Hiền/FBạch Thái Bưởi/FChú Đất Nung', 77, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (529, N'Trong các trường hợp sau, trường hợp nào viết sai chính tả?', N'TSung sướn/TPhươn hướng', N'FBướng bỉnh/Fxương sườn', 77, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (530, N'Đọc bài Về thăm bà (SGK Tiếng Việt 4, tập 1, trang 176) và cho biết  vì sao Thanh cảm thấy chính bà đang che chở cho mình?', N'TVì Thanh sống với bà từ nhỏ, luôn yêu mến, tin cậy bà và được bà săn sóc, yêu thương', N'FVì Thanh luôn yêu mến, tin cậy bà/FVì Thanh là khách của bà, được bà chăm sóc, yêu thương

', 77, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (533, N'Bài học nào sau đây không thuộc chủ điểm Tình yêu cuộc sống?', N'TTrăng ơi …từ đâu đến?/TDòng sông mặc áo.', N'FTiếng cười là liều thuốc bổ./FĂn “mầm đá”./FNgắm trăng. Không đề.', 79, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (534, N'Cuộc thám hiểm vòng quanh trái đất của Ma-gien-lăng cùng đoàn thủy thủ đã thu được kết quả gì?', N'TKhẳng định trái đất hình cầu./TPhát hiện ra Thái Bình Dương và nhiều vùng đất mới.', N'FPhát hiện ra châu Mĩ và nhiều vùng đất mới./FKhẳng định có sự tồn tại của người ngoài hành tinh.', 79, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (535, N'Tác dụng của tiếng cười trong cuộc sống là gì?', N'TTiếng cười, tính hài hước làm con người khỏe mạnh và sống lâu hơn.', N'FTiếng cười giúp nhận ra ai là kẻ xấu./FTiếng cười giúp nhận diện huyết thống, họ hàng.', 79, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (536, N'Đọc câu chuyện Gu-li-vơ ở xứ sở tí hon Sách giáo khoa Tiếng Việt 4, tập 2, trang 166 – 167 và cho biết nhân vật chính là ai?', N'TGu-li-vơ', N'FLi-li-pút/FKhông có tên/FBli-phút', 79, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (537, N'Nghĩa của chữ hòa trong hòa ước giống nghĩa của chữ hòa nào dưới đây?', N'THòa bình', N'FHòa nhau/FHòa tan/FKhông giống bất kì trường hợp nào', 79, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (538, N'Câu "Nhà vua lệnh cho tôi đánh tan hạm đội địch" là loại câu gì?', N'TCâu kể', N'FCâu hỏi/FCâu khiến/FCâu cảm', 79, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (539, N'Trong câu "Quân trên tàu trông thấy tôi, phát khiếp" bộ phận nào là chủ ngữ?', N'TQuân trên tàu', N'FTôi/FTrông thấy/FPhát khiếp', 79, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (540, N'Chọn từ có cách phát âm khác với các từ còn lại', N'TJapanese', N'Fbirthday/Fplay/Ftoday', 80, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (541, N'Chọn từ có cách phát âm khác với các từ còn lại', N'Tfive', N'Fthin/Fmusic/Fslim', 80, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (542, N'Chọn từ có cách phát âm khác với các từ còn lại', N'Tblouse', N'mouse/Fcloud/Ftrousers', 80, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (543, N'What ___ your nationality?', N'Tis', N'Fbe/Fare/Fwas', 80, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (544, N'How ____ is your sister?', N'Told', N'Fmuch/Foften/Flong', 80, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (545, N'_____ do you have IT lesson?', N'TWhen', N'FHow/FWhat/FWhere', 80, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (546, N' ____ his mother a dentist? – Yes, she is.', N'TIs', N'FDoes/FWill/FCan', 80, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (547, N'He often ________ his teeth after having breakfast.', N'Tbrushes', N'Fhas/Fwashes/Feats', 81, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (548, N'Today she gets ________ at five a.m.', N'Tup', N'Ffor/Fup/Fwith', 81, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (549, N'What time ________ it?', N'Tis', N'Fare/Fwas/Fbe', 81, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (550, N'Please tell me what time ________ you do your homework?', N'Tdo', N'Fdid/Fdoing/Fhave', 81, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (551, N'People use ________ to read the time', N'Tclocks', N'Fcars/Ftelevisions/Fnews', 81, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (552, N'We always ________ dinner at seven p.m.', N'Thave', N'Fget/Ftake/Fmake', 81, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (553, N'Today is Sunday ________ I don’t have to go to school.', N'Tand', N'Fbut/for/Fbecause', 81, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (554, N'Hi. My name _____ Sandra. What’s your name?', N'Tis', N'Fam/Fwell/Fyour', 82, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (555, N'Nice to _____ you again, Minh.', N'Tsee', N'Fwatch/Flook/Fhave', 82, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (556, N'“Hi. How are you today?” – “_____”.', N'TI’m very well. Thanks', N'FGood bye/FGood night /FNice to meet you.', 82, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (557, N'Where are you from? – I’m ______ America.', N'Tfrom', N'Fto/Ffor/Fwith', 82, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (558, N'I’m from _____. I can speak Vietnamese.', N'TVietNam', N'FChina/FJapan/FEngland', 82, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (559, N'May I ______ to Molly, please?', N'Tspeak', N'Flike/Fwould/Fnumber', 83, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (560, N'____ is your mother’s phone number?', N'TWhat', N'FWould/FWhen/FDo', 83, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (561, N'I want to _____ for a walk.', N'Tgo', N'Ffor/Fgo/Fdo', 83, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (562, N'Would you ______ to go skating?', N'Tlike', N'Fwent/Ffor/Fwith', 83, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (563, N'My phone _______ is 0926849212.', N'Tnumber', N'Fwant/Fcall/Fgo', 83, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (564, N'What ____ she doing now?', N'Tis', N'Fgo/Fread/Fspeak', 83, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (565, N'I like going___________ a picnic.', N'Tfor', N'Fto/Fwent/Fgo', 83, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (566, N'Trong những bài tập đọc sau, bài nào không thuộc chủ điểm Những người quả cảm?', N'TChuyện cổ tích về loài người/TKhúc hát ru những em bé lớn trên lưng mẹ', N'FBài thơ về tiểu đội xe không kính/FGa-vrốt ngoài chiến lũy/FDù sao trái đất vẫn quay', 78, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (567, N'Bài văn Hoa học trò nhắc tới loài cây nào?', N'TCây phượng', N'FCây bằng lăng/FCây gạo/FCây bàng', 78, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (568, N'Trong bài Khuất phục tên cướp biển, phẩm chất nào của bác sĩ Ly đối lập với tên chủ tàu?', N'TKiên quyết, dũng cảm', N'FHung hãn, bạo ngược/FMềm mỏng, dịu dàng/FHiền lành, nhút nhát', 78, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (569, N'Để nêu yêu cầu, đề nghị, ngoài câu khiến có thể sử dụng loại câu hỏi.', N'TĐúng', N'FSai', 78, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (570, N'Trong các câu sau, câu nào giữ được phép lịch sự khi yêu cầu, đề nghị người khác giúp đỡ cho mình?', N'TLan ơi, cho tớ về với!', N'FCho đi nhờ một cái!/FMang xe ra đây!/FRa đây đèo tao về nhanh lên!', 78, N'on')
INSERT [dbo].[question] ([id], [content], [trueAnswer], [falseAnswer], [courseid], [status]) VALUES (571, N'Trong các câu sau, câu nào giữ được phép lịch sự khi yêu cầu, đề nghị người khác giúp đỡ mình?', N'TChiều nay, chị đón em nhé!', N'FChiều nay,phải đón em đấy!/FChiều nay, đi xe đón em!/F5 giờ phải có mặt ở cổng trường!', 78, N'on')
SET IDENTITY_INSERT [dbo].[question] OFF
GO
SET IDENTITY_INSERT [dbo].[questionforexam] ON 

INSERT [dbo].[questionforexam] ([id], [examid], [questionid], [answer]) VALUES (390, 50, 259, N'')
INSERT [dbo].[questionforexam] ([id], [examid], [questionid], [answer]) VALUES (391, 50, 261, N'TLý Tự Trọng, mật thám, luật sư,TTên đội tây, đồng chí cách mạng')
INSERT [dbo].[questionforexam] ([id], [examid], [questionid], [answer]) VALUES (392, 50, 262, N'')
INSERT [dbo].[questionforexam] ([id], [examid], [questionid], [answer]) VALUES (393, 50, 266, N'')
INSERT [dbo].[questionforexam] ([id], [examid], [questionid], [answer]) VALUES (394, 50, 269, N'')
INSERT [dbo].[questionforexam] ([id], [examid], [questionid], [answer]) VALUES (395, 50, 270, N'')
INSERT [dbo].[questionforexam] ([id], [examid], [questionid], [answer]) VALUES (396, 50, 272, N'')
INSERT [dbo].[questionforexam] ([id], [examid], [questionid], [answer]) VALUES (397, 50, 278, N'')
INSERT [dbo].[questionforexam] ([id], [examid], [questionid], [answer]) VALUES (398, 50, 282, N'')
INSERT [dbo].[questionforexam] ([id], [examid], [questionid], [answer]) VALUES (399, 50, 285, N'')
INSERT [dbo].[questionforexam] ([id], [examid], [questionid], [answer]) VALUES (400, 51, 232, N'')
INSERT [dbo].[questionforexam] ([id], [examid], [questionid], [answer]) VALUES (401, 51, 234, N'')
INSERT [dbo].[questionforexam] ([id], [examid], [questionid], [answer]) VALUES (402, 51, 236, N'')
INSERT [dbo].[questionforexam] ([id], [examid], [questionid], [answer]) VALUES (403, 51, 237, N'Tfrom')
INSERT [dbo].[questionforexam] ([id], [examid], [questionid], [answer]) VALUES (404, 51, 238, N'')
INSERT [dbo].[questionforexam] ([id], [examid], [questionid], [answer]) VALUES (405, 51, 241, N'')
INSERT [dbo].[questionforexam] ([id], [examid], [questionid], [answer]) VALUES (406, 51, 243, N'')
INSERT [dbo].[questionforexam] ([id], [examid], [questionid], [answer]) VALUES (407, 51, 246, N'')
INSERT [dbo].[questionforexam] ([id], [examid], [questionid], [answer]) VALUES (408, 51, 253, N'')
INSERT [dbo].[questionforexam] ([id], [examid], [questionid], [answer]) VALUES (409, 51, 254, N'')
INSERT [dbo].[questionforexam] ([id], [examid], [questionid], [answer]) VALUES (410, 52, 210, N'')
INSERT [dbo].[questionforexam] ([id], [examid], [questionid], [answer]) VALUES (411, 52, 213, N'T705,132')
INSERT [dbo].[questionforexam] ([id], [examid], [questionid], [answer]) VALUES (412, 52, 214, N'F900,100')
INSERT [dbo].[questionforexam] ([id], [examid], [questionid], [answer]) VALUES (413, 52, 215, N'TTất Cả đều đúng')
INSERT [dbo].[questionforexam] ([id], [examid], [questionid], [answer]) VALUES (414, 52, 219, N'T1139dm2')
INSERT [dbo].[questionforexam] ([id], [examid], [questionid], [answer]) VALUES (415, 52, 221, N'')
INSERT [dbo].[questionforexam] ([id], [examid], [questionid], [answer]) VALUES (416, 52, 222, N'T2,355 m')
INSERT [dbo].[questionforexam] ([id], [examid], [questionid], [answer]) VALUES (417, 52, 224, N'T113,04 cm2')
INSERT [dbo].[questionforexam] ([id], [examid], [questionid], [answer]) VALUES (418, 52, 226, N'T94 dm2')
INSERT [dbo].[questionforexam] ([id], [examid], [questionid], [answer]) VALUES (419, 52, 229, N'FĐúng')
INSERT [dbo].[questionforexam] ([id], [examid], [questionid], [answer]) VALUES (420, 53, 207, N'')
INSERT [dbo].[questionforexam] ([id], [examid], [questionid], [answer]) VALUES (421, 53, 209, N'')
INSERT [dbo].[questionforexam] ([id], [examid], [questionid], [answer]) VALUES (422, 53, 214, N'')
INSERT [dbo].[questionforexam] ([id], [examid], [questionid], [answer]) VALUES (423, 53, 216, N'')
INSERT [dbo].[questionforexam] ([id], [examid], [questionid], [answer]) VALUES (424, 53, 219, N'')
INSERT [dbo].[questionforexam] ([id], [examid], [questionid], [answer]) VALUES (425, 53, 221, N'F18,27cm')
INSERT [dbo].[questionforexam] ([id], [examid], [questionid], [answer]) VALUES (426, 53, 224, N'')
INSERT [dbo].[questionforexam] ([id], [examid], [questionid], [answer]) VALUES (427, 53, 225, N'')
INSERT [dbo].[questionforexam] ([id], [examid], [questionid], [answer]) VALUES (428, 53, 226, N'')
INSERT [dbo].[questionforexam] ([id], [examid], [questionid], [answer]) VALUES (429, 53, 230, N'')
INSERT [dbo].[questionforexam] ([id], [examid], [questionid], [answer]) VALUES (430, 54, 208, N'')
INSERT [dbo].[questionforexam] ([id], [examid], [questionid], [answer]) VALUES (431, 54, 210, N'')
INSERT [dbo].[questionforexam] ([id], [examid], [questionid], [answer]) VALUES (432, 54, 214, N'')
INSERT [dbo].[questionforexam] ([id], [examid], [questionid], [answer]) VALUES (433, 54, 215, N'')
INSERT [dbo].[questionforexam] ([id], [examid], [questionid], [answer]) VALUES (434, 54, 216, N'')
INSERT [dbo].[questionforexam] ([id], [examid], [questionid], [answer]) VALUES (435, 54, 220, N'')
INSERT [dbo].[questionforexam] ([id], [examid], [questionid], [answer]) VALUES (436, 54, 223, N'')
INSERT [dbo].[questionforexam] ([id], [examid], [questionid], [answer]) VALUES (437, 54, 224, N'F114,04 cm2')
INSERT [dbo].[questionforexam] ([id], [examid], [questionid], [answer]) VALUES (438, 54, 226, N'')
INSERT [dbo].[questionforexam] ([id], [examid], [questionid], [answer]) VALUES (439, 54, 228, N'')
INSERT [dbo].[questionforexam] ([id], [examid], [questionid], [answer]) VALUES (440, 55, 262, N'FVì anh thông minh, sáng dạ')
INSERT [dbo].[questionforexam] ([id], [examid], [questionid], [answer]) VALUES (441, 55, 263, N'FĐoàn ca')
INSERT [dbo].[questionforexam] ([id], [examid], [questionid], [answer]) VALUES (442, 55, 264, N'TDõng dạc vạch mặt bọn đế quốc và tuyên truyền cách mạng')
INSERT [dbo].[questionforexam] ([id], [examid], [questionid], [answer]) VALUES (443, 55, 272, N'TTả quang cảnh của ngôi trường')
INSERT [dbo].[questionforexam] ([id], [examid], [questionid], [answer]) VALUES (444, 55, 273, N'Tdây,Fphèn')
INSERT [dbo].[questionforexam] ([id], [examid], [questionid], [answer]) VALUES (445, 55, 275, N'FTất cả những thứ tồn tại xung quanh con người')
INSERT [dbo].[questionforexam] ([id], [examid], [questionid], [answer]) VALUES (446, 55, 279, N'TNgười trưởng tràng')
INSERT [dbo].[questionforexam] ([id], [examid], [questionid], [answer]) VALUES (447, 55, 282, N'TChả lại')
INSERT [dbo].[questionforexam] ([id], [examid], [questionid], [answer]) VALUES (448, 55, 283, N'FVích-To-Huy-Go')
INSERT [dbo].[questionforexam] ([id], [examid], [questionid], [answer]) VALUES (449, 55, 284, N'FPhúc tinh')
INSERT [dbo].[questionforexam] ([id], [examid], [questionid], [answer]) VALUES (450, 56, 290, N'FĐúng')
INSERT [dbo].[questionforexam] ([id], [examid], [questionid], [answer]) VALUES (451, 56, 292, N'F7')
INSERT [dbo].[questionforexam] ([id], [examid], [questionid], [answer]) VALUES (452, 56, 297, N'F1')
INSERT [dbo].[questionforexam] ([id], [examid], [questionid], [answer]) VALUES (453, 56, 300, N'T0')
INSERT [dbo].[questionforexam] ([id], [examid], [questionid], [answer]) VALUES (454, 56, 302, N'F2')
INSERT [dbo].[questionforexam] ([id], [examid], [questionid], [answer]) VALUES (455, 56, 306, N'T5')
INSERT [dbo].[questionforexam] ([id], [examid], [questionid], [answer]) VALUES (456, 56, 307, N'F0')
INSERT [dbo].[questionforexam] ([id], [examid], [questionid], [answer]) VALUES (457, 56, 308, N'F9')
INSERT [dbo].[questionforexam] ([id], [examid], [questionid], [answer]) VALUES (458, 56, 309, N'TTuấn')
INSERT [dbo].[questionforexam] ([id], [examid], [questionid], [answer]) VALUES (459, 56, 311, N'THòa')
INSERT [dbo].[questionforexam] ([id], [examid], [questionid], [answer]) VALUES (460, 57, 454, N'')
INSERT [dbo].[questionforexam] ([id], [examid], [questionid], [answer]) VALUES (461, 57, 455, N'')
INSERT [dbo].[questionforexam] ([id], [examid], [questionid], [answer]) VALUES (462, 57, 456, N'')
INSERT [dbo].[questionforexam] ([id], [examid], [questionid], [answer]) VALUES (463, 57, 457, N'')
INSERT [dbo].[questionforexam] ([id], [examid], [questionid], [answer]) VALUES (464, 57, 458, N'')
INSERT [dbo].[questionforexam] ([id], [examid], [questionid], [answer]) VALUES (465, 57, 459, N'')
INSERT [dbo].[questionforexam] ([id], [examid], [questionid], [answer]) VALUES (466, 57, 462, N'')
INSERT [dbo].[questionforexam] ([id], [examid], [questionid], [answer]) VALUES (467, 57, 464, N'')
INSERT [dbo].[questionforexam] ([id], [examid], [questionid], [answer]) VALUES (468, 57, 465, N'')
INSERT [dbo].[questionforexam] ([id], [examid], [questionid], [answer]) VALUES (469, 57, 466, N'')
INSERT [dbo].[questionforexam] ([id], [examid], [questionid], [answer]) VALUES (470, 59, 454, N'')
INSERT [dbo].[questionforexam] ([id], [examid], [questionid], [answer]) VALUES (471, 58, 454, N'')
INSERT [dbo].[questionforexam] ([id], [examid], [questionid], [answer]) VALUES (472, 58, 455, N'')
INSERT [dbo].[questionforexam] ([id], [examid], [questionid], [answer]) VALUES (473, 59, 455, N'')
INSERT [dbo].[questionforexam] ([id], [examid], [questionid], [answer]) VALUES (474, 58, 456, N'')
INSERT [dbo].[questionforexam] ([id], [examid], [questionid], [answer]) VALUES (475, 59, 456, N'')
INSERT [dbo].[questionforexam] ([id], [examid], [questionid], [answer]) VALUES (476, 58, 457, N'')
INSERT [dbo].[questionforexam] ([id], [examid], [questionid], [answer]) VALUES (477, 59, 457, N'')
INSERT [dbo].[questionforexam] ([id], [examid], [questionid], [answer]) VALUES (478, 58, 458, N'')
INSERT [dbo].[questionforexam] ([id], [examid], [questionid], [answer]) VALUES (479, 59, 458, N'')
INSERT [dbo].[questionforexam] ([id], [examid], [questionid], [answer]) VALUES (480, 58, 459, N'')
INSERT [dbo].[questionforexam] ([id], [examid], [questionid], [answer]) VALUES (481, 59, 459, N'')
INSERT [dbo].[questionforexam] ([id], [examid], [questionid], [answer]) VALUES (482, 59, 460, N'')
INSERT [dbo].[questionforexam] ([id], [examid], [questionid], [answer]) VALUES (483, 58, 460, N'')
INSERT [dbo].[questionforexam] ([id], [examid], [questionid], [answer]) VALUES (484, 59, 461, N'')
INSERT [dbo].[questionforexam] ([id], [examid], [questionid], [answer]) VALUES (485, 58, 461, N'')
INSERT [dbo].[questionforexam] ([id], [examid], [questionid], [answer]) VALUES (486, 59, 464, N'')
INSERT [dbo].[questionforexam] ([id], [examid], [questionid], [answer]) VALUES (487, 58, 464, N'')
INSERT [dbo].[questionforexam] ([id], [examid], [questionid], [answer]) VALUES (488, 59, 466, N'')
GO
INSERT [dbo].[questionforexam] ([id], [examid], [questionid], [answer]) VALUES (489, 58, 466, N'')
INSERT [dbo].[questionforexam] ([id], [examid], [questionid], [answer]) VALUES (490, 60, 454, N'')
INSERT [dbo].[questionforexam] ([id], [examid], [questionid], [answer]) VALUES (491, 61, 454, N'')
INSERT [dbo].[questionforexam] ([id], [examid], [questionid], [answer]) VALUES (492, 60, 455, N'')
INSERT [dbo].[questionforexam] ([id], [examid], [questionid], [answer]) VALUES (493, 60, 456, N'')
INSERT [dbo].[questionforexam] ([id], [examid], [questionid], [answer]) VALUES (494, 61, 455, N'')
INSERT [dbo].[questionforexam] ([id], [examid], [questionid], [answer]) VALUES (495, 60, 457, N'')
INSERT [dbo].[questionforexam] ([id], [examid], [questionid], [answer]) VALUES (496, 61, 456, N'')
INSERT [dbo].[questionforexam] ([id], [examid], [questionid], [answer]) VALUES (497, 60, 458, N'')
INSERT [dbo].[questionforexam] ([id], [examid], [questionid], [answer]) VALUES (498, 61, 457, N'')
INSERT [dbo].[questionforexam] ([id], [examid], [questionid], [answer]) VALUES (499, 60, 459, N'')
INSERT [dbo].[questionforexam] ([id], [examid], [questionid], [answer]) VALUES (500, 61, 458, N'')
INSERT [dbo].[questionforexam] ([id], [examid], [questionid], [answer]) VALUES (501, 60, 460, N'')
INSERT [dbo].[questionforexam] ([id], [examid], [questionid], [answer]) VALUES (502, 61, 459, N'')
INSERT [dbo].[questionforexam] ([id], [examid], [questionid], [answer]) VALUES (503, 60, 461, N'')
INSERT [dbo].[questionforexam] ([id], [examid], [questionid], [answer]) VALUES (504, 61, 460, N'')
INSERT [dbo].[questionforexam] ([id], [examid], [questionid], [answer]) VALUES (505, 60, 465, N'')
INSERT [dbo].[questionforexam] ([id], [examid], [questionid], [answer]) VALUES (506, 61, 461, N'')
INSERT [dbo].[questionforexam] ([id], [examid], [questionid], [answer]) VALUES (507, 60, 466, N'')
INSERT [dbo].[questionforexam] ([id], [examid], [questionid], [answer]) VALUES (508, 61, 465, N'')
INSERT [dbo].[questionforexam] ([id], [examid], [questionid], [answer]) VALUES (509, 61, 466, N'')
INSERT [dbo].[questionforexam] ([id], [examid], [questionid], [answer]) VALUES (510, 62, 500, N'')
INSERT [dbo].[questionforexam] ([id], [examid], [questionid], [answer]) VALUES (511, 62, 503, N'')
INSERT [dbo].[questionforexam] ([id], [examid], [questionid], [answer]) VALUES (512, 62, 504, N'')
INSERT [dbo].[questionforexam] ([id], [examid], [questionid], [answer]) VALUES (513, 62, 506, N'')
INSERT [dbo].[questionforexam] ([id], [examid], [questionid], [answer]) VALUES (514, 62, 507, N'FGam,TTấn,TTạ')
INSERT [dbo].[questionforexam] ([id], [examid], [questionid], [answer]) VALUES (515, 62, 509, N'')
INSERT [dbo].[questionforexam] ([id], [examid], [questionid], [answer]) VALUES (516, 62, 511, N'')
INSERT [dbo].[questionforexam] ([id], [examid], [questionid], [answer]) VALUES (517, 62, 514, N'')
INSERT [dbo].[questionforexam] ([id], [examid], [questionid], [answer]) VALUES (518, 62, 515, N'T1; 2; 3; 4')
INSERT [dbo].[questionforexam] ([id], [examid], [questionid], [answer]) VALUES (519, 62, 517, N'')
INSERT [dbo].[questionforexam] ([id], [examid], [questionid], [answer]) VALUES (520, 63, 496, N'')
INSERT [dbo].[questionforexam] ([id], [examid], [questionid], [answer]) VALUES (521, 63, 500, N'')
INSERT [dbo].[questionforexam] ([id], [examid], [questionid], [answer]) VALUES (522, 63, 502, N'')
INSERT [dbo].[questionforexam] ([id], [examid], [questionid], [answer]) VALUES (523, 63, 504, N'')
INSERT [dbo].[questionforexam] ([id], [examid], [questionid], [answer]) VALUES (524, 63, 505, N'')
INSERT [dbo].[questionforexam] ([id], [examid], [questionid], [answer]) VALUES (525, 63, 508, N'')
INSERT [dbo].[questionforexam] ([id], [examid], [questionid], [answer]) VALUES (526, 63, 509, N'')
INSERT [dbo].[questionforexam] ([id], [examid], [questionid], [answer]) VALUES (527, 63, 512, N'TSai')
INSERT [dbo].[questionforexam] ([id], [examid], [questionid], [answer]) VALUES (528, 63, 514, N'')
INSERT [dbo].[questionforexam] ([id], [examid], [questionid], [answer]) VALUES (529, 63, 520, N'')
INSERT [dbo].[questionforexam] ([id], [examid], [questionid], [answer]) VALUES (530, 64, 296, N'')
INSERT [dbo].[questionforexam] ([id], [examid], [questionid], [answer]) VALUES (531, 65, 296, N'')
INSERT [dbo].[questionforexam] ([id], [examid], [questionid], [answer]) VALUES (532, 65, 297, N'')
INSERT [dbo].[questionforexam] ([id], [examid], [questionid], [answer]) VALUES (533, 64, 297, N'')
INSERT [dbo].[questionforexam] ([id], [examid], [questionid], [answer]) VALUES (534, 64, 299, N'')
INSERT [dbo].[questionforexam] ([id], [examid], [questionid], [answer]) VALUES (535, 65, 299, N'')
INSERT [dbo].[questionforexam] ([id], [examid], [questionid], [answer]) VALUES (536, 65, 301, N'')
INSERT [dbo].[questionforexam] ([id], [examid], [questionid], [answer]) VALUES (537, 64, 301, N'')
INSERT [dbo].[questionforexam] ([id], [examid], [questionid], [answer]) VALUES (538, 65, 303, N'')
INSERT [dbo].[questionforexam] ([id], [examid], [questionid], [answer]) VALUES (539, 64, 303, N'')
INSERT [dbo].[questionforexam] ([id], [examid], [questionid], [answer]) VALUES (540, 65, 306, N'')
INSERT [dbo].[questionforexam] ([id], [examid], [questionid], [answer]) VALUES (541, 64, 306, N'')
INSERT [dbo].[questionforexam] ([id], [examid], [questionid], [answer]) VALUES (542, 65, 307, N'')
INSERT [dbo].[questionforexam] ([id], [examid], [questionid], [answer]) VALUES (543, 64, 307, N'')
INSERT [dbo].[questionforexam] ([id], [examid], [questionid], [answer]) VALUES (544, 64, 308, N'')
INSERT [dbo].[questionforexam] ([id], [examid], [questionid], [answer]) VALUES (545, 65, 308, N'')
INSERT [dbo].[questionforexam] ([id], [examid], [questionid], [answer]) VALUES (546, 64, 309, N'')
INSERT [dbo].[questionforexam] ([id], [examid], [questionid], [answer]) VALUES (547, 65, 309, N'')
INSERT [dbo].[questionforexam] ([id], [examid], [questionid], [answer]) VALUES (548, 64, 310, N'')
INSERT [dbo].[questionforexam] ([id], [examid], [questionid], [answer]) VALUES (549, 65, 310, N'')
INSERT [dbo].[questionforexam] ([id], [examid], [questionid], [answer]) VALUES (550, 66, 521, N'FChị em tôi')
INSERT [dbo].[questionforexam] ([id], [examid], [questionid], [answer]) VALUES (551, 66, 526, N'FVăn hay chữ tốt')
INSERT [dbo].[questionforexam] ([id], [examid], [questionid], [answer]) VALUES (552, 66, 527, N'TBạch Thái Bưởi')
INSERT [dbo].[questionforexam] ([id], [examid], [questionid], [answer]) VALUES (553, 66, 528, N'FBạch Thái Bưởi')
INSERT [dbo].[questionforexam] ([id], [examid], [questionid], [answer]) VALUES (554, 66, 535, N'TTiếng cười, tính hài hước làm con người khỏe mạnh và sống lâu hơn.')
INSERT [dbo].[questionforexam] ([id], [examid], [questionid], [answer]) VALUES (555, 66, 539, N'FTôi')
INSERT [dbo].[questionforexam] ([id], [examid], [questionid], [answer]) VALUES (556, 66, 566, N'FBài thơ về tiểu đội xe không kính,FDù sao trái đất vẫn quay')
INSERT [dbo].[questionforexam] ([id], [examid], [questionid], [answer]) VALUES (557, 66, 567, N'FCây bằng lăng')
INSERT [dbo].[questionforexam] ([id], [examid], [questionid], [answer]) VALUES (558, 66, 568, N'TKiên quyết, dũng cảm')
INSERT [dbo].[questionforexam] ([id], [examid], [questionid], [answer]) VALUES (559, 66, 569, N'FSai')
INSERT [dbo].[questionforexam] ([id], [examid], [questionid], [answer]) VALUES (560, 67, 319, N'Fngh')
INSERT [dbo].[questionforexam] ([id], [examid], [questionid], [answer]) VALUES (561, 67, 320, N'Tngh')
INSERT [dbo].[questionforexam] ([id], [examid], [questionid], [answer]) VALUES (562, 67, 322, N'Tng')
INSERT [dbo].[questionforexam] ([id], [examid], [questionid], [answer]) VALUES (563, 67, 325, N'Fũi')
INSERT [dbo].[questionforexam] ([id], [examid], [questionid], [answer]) VALUES (564, 67, 327, N'Fuổi')
INSERT [dbo].[questionforexam] ([id], [examid], [questionid], [answer]) VALUES (565, 67, 330, N'Fn')
INSERT [dbo].[questionforexam] ([id], [examid], [questionid], [answer]) VALUES (566, 67, 335, N'Tảy')
INSERT [dbo].[questionforexam] ([id], [examid], [questionid], [answer]) VALUES (567, 67, 337, N'Tgi')
INSERT [dbo].[questionforexam] ([id], [examid], [questionid], [answer]) VALUES (568, 67, 339, N'Td')
INSERT [dbo].[questionforexam] ([id], [examid], [questionid], [answer]) VALUES (569, 67, 341, N'Tc')
INSERT [dbo].[questionforexam] ([id], [examid], [questionid], [answer]) VALUES (570, 68, 542, N'Tblouse')
INSERT [dbo].[questionforexam] ([id], [examid], [questionid], [answer]) VALUES (571, 68, 544, N'')
INSERT [dbo].[questionforexam] ([id], [examid], [questionid], [answer]) VALUES (572, 68, 546, N'')
INSERT [dbo].[questionforexam] ([id], [examid], [questionid], [answer]) VALUES (573, 68, 550, N'')
INSERT [dbo].[questionforexam] ([id], [examid], [questionid], [answer]) VALUES (574, 68, 552, N'')
INSERT [dbo].[questionforexam] ([id], [examid], [questionid], [answer]) VALUES (575, 68, 553, N'')
INSERT [dbo].[questionforexam] ([id], [examid], [questionid], [answer]) VALUES (576, 68, 554, N'')
INSERT [dbo].[questionforexam] ([id], [examid], [questionid], [answer]) VALUES (577, 68, 557, N'')
INSERT [dbo].[questionforexam] ([id], [examid], [questionid], [answer]) VALUES (578, 68, 558, N'FJapan')
INSERT [dbo].[questionforexam] ([id], [examid], [questionid], [answer]) VALUES (579, 68, 565, N'')
INSERT [dbo].[questionforexam] ([id], [examid], [questionid], [answer]) VALUES (580, 69, 288, N'T=')
INSERT [dbo].[questionforexam] ([id], [examid], [questionid], [answer]) VALUES (581, 69, 289, N'T>')
INSERT [dbo].[questionforexam] ([id], [examid], [questionid], [answer]) VALUES (582, 69, 291, N'T2')
INSERT [dbo].[questionforexam] ([id], [examid], [questionid], [answer]) VALUES (583, 69, 296, N'F1')
INSERT [dbo].[questionforexam] ([id], [examid], [questionid], [answer]) VALUES (584, 69, 301, N'TĐúng')
INSERT [dbo].[questionforexam] ([id], [examid], [questionid], [answer]) VALUES (585, 69, 302, N'F4')
INSERT [dbo].[questionforexam] ([id], [examid], [questionid], [answer]) VALUES (586, 69, 304, N'F0')
INSERT [dbo].[questionforexam] ([id], [examid], [questionid], [answer]) VALUES (587, 69, 306, N'T5')
INSERT [dbo].[questionforexam] ([id], [examid], [questionid], [answer]) VALUES (588, 69, 308, N'F6')
GO
INSERT [dbo].[questionforexam] ([id], [examid], [questionid], [answer]) VALUES (589, 69, 311, N'FGiang')
INSERT [dbo].[questionforexam] ([id], [examid], [questionid], [answer]) VALUES (590, 70, 259, N'FMái nhà phủ rơm,FBụi mía')
INSERT [dbo].[questionforexam] ([id], [examid], [questionid], [answer]) VALUES (591, 70, 260, N'TVàng trù phú, đầm ấm')
INSERT [dbo].[questionforexam] ([id], [examid], [questionid], [answer]) VALUES (592, 70, 263, N'FĐoàn ca')
INSERT [dbo].[questionforexam] ([id], [examid], [questionid], [answer]) VALUES (593, 70, 264, N'')
INSERT [dbo].[questionforexam] ([id], [examid], [questionid], [answer]) VALUES (594, 70, 268, N'TThông minh - ngu dốt,THào phóng - keo kiệt')
INSERT [dbo].[questionforexam] ([id], [examid], [questionid], [answer]) VALUES (595, 70, 270, N'')
INSERT [dbo].[questionforexam] ([id], [examid], [questionid], [answer]) VALUES (596, 70, 273, N'')
INSERT [dbo].[questionforexam] ([id], [examid], [questionid], [answer]) VALUES (597, 70, 277, N'')
INSERT [dbo].[questionforexam] ([id], [examid], [questionid], [answer]) VALUES (598, 70, 280, N'T Tất cả đều đúng')
INSERT [dbo].[questionforexam] ([id], [examid], [questionid], [answer]) VALUES (599, 70, 281, N'')
INSERT [dbo].[questionforexam] ([id], [examid], [questionid], [answer]) VALUES (600, 71, 314, N'')
INSERT [dbo].[questionforexam] ([id], [examid], [questionid], [answer]) VALUES (601, 71, 321, N'')
INSERT [dbo].[questionforexam] ([id], [examid], [questionid], [answer]) VALUES (602, 71, 323, N'')
INSERT [dbo].[questionforexam] ([id], [examid], [questionid], [answer]) VALUES (603, 71, 324, N'')
INSERT [dbo].[questionforexam] ([id], [examid], [questionid], [answer]) VALUES (604, 71, 325, N'')
INSERT [dbo].[questionforexam] ([id], [examid], [questionid], [answer]) VALUES (605, 71, 327, N'')
INSERT [dbo].[questionforexam] ([id], [examid], [questionid], [answer]) VALUES (606, 71, 330, N'')
INSERT [dbo].[questionforexam] ([id], [examid], [questionid], [answer]) VALUES (607, 71, 333, N'')
INSERT [dbo].[questionforexam] ([id], [examid], [questionid], [answer]) VALUES (608, 71, 339, N'')
INSERT [dbo].[questionforexam] ([id], [examid], [questionid], [answer]) VALUES (609, 71, 340, N'')
INSERT [dbo].[questionforexam] ([id], [examid], [questionid], [answer]) VALUES (610, 72, 287, N'')
INSERT [dbo].[questionforexam] ([id], [examid], [questionid], [answer]) VALUES (611, 72, 294, N'')
INSERT [dbo].[questionforexam] ([id], [examid], [questionid], [answer]) VALUES (612, 72, 295, N'')
INSERT [dbo].[questionforexam] ([id], [examid], [questionid], [answer]) VALUES (613, 72, 296, N'')
INSERT [dbo].[questionforexam] ([id], [examid], [questionid], [answer]) VALUES (614, 72, 297, N'')
INSERT [dbo].[questionforexam] ([id], [examid], [questionid], [answer]) VALUES (615, 72, 299, N'')
INSERT [dbo].[questionforexam] ([id], [examid], [questionid], [answer]) VALUES (616, 72, 302, N'')
INSERT [dbo].[questionforexam] ([id], [examid], [questionid], [answer]) VALUES (617, 72, 303, N'')
INSERT [dbo].[questionforexam] ([id], [examid], [questionid], [answer]) VALUES (618, 72, 308, N'')
INSERT [dbo].[questionforexam] ([id], [examid], [questionid], [answer]) VALUES (619, 72, 311, N'')
INSERT [dbo].[questionforexam] ([id], [examid], [questionid], [answer]) VALUES (620, 73, 256, N'TKết bài,TThân bài,TMở bài')
INSERT [dbo].[questionforexam] ([id], [examid], [questionid], [answer]) VALUES (621, 73, 259, N'')
INSERT [dbo].[questionforexam] ([id], [examid], [questionid], [answer]) VALUES (622, 73, 260, N'')
INSERT [dbo].[questionforexam] ([id], [examid], [questionid], [answer]) VALUES (623, 73, 263, N'')
INSERT [dbo].[questionforexam] ([id], [examid], [questionid], [answer]) VALUES (624, 73, 269, N'')
INSERT [dbo].[questionforexam] ([id], [examid], [questionid], [answer]) VALUES (625, 73, 270, N'')
INSERT [dbo].[questionforexam] ([id], [examid], [questionid], [answer]) VALUES (626, 73, 271, N'')
INSERT [dbo].[questionforexam] ([id], [examid], [questionid], [answer]) VALUES (627, 73, 272, N'')
INSERT [dbo].[questionforexam] ([id], [examid], [questionid], [answer]) VALUES (628, 73, 275, N'')
INSERT [dbo].[questionforexam] ([id], [examid], [questionid], [answer]) VALUES (629, 73, 278, N'')
INSERT [dbo].[questionforexam] ([id], [examid], [questionid], [answer]) VALUES (630, 74, 397, N'FBạn nhỏ đã hỏi bố ngày mai ăn sáng món gì')
INSERT [dbo].[questionforexam] ([id], [examid], [questionid], [answer]) VALUES (631, 74, 398, N'TTất cả đều đúng')
INSERT [dbo].[questionforexam] ([id], [examid], [questionid], [answer]) VALUES (632, 74, 399, N'')
INSERT [dbo].[questionforexam] ([id], [examid], [questionid], [answer]) VALUES (633, 74, 400, N'Tmua một con ngựa hồng và một cái ô tô')
INSERT [dbo].[questionforexam] ([id], [examid], [questionid], [answer]) VALUES (634, 74, 401, N'Tmua búp bê và quần áo đẹp')
INSERT [dbo].[questionforexam] ([id], [examid], [questionid], [answer]) VALUES (635, 74, 403, N'Tvì bạn thấy đứng trước lớp khó nói quá')
INSERT [dbo].[questionforexam] ([id], [examid], [questionid], [answer]) VALUES (636, 74, 404, N'Tco rúm mình lại')
INSERT [dbo].[questionforexam] ([id], [examid], [questionid], [answer]) VALUES (637, 74, 405, N'')
INSERT [dbo].[questionforexam] ([id], [examid], [questionid], [answer]) VALUES (638, 74, 406, N'')
INSERT [dbo].[questionforexam] ([id], [examid], [questionid], [answer]) VALUES (639, 74, 407, N'')
INSERT [dbo].[questionforexam] ([id], [examid], [questionid], [answer]) VALUES (640, 75, 287, N'')
INSERT [dbo].[questionforexam] ([id], [examid], [questionid], [answer]) VALUES (641, 75, 293, N'T5')
INSERT [dbo].[questionforexam] ([id], [examid], [questionid], [answer]) VALUES (642, 75, 294, N'')
INSERT [dbo].[questionforexam] ([id], [examid], [questionid], [answer]) VALUES (643, 75, 295, N'T4')
INSERT [dbo].[questionforexam] ([id], [examid], [questionid], [answer]) VALUES (644, 75, 296, N'F5')
INSERT [dbo].[questionforexam] ([id], [examid], [questionid], [answer]) VALUES (645, 75, 297, N'F2')
INSERT [dbo].[questionforexam] ([id], [examid], [questionid], [answer]) VALUES (646, 75, 299, N'T4')
INSERT [dbo].[questionforexam] ([id], [examid], [questionid], [answer]) VALUES (647, 75, 302, N'F2')
INSERT [dbo].[questionforexam] ([id], [examid], [questionid], [answer]) VALUES (648, 75, 303, N'F2')
INSERT [dbo].[questionforexam] ([id], [examid], [questionid], [answer]) VALUES (649, 75, 305, N'F4')
INSERT [dbo].[questionforexam] ([id], [examid], [questionid], [answer]) VALUES (650, 76, 258, N'FKhông có cảm giác héo tàn hanh hao lúc sắp bước vào mùa đông')
INSERT [dbo].[questionforexam] ([id], [examid], [questionid], [answer]) VALUES (651, 76, 260, N'FVàng mượt')
INSERT [dbo].[questionforexam] ([id], [examid], [questionid], [answer]) VALUES (652, 76, 261, N'FBố Lý Tự Trọng, Lý Tự Trọng, luật sư, mật thám,TLý Tự Trọng, mật thám, luật sư')
INSERT [dbo].[questionforexam] ([id], [examid], [questionid], [answer]) VALUES (653, 76, 265, N'Tchết – sống,Tvinh – nhục')
INSERT [dbo].[questionforexam] ([id], [examid], [questionid], [answer]) VALUES (654, 76, 267, N'TThù ghét')
INSERT [dbo].[questionforexam] ([id], [examid], [questionid], [answer]) VALUES (655, 76, 269, N'FTrạng thái hiền hòa, yên ả')
INSERT [dbo].[questionforexam] ([id], [examid], [questionid], [answer]) VALUES (656, 76, 271, N'TTả xuôi,TTả ngược')
INSERT [dbo].[questionforexam] ([id], [examid], [questionid], [answer]) VALUES (657, 76, 272, N'TTả quang cảnh của ngôi trường')
INSERT [dbo].[questionforexam] ([id], [examid], [questionid], [answer]) VALUES (658, 76, 283, N'THà Nội')
INSERT [dbo].[questionforexam] ([id], [examid], [questionid], [answer]) VALUES (659, 76, 286, N'TCả 3 ý trên')
SET IDENTITY_INSERT [dbo].[questionforexam] OFF
GO
SET IDENTITY_INSERT [dbo].[roles] ON 

INSERT [dbo].[roles] ([id], [name]) VALUES (1, N'ROLE_ADMIN')
INSERT [dbo].[roles] ([id], [name]) VALUES (2, N'ROLE_USER')
SET IDENTITY_INSERT [dbo].[roles] OFF
GO
INSERT [dbo].[userrole] ([username], [roleid]) VALUES (N'tam', 1)
INSERT [dbo].[userrole] ([username], [roleid]) VALUES (N'tam123@gmail.com', 2)
INSERT [dbo].[userrole] ([username], [roleid]) VALUES (N'tamle011998@gmail.com', 2)
INSERT [dbo].[userrole] ([username], [roleid]) VALUES (N'admin@gmail.com', 1)
GO
SET IDENTITY_INSERT [dbo].[users] ON 

INSERT [dbo].[users] ([id], [nameofparent], [nameofstudent], [username], [email], [phone], [password], [avatar], [status]) VALUES (1, N'Nguyễn Văn A', N'Nguyễn Văn B', N'tam', N'marman0@seattletimes.com', N'7947664997', N'$2a$12$FqtLkV19blX8zRZ.YGUuZ.jiLGvuZ.nUOkCf2Rid702Cdj.Tz.j/.', N'https://robohash.org/quiaquidemquo.png?size=50x50&set=set1', N'on')
INSERT [dbo].[users] ([id], [nameofparent], [nameofstudent], [username], [email], [phone], [password], [avatar], [status]) VALUES (11, N'Nguyễn Văn Anh', N'Lê Thanh Tâm', N'tamle011998@gmail.com', N'tamle011998@gmail.com', N'09013123123', N'$2a$12$FqtLkV19blX8zRZ.YGUuZ.jiLGvuZ.nUOkCf2Rid702Cdj.Tz.j/.', N'https://firebasestorage.googleapis.com/v0/b/storageimage-633d3.appspot.com/o/images%2Fpexels-anna-tarazevich-8152002.jpg42b6a3b3-f8c1-43de-8dda-e7d18f95ed79?alt=media&token=61aedee6-7c9a-42de-90d9-182863430789', N'on')
INSERT [dbo].[users] ([id], [nameofparent], [nameofstudent], [username], [email], [phone], [password], [avatar], [status]) VALUES (19, N'tamle', N'tam', N'admin@gmail.com', N'admin@gmail.com', N'123123123', N'$2a$2a$12$FqtLkV19blX8zRZ.YGUuZ.jiLGvuZ.nUOkCf2Rid702Cdj.Tz.j/.', N'https://robohash.org/laudantiumliberobeatae.png?size=50x50&set=set1', N'on')
INSERT [dbo].[users] ([id], [nameofparent], [nameofstudent], [username], [email], [phone], [password], [avatar], [status]) VALUES (32, N'Nguyễn Văn Anh', N'Lê Thanh Tâm', N'tam123@gmail.com', N'tam123@gmail.com', N'09013123155', N'$2a$10$sbxLovuxDXiOTn0PRQiZi.UKs9aYN5OJdvqWrIXpyMsNBBAo/z3ka', N'https://firebasestorage.googleapis.com/v0/b/storageimage-633d3.appspot.com/o/images%2Fpexels-abdulwahab-alawadhi-6379842.jpg3213b67b-904e-4753-83fb-b0c52e874f0c?alt=media&token=cec2ef93-7870-4031-be19-a314a4129f18', N'on')
SET IDENTITY_INSERT [dbo].[users] OFF
GO
SET IDENTITY_INSERT [dbo].[vip] ON 

INSERT [dbo].[vip] ([id], [name], [price], [duration], [status]) VALUES (1, N'NORMAL', 0.0000, 0, N'on')
INSERT [dbo].[vip] ([id], [name], [price], [duration], [status]) VALUES (2, N'VIP1', 50000.0000, 1, N'on')
INSERT [dbo].[vip] ([id], [name], [price], [duration], [status]) VALUES (3, N'VIP2', 150000.0000, 3, N'on')
INSERT [dbo].[vip] ([id], [name], [price], [duration], [status]) VALUES (4, N'VIP3', 300000.0000, 6, N'on')
INSERT [dbo].[vip] ([id], [name], [price], [duration], [status]) VALUES (5, N'VIP4', 600000.0000, 12, N'on')
SET IDENTITY_INSERT [dbo].[vip] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__question__9B37299593A2A315]    Script Date: 6/1/2023 3:08:17 PM ******/
ALTER TABLE [dbo].[question] ADD UNIQUE NONCLUSTERED 
(
	[content] ASC,
	[trueAnswer] ASC,
	[falseAnswer] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UK_r43af9ap4edm43mmtq01oddj6]    Script Date: 6/1/2023 3:08:17 PM ******/
ALTER TABLE [dbo].[users] ADD  CONSTRAINT [UK_r43af9ap4edm43mmtq01oddj6] UNIQUE NONCLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__users__AB6E616449FF2A85]    Script Date: 6/1/2023 3:08:17 PM ******/
ALTER TABLE [dbo].[users] ADD UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__users__B43B145FE606B831]    Script Date: 6/1/2023 3:08:17 PM ******/
ALTER TABLE [dbo].[users] ADD UNIQUE NONCLUSTERED 
(
	[phone] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__users__F3DBC572D7F4EE3D]    Script Date: 6/1/2023 3:08:17 PM ******/
ALTER TABLE [dbo].[users] ADD UNIQUE NONCLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[course] ADD  DEFAULT ('on') FOR [status]
GO
ALTER TABLE [dbo].[question] ADD  DEFAULT ('on') FOR [status]
GO
ALTER TABLE [dbo].[users] ADD  DEFAULT ('on') FOR [status]
GO
ALTER TABLE [dbo].[vip] ADD  DEFAULT ('on') FOR [status]
GO
ALTER TABLE [dbo].[course]  WITH CHECK ADD  CONSTRAINT [fk_class_course] FOREIGN KEY([classid])
REFERENCES [dbo].[classes] ([id])
GO
ALTER TABLE [dbo].[course] CHECK CONSTRAINT [fk_class_course]
GO
ALTER TABLE [dbo].[course]  WITH CHECK ADD  CONSTRAINT [fk_course_category] FOREIGN KEY([categoryid])
REFERENCES [dbo].[category] ([id])
GO
ALTER TABLE [dbo].[course] CHECK CONSTRAINT [fk_course_category]
GO
ALTER TABLE [dbo].[exam]  WITH CHECK ADD  CONSTRAINT [fk_exam_user] FOREIGN KEY([userid])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[exam] CHECK CONSTRAINT [fk_exam_user]
GO
ALTER TABLE [dbo].[purchaseVIP]  WITH CHECK ADD  CONSTRAINT [fk_purchase_user] FOREIGN KEY([userid])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[purchaseVIP] CHECK CONSTRAINT [fk_purchase_user]
GO
ALTER TABLE [dbo].[purchaseVIP]  WITH CHECK ADD  CONSTRAINT [fk_vip_purchase] FOREIGN KEY([vipid])
REFERENCES [dbo].[vip] ([id])
GO
ALTER TABLE [dbo].[purchaseVIP] CHECK CONSTRAINT [fk_vip_purchase]
GO
ALTER TABLE [dbo].[question]  WITH CHECK ADD  CONSTRAINT [fk_question_course] FOREIGN KEY([courseid])
REFERENCES [dbo].[course] ([id])
GO
ALTER TABLE [dbo].[question] CHECK CONSTRAINT [fk_question_course]
GO
ALTER TABLE [dbo].[questionforexam]  WITH CHECK ADD  CONSTRAINT [fk_question_detail] FOREIGN KEY([questionid])
REFERENCES [dbo].[question] ([id])
GO
ALTER TABLE [dbo].[questionforexam] CHECK CONSTRAINT [fk_question_detail]
GO
ALTER TABLE [dbo].[questionforexam]  WITH CHECK ADD  CONSTRAINT [fk_question_exam] FOREIGN KEY([examid])
REFERENCES [dbo].[exam] ([id])
GO
ALTER TABLE [dbo].[questionforexam] CHECK CONSTRAINT [fk_question_exam]
GO
ALTER TABLE [dbo].[userrole]  WITH CHECK ADD  CONSTRAINT [fk_role_user] FOREIGN KEY([roleid])
REFERENCES [dbo].[roles] ([id])
GO
ALTER TABLE [dbo].[userrole] CHECK CONSTRAINT [fk_role_user]
GO
ALTER TABLE [dbo].[userrole]  WITH CHECK ADD  CONSTRAINT [fk_user_role] FOREIGN KEY([username])
REFERENCES [dbo].[users] ([username])
GO
ALTER TABLE [dbo].[userrole] CHECK CONSTRAINT [fk_user_role]
GO
USE [master]
GO
ALTER DATABASE [quiz] SET  READ_WRITE 
GO
