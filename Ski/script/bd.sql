USE [master]
GO
/****** Object:  Database [Sky]    Script Date: 17.06.2024 21:59:17 ******/
CREATE DATABASE [Sky]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Sky', FILENAME = N'D:\БД\файлы\Sky.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Sky_log', FILENAME = N'D:\БД\файлы\Sky_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Sky] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Sky].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Sky] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Sky] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Sky] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Sky] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Sky] SET ARITHABORT OFF 
GO
ALTER DATABASE [Sky] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Sky] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Sky] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Sky] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Sky] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Sky] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Sky] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Sky] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Sky] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Sky] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Sky] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Sky] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Sky] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Sky] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Sky] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Sky] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Sky] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Sky] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Sky] SET  MULTI_USER 
GO
ALTER DATABASE [Sky] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Sky] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Sky] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Sky] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Sky] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Sky] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Sky] SET QUERY_STORE = OFF
GO
USE [Sky]
GO
/****** Object:  Table [dbo].[Clients]    Script Date: 17.06.2024 21:59:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clients](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FIO] [nvarchar](50) NOT NULL,
	[Passport] [int] NOT NULL,
	[Birthday] [date] NOT NULL,
	[Adress] [nvarchar](100) NOT NULL,
	[Phone] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Clients] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 17.06.2024 21:59:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [int] NOT NULL,
	[FIO] [nvarchar](50) NOT NULL,
	[Login] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](15) NOT NULL,
	[Img] [nvarchar](max) NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Equipment]    Script Date: 17.06.2024 21:59:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Equipment](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[TypeId] [int] NULL,
	[Count] [int] NULL,
	[PriceForHour] [int] NOT NULL,
 CONSTRAINT [PK_service] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HisroryOrders]    Script Date: 17.06.2024 21:59:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HisroryOrders](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[EquipmentId] [int] NOT NULL,
	[OrderId] [int] NOT NULL,
	[Count] [int] NOT NULL,
	[Summ] [int] NOT NULL,
 CONSTRAINT [PK_HisroryOrders] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 17.06.2024 21:59:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Date] [datetime] NOT NULL,
	[ClientId] [int] NOT NULL,
	[StatusId] [int] NOT NULL,
	[HowHours] [int] NOT NULL,
	[DateClose] [datetime] NULL,
	[EmployeeId] [int] NULL,
	[Sum] [int] NULL,
	[Shtraf] [int] NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 17.06.2024 21:59:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[Id] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Status]    Script Date: 17.06.2024 21:59:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Status](
	[Id] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Status] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TypeEquipment]    Script Date: 17.06.2024 21:59:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TypeEquipment](
	[Id] [int] NOT NULL,
	[Name] [nchar](30) NOT NULL,
 CONSTRAINT [PK_TypeEquipment] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Clients] ON 

INSERT [dbo].[Clients] ([Id], [FIO], [Passport], [Birthday], [Adress], [Phone]) VALUES (1, N'Фролов Андрей Иванович', 1180, CAST(N'2001-07-14' AS Date), N'344288, г. Казань, ул. Чехова, 1, кв. 34', N'+777777')
INSERT [dbo].[Clients] ([Id], [FIO], [Passport], [Birthday], [Adress], [Phone]) VALUES (2, N'Николаев Даниил Всеволодович', 2280, CAST(N'2001-02-10' AS Date), N'614164, г. Казань, ул. Степная, 30, кв. 75', N'+7963')
INSERT [dbo].[Clients] ([Id], [FIO], [Passport], [Birthday], [Adress], [Phone]) VALUES (3, N'Снегирев Макар Иванович', 4560, CAST(N'1998-05-21' AS Date), N'394242, г. Казань, ул. Коммунистическая, 43, кв. 57', N'+85569')
INSERT [dbo].[Clients] ([Id], [FIO], [Passport], [Birthday], [Adress], [Phone]) VALUES (4, N'Иванов Иван Ильич', 9120, CAST(N'1998-10-01' AS Date), N'660540, г. Казань, ул. Солнечная, 25, кв. 78', N'+8888')
INSERT [dbo].[Clients] ([Id], [FIO], [Passport], [Birthday], [Adress], [Phone]) VALUES (5, N'Филиппова Анна Глебовна', 2367, CAST(N'1976-05-31' AS Date), N'125837, г. Казань, ул. Шоссейная, 40, кв. 92', N'+85258')
INSERT [dbo].[Clients] ([Id], [FIO], [Passport], [Birthday], [Adress], [Phone]) VALUES (6, N'Иванов Михаил Владимирович', 7101, CAST(N'1985-11-04' AS Date), N'125703, г. Казань, ул. Партизанская, 49, кв. 84', N'+7412')
INSERT [dbo].[Clients] ([Id], [FIO], [Passport], [Birthday], [Adress], [Phone]) VALUES (7, N'Власов Дмитрий Александрович', 3455, CAST(N'1998-08-17' AS Date), N'625283, г. Казань, ул. Победы, 46, кв. 7', N'+7945612')
INSERT [dbo].[Clients] ([Id], [FIO], [Passport], [Birthday], [Adress], [Phone]) VALUES (8, N'Серова Екатерина Львовна', 2377, CAST(N'1984-10-24' AS Date), N'614611, г. Казань, ул. Молодежная, 50, кв. 78', N'+78945')
INSERT [dbo].[Clients] ([Id], [FIO], [Passport], [Birthday], [Adress], [Phone]) VALUES (9, N'Борисова Ирина Ивановна', 8755, CAST(N'1976-10-14' AS Date), N'454311, г. Казань, ул. Новая, 19, кв. 78', N'+789652')
INSERT [dbo].[Clients] ([Id], [FIO], [Passport], [Birthday], [Adress], [Phone]) VALUES (10, N'Зайцев Никита Артёмович', 4355, CAST(N'1999-10-14' AS Date), N'660007, г. Казань, ул. Октябрьская, 19, кв. 42', N'+794')
INSERT [dbo].[Clients] ([Id], [FIO], [Passport], [Birthday], [Adress], [Phone]) VALUES (11, N'Медведев Святослав Евгеньевич', 2791, CAST(N'1985-07-13' AS Date), N'603036, г. Казань, ул. Садовая, 4, кв. 13', N'+78954523')
INSERT [dbo].[Clients] ([Id], [FIO], [Passport], [Birthday], [Adress], [Phone]) VALUES (12, N'Коротков Кирилл Алексеевич', 5582, CAST(N'1976-05-26' AS Date), N'450983, г. Казань, ул. Комсомольская, 26, кв. 60', N'+7896512')
INSERT [dbo].[Clients] ([Id], [FIO], [Passport], [Birthday], [Adress], [Phone]) VALUES (13, N'Калашникова Арина Максимовна', 2978, CAST(N'1999-08-13' AS Date), N'394782, г. Казань, ул. Чехова, 3, кв. 14', N'+786523')
INSERT [dbo].[Clients] ([Id], [FIO], [Passport], [Birthday], [Adress], [Phone]) VALUES (14, N'Минина Таисия Кирилловна', 7512, CAST(N'1985-10-13' AS Date), N'603002, г. Казань, ул. Дзержинского, 28, кв. 56', N'+41523')
INSERT [dbo].[Clients] ([Id], [FIO], [Passport], [Birthday], [Adress], [Phone]) VALUES (15, N'Наумов Серафим Романович', 5046, CAST(N'1999-04-15' AS Date), N'450558, г. Казань, ул. Набережная, 30, кв. 71', N'+794562')
INSERT [dbo].[Clients] ([Id], [FIO], [Passport], [Birthday], [Adress], [Phone]) VALUES (16, N'Воробьева Василиса Евгеньевна', 2460, CAST(N'1999-01-13' AS Date), N'394060, г. Казань, ул. Фрунзе, 43, кв. 79', N'+8552069620')
INSERT [dbo].[Clients] ([Id], [FIO], [Passport], [Birthday], [Adress], [Phone]) VALUES (17, N'Калинин Александр Андреевич', 3412, CAST(N'1999-01-07' AS Date), N'410661, г. Казань, ул. Школьная, 50, кв. 53', N'+0000')
INSERT [dbo].[Clients] ([Id], [FIO], [Passport], [Birthday], [Adress], [Phone]) VALUES (18, N'Кузнецова Милана Владиславовна', 4950, CAST(N'1999-01-24' AS Date), N'625590, г. Казань, ул. Коммунистическая, 20, кв. 34', N'+7496520000')
INSERT [dbo].[Clients] ([Id], [FIO], [Passport], [Birthday], [Adress], [Phone]) VALUES (22, N'Иванченко Семен', 7412055, CAST(N'2001-10-10' AS Date), N'Москва', N'+7418227')
SET IDENTITY_INSERT [dbo].[Clients] OFF
GO
SET IDENTITY_INSERT [dbo].[Employee] ON 

INSERT [dbo].[Employee] ([Id], [RoleId], [FIO], [Login], [Password], [Img]) VALUES (101, 3, N'Иванов Иван Иванович', N'Ivanov@namecomp.ru', N'2L6KZG', N'C:\Users\люба\Downloads\SkiEquipmentRental\Фото_сотрудников\Иванов.jpeg')
INSERT [dbo].[Employee] ([Id], [RoleId], [FIO], [Login], [Password], [Img]) VALUES (102, 3, N'Петров Петр Петрович', N'petrov@namecomp.ru', N'uzWC67', N'C:\Users\люба\Downloads\SkiEquipmentRental\Фото_сотрудников\Петров.jpeg')
INSERT [dbo].[Employee] ([Id], [RoleId], [FIO], [Login], [Password], [Img]) VALUES (103, 1, N'Федоров Федор Федорович', N'fedorov@namecomp.ru', N'8ntwUp', N'C:\Users\люба\Downloads\SkiEquipmentRental\Фото_сотрудников\Федоров.jpeg')
INSERT [dbo].[Employee] ([Id], [RoleId], [FIO], [Login], [Password], [Img]) VALUES (105, 2, N'Ширяев Ермолай Вениаминович', N'shiryev@namecomp.ru', N'RSbvHv', N'C:\Users\люба\Downloads\SkiEquipmentRental\Фото_сотрудников\Ширяев.jpeg')
INSERT [dbo].[Employee] ([Id], [RoleId], [FIO], [Login], [Password], [Img]) VALUES (106, 2, N'Игнатов Кассиан Васильевич', N'ignatov@namecomp.ru', N'rwVDh9', N'C:\Users\люба\Downloads\SkiEquipmentRental\Фото_сотрудников\Игнатов.jpg')
INSERT [dbo].[Employee] ([Id], [RoleId], [FIO], [Login], [Password], [Img]) VALUES (107, 3, N'Хохлов Владимир Мэлсович', N'hohlov@namecomp.ru', N'LdNyos', N'C:\Users\люба\Downloads\SkiEquipmentRental\Фото_сотрудников\Хохлов.jpeg')
INSERT [dbo].[Employee] ([Id], [RoleId], [FIO], [Login], [Password], [Img]) VALUES (108, 3, N'Стрелков Мстислав Георгьевич', N'strelkov@namecomp.ru', N'gynQMT', N'C:\Users\люба\Downloads\SkiEquipmentRental\Фото_сотрудников\Стрелков.jpeg')
INSERT [dbo].[Employee] ([Id], [RoleId], [FIO], [Login], [Password], [Img]) VALUES (109, 3, N'Беляева Лилия Наумовна', N'belyeva@@namecomp.ru', N'AtnDjr', N'C:\Users\люба\Downloads\SkiEquipmentRental\Фото_сотрудников\Беляева.jpeg')
INSERT [dbo].[Employee] ([Id], [RoleId], [FIO], [Login], [Password], [Img]) VALUES (110, 2, N'Смирнова Ульяна Гордеевна', N'smirnova@@namecomp.ru', N'JlFRCZ', N'C:\Users\люба\Downloads\SkiEquipmentRental\Фото_сотрудников\Смирнова.jpeg')
SET IDENTITY_INSERT [dbo].[Employee] OFF
GO
SET IDENTITY_INSERT [dbo].[Equipment] ON 

INSERT [dbo].[Equipment] ([Id], [Name], [TypeId], [Count], [PriceForHour]) VALUES (1, N'Лыжи', 2, 15, 800)
INSERT [dbo].[Equipment] ([Id], [Name], [TypeId], [Count], [PriceForHour]) VALUES (2, N'Лыжные палки
', 2, 8, 100)
INSERT [dbo].[Equipment] ([Id], [Name], [TypeId], [Count], [PriceForHour]) VALUES (3, N'Сноуборд', 2, 12, 1500)
INSERT [dbo].[Equipment] ([Id], [Name], [TypeId], [Count], [PriceForHour]) VALUES (4, N'Обувь для сноуборда
', 1, 5, 400)
INSERT [dbo].[Equipment] ([Id], [Name], [TypeId], [Count], [PriceForHour]) VALUES (5, N'Шлем', 3, 7, 500)
INSERT [dbo].[Equipment] ([Id], [Name], [TypeId], [Count], [PriceForHour]) VALUES (7, N'Лыжи детские', 2, 7, 800)
INSERT [dbo].[Equipment] ([Id], [Name], [TypeId], [Count], [PriceForHour]) VALUES (8, N'Обувь для лыж детские', 1, 8, 500)
INSERT [dbo].[Equipment] ([Id], [Name], [TypeId], [Count], [PriceForHour]) VALUES (9, N'Куртка взрослая', 1, 9, 1300)
INSERT [dbo].[Equipment] ([Id], [Name], [TypeId], [Count], [PriceForHour]) VALUES (10, N'Штаны взрослые', 1, 8, 1300)
INSERT [dbo].[Equipment] ([Id], [Name], [TypeId], [Count], [PriceForHour]) VALUES (11, N'Пуховый свитер', 1, 5, 900)
INSERT [dbo].[Equipment] ([Id], [Name], [TypeId], [Count], [PriceForHour]) VALUES (12, N'Носки', 1, 5, 50)
INSERT [dbo].[Equipment] ([Id], [Name], [TypeId], [Count], [PriceForHour]) VALUES (13, N'Перчатки', 1, 42, 50)
INSERT [dbo].[Equipment] ([Id], [Name], [TypeId], [Count], [PriceForHour]) VALUES (14, N'Шапка', 1, 5, 100)
INSERT [dbo].[Equipment] ([Id], [Name], [TypeId], [Count], [PriceForHour]) VALUES (15, N'Маска', 3, 8, 200)
INSERT [dbo].[Equipment] ([Id], [Name], [TypeId], [Count], [PriceForHour]) VALUES (16, N'Защита', 3, 9, 300)
INSERT [dbo].[Equipment] ([Id], [Name], [TypeId], [Count], [PriceForHour]) VALUES (17, N'Чехол для лыж', 2, 7, 300)
INSERT [dbo].[Equipment] ([Id], [Name], [TypeId], [Count], [PriceForHour]) VALUES (18, N'Чехол для сноуборда', 2, 4, 300)
INSERT [dbo].[Equipment] ([Id], [Name], [TypeId], [Count], [PriceForHour]) VALUES (20, N'Куртка детская', 1, 4, 700)
INSERT [dbo].[Equipment] ([Id], [Name], [TypeId], [Count], [PriceForHour]) VALUES (21, N'Штаны детские', 1, 6, 500)
INSERT [dbo].[Equipment] ([Id], [Name], [TypeId], [Count], [PriceForHour]) VALUES (22, N'Крепления для лыж', 3, 5, 600)
INSERT [dbo].[Equipment] ([Id], [Name], [TypeId], [Count], [PriceForHour]) VALUES (23, N'Крепления для сноуборда', 3, 4, 600)
INSERT [dbo].[Equipment] ([Id], [Name], [TypeId], [Count], [PriceForHour]) VALUES (24, N'Сноуборд детский', 2, 7, 1000)
SET IDENTITY_INSERT [dbo].[Equipment] OFF
GO
SET IDENTITY_INSERT [dbo].[HisroryOrders] ON 

INSERT [dbo].[HisroryOrders] ([Id], [EquipmentId], [OrderId], [Count], [Summ]) VALUES (1, 1, 6, 1, 800)
INSERT [dbo].[HisroryOrders] ([Id], [EquipmentId], [OrderId], [Count], [Summ]) VALUES (2, 2, 7, 1, 100)
INSERT [dbo].[HisroryOrders] ([Id], [EquipmentId], [OrderId], [Count], [Summ]) VALUES (6, 3, 8, 1, 1500)
INSERT [dbo].[HisroryOrders] ([Id], [EquipmentId], [OrderId], [Count], [Summ]) VALUES (14, 9, 10, 1, 1300)
INSERT [dbo].[HisroryOrders] ([Id], [EquipmentId], [OrderId], [Count], [Summ]) VALUES (15, 21, 10, 2, 2600)
INSERT [dbo].[HisroryOrders] ([Id], [EquipmentId], [OrderId], [Count], [Summ]) VALUES (16, 10, 10, 1, 1300)
INSERT [dbo].[HisroryOrders] ([Id], [EquipmentId], [OrderId], [Count], [Summ]) VALUES (17, 9, 10, 1, 1300)
INSERT [dbo].[HisroryOrders] ([Id], [EquipmentId], [OrderId], [Count], [Summ]) VALUES (18, 9, 11, 1, 1300)
INSERT [dbo].[HisroryOrders] ([Id], [EquipmentId], [OrderId], [Count], [Summ]) VALUES (19, 2, 13, 1, 100)
INSERT [dbo].[HisroryOrders] ([Id], [EquipmentId], [OrderId], [Count], [Summ]) VALUES (20, 7, 13, 1, 800)
INSERT [dbo].[HisroryOrders] ([Id], [EquipmentId], [OrderId], [Count], [Summ]) VALUES (21, 15, 13, 1, 200)
INSERT [dbo].[HisroryOrders] ([Id], [EquipmentId], [OrderId], [Count], [Summ]) VALUES (22, 3, 14, 1, 1500)
INSERT [dbo].[HisroryOrders] ([Id], [EquipmentId], [OrderId], [Count], [Summ]) VALUES (23, 16, 15, 1, 300)
INSERT [dbo].[HisroryOrders] ([Id], [EquipmentId], [OrderId], [Count], [Summ]) VALUES (24, 3, 16, 1, 1500)
INSERT [dbo].[HisroryOrders] ([Id], [EquipmentId], [OrderId], [Count], [Summ]) VALUES (25, 4, 17, 2, 800)
INSERT [dbo].[HisroryOrders] ([Id], [EquipmentId], [OrderId], [Count], [Summ]) VALUES (26, 1, 18, 1, 800)
INSERT [dbo].[HisroryOrders] ([Id], [EquipmentId], [OrderId], [Count], [Summ]) VALUES (27, 9, 18, 1, 1300)
INSERT [dbo].[HisroryOrders] ([Id], [EquipmentId], [OrderId], [Count], [Summ]) VALUES (28, 23, 20, 1, 600)
INSERT [dbo].[HisroryOrders] ([Id], [EquipmentId], [OrderId], [Count], [Summ]) VALUES (29, 3, 21, 1, 1500)
INSERT [dbo].[HisroryOrders] ([Id], [EquipmentId], [OrderId], [Count], [Summ]) VALUES (30, 9, 22, 1, 1300)
INSERT [dbo].[HisroryOrders] ([Id], [EquipmentId], [OrderId], [Count], [Summ]) VALUES (31, 15, 23, 1, 200)
INSERT [dbo].[HisroryOrders] ([Id], [EquipmentId], [OrderId], [Count], [Summ]) VALUES (32, 18, 23, 2, 600)
INSERT [dbo].[HisroryOrders] ([Id], [EquipmentId], [OrderId], [Count], [Summ]) VALUES (2017, 20, 24, 1, 700)
SET IDENTITY_INSERT [dbo].[HisroryOrders] OFF
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([id], [Date], [ClientId], [StatusId], [HowHours], [DateClose], [EmployeeId], [Sum], [Shtraf]) VALUES (6, CAST(N'2023-01-01T00:00:00.000' AS DateTime), 1, 3, 5, CAST(N'2023-01-01T00:00:00.000' AS DateTime), 101, 4500, 0)
INSERT [dbo].[Orders] ([id], [Date], [ClientId], [StatusId], [HowHours], [DateClose], [EmployeeId], [Sum], [Shtraf]) VALUES (7, CAST(N'2023-07-09T00:00:00.000' AS DateTime), 2, 3, 3, CAST(N'2023-07-09T00:00:00.000' AS DateTime), 102, 100, 0)
INSERT [dbo].[Orders] ([id], [Date], [ClientId], [StatusId], [HowHours], [DateClose], [EmployeeId], [Sum], [Shtraf]) VALUES (8, CAST(N'2023-09-18T00:00:00.000' AS DateTime), 3, 3, 2, CAST(N'2023-10-18T00:00:00.000' AS DateTime), 102, 1500, 1000)
INSERT [dbo].[Orders] ([id], [Date], [ClientId], [StatusId], [HowHours], [DateClose], [EmployeeId], [Sum], [Shtraf]) VALUES (10, CAST(N'2024-05-02T09:12:00.000' AS DateTime), 6, 3, 1, CAST(N'2024-05-02T12:12:00.000' AS DateTime), 101, 7500, 0)
INSERT [dbo].[Orders] ([id], [Date], [ClientId], [StatusId], [HowHours], [DateClose], [EmployeeId], [Sum], [Shtraf]) VALUES (11, CAST(N'2024-05-02T12:12:00.000' AS DateTime), 3, 4, 1, CAST(N'2024-05-02T12:12:00.000' AS DateTime), 101, 3300, 1000)
INSERT [dbo].[Orders] ([id], [Date], [ClientId], [StatusId], [HowHours], [DateClose], [EmployeeId], [Sum], [Shtraf]) VALUES (12, CAST(N'2024-05-02T07:12:00.000' AS DateTime), 5, 3, 1, CAST(N'2024-05-03T15:58:14.857' AS DateTime), 101, 1000, 0)
INSERT [dbo].[Orders] ([id], [Date], [ClientId], [StatusId], [HowHours], [DateClose], [EmployeeId], [Sum], [Shtraf]) VALUES (13, CAST(N'2024-05-03T15:58:23.477' AS DateTime), 7, 3, 10, CAST(N'2024-06-17T21:52:37.123' AS DateTime), 110, 12000, 1000)
INSERT [dbo].[Orders] ([id], [Date], [ClientId], [StatusId], [HowHours], [DateClose], [EmployeeId], [Sum], [Shtraf]) VALUES (14, CAST(N'2024-05-03T16:11:33.813' AS DateTime), 22, 3, 2, CAST(N'2024-06-17T21:52:14.700' AS DateTime), 108, 4000, 1000)
INSERT [dbo].[Orders] ([id], [Date], [ClientId], [StatusId], [HowHours], [DateClose], [EmployeeId], [Sum], [Shtraf]) VALUES (15, CAST(N'2024-05-03T16:16:25.750' AS DateTime), 2, 4, 2, CAST(N'2024-05-03T16:17:31.860' AS DateTime), 107, 1600, 1000)
INSERT [dbo].[Orders] ([id], [Date], [ClientId], [StatusId], [HowHours], [DateClose], [EmployeeId], [Sum], [Shtraf]) VALUES (16, CAST(N'2024-05-03T20:12:56.200' AS DateTime), 3, 3, 1, CAST(N'2024-06-17T21:52:18.273' AS DateTime), 109, 2500, 1000)
INSERT [dbo].[Orders] ([id], [Date], [ClientId], [StatusId], [HowHours], [DateClose], [EmployeeId], [Sum], [Shtraf]) VALUES (17, CAST(N'2024-05-15T12:16:45.627' AS DateTime), 7, 3, 5, CAST(N'2024-06-17T21:52:21.900' AS DateTime), 105, 5000, 1000)
INSERT [dbo].[Orders] ([id], [Date], [ClientId], [StatusId], [HowHours], [DateClose], [EmployeeId], [Sum], [Shtraf]) VALUES (18, CAST(N'2024-05-15T17:27:12.390' AS DateTime), 1, 3, 1, CAST(N'2024-06-17T21:52:28.037' AS DateTime), 105, 3100, 0)
INSERT [dbo].[Orders] ([id], [Date], [ClientId], [StatusId], [HowHours], [DateClose], [EmployeeId], [Sum], [Shtraf]) VALUES (19, CAST(N'2024-05-15T17:34:18.003' AS DateTime), 9, 3, 2, CAST(N'2024-06-17T21:31:26.817' AS DateTime), 105, 1000, 0)
INSERT [dbo].[Orders] ([id], [Date], [ClientId], [StatusId], [HowHours], [DateClose], [EmployeeId], [Sum], [Shtraf]) VALUES (20, CAST(N'2024-05-15T17:45:57.233' AS DateTime), 10, 3, 1, CAST(N'2024-06-17T21:31:35.140' AS DateTime), 107, 1600, 0)
INSERT [dbo].[Orders] ([id], [Date], [ClientId], [StatusId], [HowHours], [DateClose], [EmployeeId], [Sum], [Shtraf]) VALUES (21, CAST(N'2024-05-15T17:50:35.977' AS DateTime), 22, 3, 1, CAST(N'2024-05-15T17:56:23.777' AS DateTime), 107, 1500, 0)
INSERT [dbo].[Orders] ([id], [Date], [ClientId], [StatusId], [HowHours], [DateClose], [EmployeeId], [Sum], [Shtraf]) VALUES (22, CAST(N'2024-05-15T18:00:02.633' AS DateTime), 9, 3, 1, CAST(N'2024-05-15T18:00:19.527' AS DateTime), 106, 1300, 0)
INSERT [dbo].[Orders] ([id], [Date], [ClientId], [StatusId], [HowHours], [DateClose], [EmployeeId], [Sum], [Shtraf]) VALUES (23, CAST(N'2024-05-21T10:00:33.533' AS DateTime), 12, 3, 5, CAST(N'2024-05-21T10:01:51.203' AS DateTime), 105, 4000, 0)
INSERT [dbo].[Orders] ([id], [Date], [ClientId], [StatusId], [HowHours], [DateClose], [EmployeeId], [Sum], [Shtraf]) VALUES (24, CAST(N'2024-06-17T21:54:45.723' AS DateTime), 3, 3, 1, CAST(N'2024-06-17T21:55:17.750' AS DateTime), 105, 700, 0)
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
INSERT [dbo].[Role] ([Id], [Name]) VALUES (1, N'Администратор')
INSERT [dbo].[Role] ([Id], [Name]) VALUES (2, N'Старший смены')
INSERT [dbo].[Role] ([Id], [Name]) VALUES (3, N'Продавец')
GO
INSERT [dbo].[Status] ([Id], [Name]) VALUES (1, N'Новая')
INSERT [dbo].[Status] ([Id], [Name]) VALUES (2, N'В прокате')
INSERT [dbo].[Status] ([Id], [Name]) VALUES (3, N'Закрыта')
INSERT [dbo].[Status] ([Id], [Name]) VALUES (4, N'Просрочена')
GO
INSERT [dbo].[TypeEquipment] ([Id], [Name]) VALUES (1, N'Одежда                        ')
INSERT [dbo].[TypeEquipment] ([Id], [Name]) VALUES (2, N'Инвентарь                     ')
INSERT [dbo].[TypeEquipment] ([Id], [Name]) VALUES (3, N'Защита                        ')
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_Role1] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Role] ([Id])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_Role1]
GO
ALTER TABLE [dbo].[Equipment]  WITH CHECK ADD  CONSTRAINT [FK_Equipment_TypeEquipment] FOREIGN KEY([TypeId])
REFERENCES [dbo].[TypeEquipment] ([Id])
GO
ALTER TABLE [dbo].[Equipment] CHECK CONSTRAINT [FK_Equipment_TypeEquipment]
GO
ALTER TABLE [dbo].[HisroryOrders]  WITH CHECK ADD  CONSTRAINT [FK_HisroryOrders_Equipment] FOREIGN KEY([EquipmentId])
REFERENCES [dbo].[Equipment] ([Id])
GO
ALTER TABLE [dbo].[HisroryOrders] CHECK CONSTRAINT [FK_HisroryOrders_Equipment]
GO
ALTER TABLE [dbo].[HisroryOrders]  WITH CHECK ADD  CONSTRAINT [FK_HisroryOrders_Orders] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Orders] ([id])
GO
ALTER TABLE [dbo].[HisroryOrders] CHECK CONSTRAINT [FK_HisroryOrders_Orders]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Clients] FOREIGN KEY([ClientId])
REFERENCES [dbo].[Clients] ([Id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Clients]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Employee] FOREIGN KEY([EmployeeId])
REFERENCES [dbo].[Employee] ([Id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Employee]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Status] FOREIGN KEY([StatusId])
REFERENCES [dbo].[Status] ([Id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Status]
GO
USE [master]
GO
ALTER DATABASE [Sky] SET  READ_WRITE 
GO
