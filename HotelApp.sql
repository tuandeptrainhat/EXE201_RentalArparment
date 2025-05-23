USE [master]
GO
/****** Object:  Database [HotelApp]    Script Date: 5/22/2025 7:22:28 PM ******/
CREATE DATABASE [HotelApp]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'HotelApp', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\HotelApp.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'HotelApp_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\HotelApp_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [HotelApp] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [HotelApp].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [HotelApp] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [HotelApp] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [HotelApp] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [HotelApp] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [HotelApp] SET ARITHABORT OFF 
GO
ALTER DATABASE [HotelApp] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [HotelApp] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [HotelApp] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [HotelApp] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [HotelApp] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [HotelApp] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [HotelApp] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [HotelApp] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [HotelApp] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [HotelApp] SET  ENABLE_BROKER 
GO
ALTER DATABASE [HotelApp] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [HotelApp] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [HotelApp] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [HotelApp] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [HotelApp] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [HotelApp] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [HotelApp] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [HotelApp] SET RECOVERY FULL 
GO
ALTER DATABASE [HotelApp] SET  MULTI_USER 
GO
ALTER DATABASE [HotelApp] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [HotelApp] SET DB_CHAINING OFF 
GO
ALTER DATABASE [HotelApp] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [HotelApp] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [HotelApp] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [HotelApp] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [HotelApp] SET QUERY_STORE = OFF
GO
USE [HotelApp]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 5/22/2025 7:22:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Amenities]    Script Date: 5/22/2025 7:22:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Amenities](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](255) NULL,
 CONSTRAINT [PK_Amenities] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AmenityRoom]    Script Date: 5/22/2025 7:22:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AmenityRoom](
	[AmenitiesId] [int] NOT NULL,
	[RoomsId] [int] NOT NULL,
 CONSTRAINT [PK_AmenityRoom] PRIMARY KEY CLUSTERED 
(
	[AmenitiesId] ASC,
	[RoomsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Areas]    Script Date: 5/22/2025 7:22:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Areas](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Areas] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoleClaims]    Script Date: 5/22/2025 7:22:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoleClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoleClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 5/22/2025 7:22:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](256) NULL,
	[NormalizedName] [nvarchar](256) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 5/22/2025 7:22:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 5/22/2025 7:22:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](450) NOT NULL,
	[ProviderKey] [nvarchar](450) NOT NULL,
	[ProviderDisplayName] [nvarchar](max) NULL,
	[UserId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 5/22/2025 7:22:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](450) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 5/22/2025 7:22:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](450) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[FullName] [nvarchar](100) NULL,
	[Email] [nvarchar](256) NOT NULL,
	[PhoneNumber] [nvarchar](max) NOT NULL,
	[UserName] [nvarchar](256) NULL,
	[NormalizedUserName] [nvarchar](256) NULL,
	[NormalizedEmail] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEnd] [datetimeoffset](7) NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
	[Password] [nvarchar](max) NOT NULL,
	[AvatarUrl] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserTokens]    Script Date: 5/22/2025 7:22:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserTokens](
	[UserId] [nvarchar](450) NOT NULL,
	[LoginProvider] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](450) NOT NULL,
	[Value] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserTokens] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[LoginProvider] ASC,
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Bookings]    Script Date: 5/22/2025 7:22:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bookings](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [nvarchar](450) NOT NULL,
	[RoomID] [int] NOT NULL,
	[VoucherID] [int] NULL,
	[CheckIn] [datetime2](7) NOT NULL,
	[CheckOut] [datetime2](7) NOT NULL,
	[Status] [int] NOT NULL,
	[Price] [decimal](18, 2) NOT NULL,
	[Total] [decimal](18, 2) NOT NULL,
	[PayType] [int] NOT NULL,
	[UpdateAt] [datetime2](7) NULL,
	[CreateAt] [datetime2](7) NOT NULL,
	[Paid] [decimal](18, 2) NULL,
	[PaymentCode] [nvarchar](max) NULL,
 CONSTRAINT [PK_Bookings] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CCCDs]    Script Date: 5/22/2025 7:22:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CCCDs](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FrontImg] [nvarchar](max) NOT NULL,
	[BackImg] [nvarchar](max) NOT NULL,
	[BookingId] [int] NOT NULL,
 CONSTRAINT [PK_CCCDs] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Contacts]    Script Date: 5/22/2025 7:22:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contacts](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[Email] [nvarchar](max) NOT NULL,
	[PhoneNumber] [nvarchar](max) NOT NULL,
	[Message] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_Contacts] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Conversations]    Script Date: 5/22/2025 7:22:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Conversations](
	[Id] [nvarchar](450) NOT NULL,
	[CustomerId] [nvarchar](450) NOT NULL,
	[AdminId] [nvarchar](450) NULL,
	[StartDate] [datetime2](7) NOT NULL,
	[Status] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Conversations] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Images]    Script Date: 5/22/2025 7:22:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Images](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Path] [nvarchar](500) NOT NULL,
	[Caption] [nvarchar](50) NOT NULL,
	[RoomID] [int] NOT NULL,
 CONSTRAINT [PK_Images] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Messages]    Script Date: 5/22/2025 7:22:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Messages](
	[Id] [nvarchar](450) NOT NULL,
	[ConversationId] [nvarchar](450) NOT NULL,
	[SenderId] [nvarchar](450) NOT NULL,
	[Content] [nvarchar](max) NOT NULL,
	[Timestamp] [datetime2](7) NOT NULL,
	[IsRead] [bit] NOT NULL,
 CONSTRAINT [PK_Messages] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rooms]    Script Date: 5/22/2025 7:22:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rooms](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TypeId] [int] NOT NULL,
	[AreaId] [int] NOT NULL,
	[Price] [decimal](18, 2) NOT NULL,
	[Discount] [decimal](18, 2) NOT NULL,
	[Status] [int] NOT NULL,
	[Code] [nvarchar](max) NOT NULL,
	[PhuongXa] [nvarchar](max) NOT NULL,
	[QuanHuyen] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Rooms] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RoomTypes]    Script Date: 5/22/2025 7:22:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoomTypes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](255) NULL,
	[People] [int] NOT NULL,
	[ImagePath] [nvarchar](500) NOT NULL,
 CONSTRAINT [PK_RoomTypes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Vouchers]    Script Date: 5/22/2025 7:22:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vouchers](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Quantity] [int] NOT NULL,
	[Code] [nvarchar](50) NOT NULL,
	[Status] [int] NOT NULL,
	[Discount] [decimal](18, 2) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[ImagePath] [nvarchar](500) NOT NULL,
 CONSTRAINT [PK_Vouchers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20241104152116_Initial', N'8.0.10')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20241104154119_AddTableContact', N'8.0.10')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20241104175651_InitialIdentity', N'8.0.10')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20241104180401_UpdateDB', N'8.0.10')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20241117064553_UpdateIdentity', N'8.0.10')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20241117164006_AddRoleData', N'8.0.10')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20241118154105_AddDBForBookingFeature', N'8.0.10')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20241119035420_UpdateDBRoom', N'8.0.10')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20241127175238_UpdateBooking', N'8.0.10')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20241127193751_UpdateBooking2', N'8.0.10')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20241127211453_UpdateBooking3', N'8.0.10')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20241128113630_UpdateUser', N'8.0.10')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20241209151400_addRoomCode', N'8.0.10')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20241209214212_deleteBookingCCCD', N'8.0.10')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20241209214437_QuanHe1NChoBookingVaCCCD', N'8.0.10')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20250519162404_AddLocation', N'8.0.10')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20250522063758_AddChatDB', N'8.0.10')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20250522070659_CreateChatTables', N'8.0.10')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20250522075108_SeedDataRole', N'8.0.10')
GO
SET IDENTITY_INSERT [dbo].[Amenities] ON 

INSERT [dbo].[Amenities] ([Id], [Name], [Description]) VALUES (8, N'Wifi miễn phí', N'Kết nối internet tốc độ cao, miễn phí trong toàn bộ khuôn viên khách sạn và trong phòng.')
INSERT [dbo].[Amenities] ([Id], [Name], [Description]) VALUES (9, N'TV màn hình phẳng, truyền hình cáp', N'Đa dạng các kênh giải trí quốc tế và địa phương, giúp bạn thư giãn.')
INSERT [dbo].[Amenities] ([Id], [Name], [Description]) VALUES (10, N'Điều hòa không khí', N'Điều chỉnh nhiệt độ theo ý thích, đảm bảo không gian thoải mái.')
INSERT [dbo].[Amenities] ([Id], [Name], [Description]) VALUES (11, N'tủ lạnh mini', N'Lưu trữ đồ uống và thức ăn nhẹ, với các loại đồ uống có sẵn.')
INSERT [dbo].[Amenities] ([Id], [Name], [Description]) VALUES (12, N'Hồ bơi', N'Bể bơi sạch sẽ, có thể trong nhà hoặc ngoài trời, được trang bị ghế tắm nắng. Một số khách sạn còn có hồ bơi vô cực hoặc bể bơi trẻ em.')
INSERT [dbo].[Amenities] ([Id], [Name], [Description]) VALUES (13, N'Phòng gym, spa, xông hơi', N'Được trang bị máy tập hiện đại, các liệu trình massage thư giãn, hoặc phòng xông hơi với thảo dược.')
INSERT [dbo].[Amenities] ([Id], [Name], [Description]) VALUES (14, N'Nhà hàng, quán bar, café:', N'Cung cấp đa dạng thực đơn Á, Âu, đồ uống phong phú.')
INSERT [dbo].[Amenities] ([Id], [Name], [Description]) VALUES (15, N'Dịch vụ giặt là', N'Đáp ứng nhu cầu làm sạch quần áo nhanh chóng, với tùy chọn giao nhận tận phòng.')
INSERT [dbo].[Amenities] ([Id], [Name], [Description]) VALUES (16, N'Bãi đỗ xe', N'Có khu vực đỗ xe an toàn, miễn phí hoặc tính phí tùy khách sạn.')
INSERT [dbo].[Amenities] ([Id], [Name], [Description]) VALUES (17, N'Khu vực chơi trẻ em', N'Được thiết kế an toàn với đồ chơi và không gian phù hợp cho trẻ nhỏ.')
INSERT [dbo].[Amenities] ([Id], [Name], [Description]) VALUES (18, N'Không gian tổ chức sự kiện', N'Phòng họp hoặc phòng tiệc lớn được trang bị máy chiếu, âm thanh hiện đại.')
INSERT [dbo].[Amenities] ([Id], [Name], [Description]) VALUES (19, N'Chấp nhận thú cưng', N' Một số khách sạn cho phép mang theo thú cưng với các quy định cụ thể.')
INSERT [dbo].[Amenities] ([Id], [Name], [Description]) VALUES (20, N'Lễ tân 24/7', N'Luôn sẵn sàng hỗ trợ khách hàng mọi lúc, từ nhận phòng đến các yêu cầu khác.')
INSERT [dbo].[Amenities] ([Id], [Name], [Description]) VALUES (21, N'Phòng tắm riêng', N'Trang bị vòi sen hoặc bồn tắm, có khăn tắm và đồ dùng vệ sinh miễn phí.')
INSERT [dbo].[Amenities] ([Id], [Name], [Description]) VALUES (22, N'Máy sấy tóc', N'Tiện dụng, giúp khách chuẩn bị nhanh gọn mỗi sáng.')
INSERT [dbo].[Amenities] ([Id], [Name], [Description]) VALUES (23, N'Bàn làm việc', N'Phù hợp cho khách công tác hoặc cần không gian làm việc riêng tư.')
INSERT [dbo].[Amenities] ([Id], [Name], [Description]) VALUES (24, N'Máy pha trà/cà phê', N'Một số phòng có máy pha cà phê chuyên dụng hoặc ấm đun nước.')
SET IDENTITY_INSERT [dbo].[Amenities] OFF
GO
INSERT [dbo].[AmenityRoom] ([AmenitiesId], [RoomsId]) VALUES (8, 44)
INSERT [dbo].[AmenityRoom] ([AmenitiesId], [RoomsId]) VALUES (9, 44)
INSERT [dbo].[AmenityRoom] ([AmenitiesId], [RoomsId]) VALUES (12, 44)
INSERT [dbo].[AmenityRoom] ([AmenitiesId], [RoomsId]) VALUES (13, 44)
INSERT [dbo].[AmenityRoom] ([AmenitiesId], [RoomsId]) VALUES (16, 44)
INSERT [dbo].[AmenityRoom] ([AmenitiesId], [RoomsId]) VALUES (17, 44)
INSERT [dbo].[AmenityRoom] ([AmenitiesId], [RoomsId]) VALUES (20, 44)
INSERT [dbo].[AmenityRoom] ([AmenitiesId], [RoomsId]) VALUES (21, 44)
INSERT [dbo].[AmenityRoom] ([AmenitiesId], [RoomsId]) VALUES (24, 44)
INSERT [dbo].[AmenityRoom] ([AmenitiesId], [RoomsId]) VALUES (8, 45)
INSERT [dbo].[AmenityRoom] ([AmenitiesId], [RoomsId]) VALUES (9, 45)
INSERT [dbo].[AmenityRoom] ([AmenitiesId], [RoomsId]) VALUES (10, 45)
INSERT [dbo].[AmenityRoom] ([AmenitiesId], [RoomsId]) VALUES (11, 45)
INSERT [dbo].[AmenityRoom] ([AmenitiesId], [RoomsId]) VALUES (12, 45)
INSERT [dbo].[AmenityRoom] ([AmenitiesId], [RoomsId]) VALUES (13, 45)
INSERT [dbo].[AmenityRoom] ([AmenitiesId], [RoomsId]) VALUES (14, 45)
INSERT [dbo].[AmenityRoom] ([AmenitiesId], [RoomsId]) VALUES (15, 45)
INSERT [dbo].[AmenityRoom] ([AmenitiesId], [RoomsId]) VALUES (12, 46)
INSERT [dbo].[AmenityRoom] ([AmenitiesId], [RoomsId]) VALUES (13, 46)
INSERT [dbo].[AmenityRoom] ([AmenitiesId], [RoomsId]) VALUES (14, 46)
INSERT [dbo].[AmenityRoom] ([AmenitiesId], [RoomsId]) VALUES (15, 46)
INSERT [dbo].[AmenityRoom] ([AmenitiesId], [RoomsId]) VALUES (16, 46)
INSERT [dbo].[AmenityRoom] ([AmenitiesId], [RoomsId]) VALUES (17, 46)
INSERT [dbo].[AmenityRoom] ([AmenitiesId], [RoomsId]) VALUES (18, 46)
INSERT [dbo].[AmenityRoom] ([AmenitiesId], [RoomsId]) VALUES (19, 46)
INSERT [dbo].[AmenityRoom] ([AmenitiesId], [RoomsId]) VALUES (8, 47)
INSERT [dbo].[AmenityRoom] ([AmenitiesId], [RoomsId]) VALUES (11, 47)
INSERT [dbo].[AmenityRoom] ([AmenitiesId], [RoomsId]) VALUES (13, 47)
INSERT [dbo].[AmenityRoom] ([AmenitiesId], [RoomsId]) VALUES (14, 47)
INSERT [dbo].[AmenityRoom] ([AmenitiesId], [RoomsId]) VALUES (17, 47)
INSERT [dbo].[AmenityRoom] ([AmenitiesId], [RoomsId]) VALUES (18, 47)
INSERT [dbo].[AmenityRoom] ([AmenitiesId], [RoomsId]) VALUES (20, 47)
INSERT [dbo].[AmenityRoom] ([AmenitiesId], [RoomsId]) VALUES (23, 47)
INSERT [dbo].[AmenityRoom] ([AmenitiesId], [RoomsId]) VALUES (8, 48)
INSERT [dbo].[AmenityRoom] ([AmenitiesId], [RoomsId]) VALUES (9, 48)
INSERT [dbo].[AmenityRoom] ([AmenitiesId], [RoomsId]) VALUES (12, 48)
INSERT [dbo].[AmenityRoom] ([AmenitiesId], [RoomsId]) VALUES (13, 48)
INSERT [dbo].[AmenityRoom] ([AmenitiesId], [RoomsId]) VALUES (16, 48)
INSERT [dbo].[AmenityRoom] ([AmenitiesId], [RoomsId]) VALUES (17, 48)
INSERT [dbo].[AmenityRoom] ([AmenitiesId], [RoomsId]) VALUES (20, 48)
INSERT [dbo].[AmenityRoom] ([AmenitiesId], [RoomsId]) VALUES (21, 48)
INSERT [dbo].[AmenityRoom] ([AmenitiesId], [RoomsId]) VALUES (24, 48)
INSERT [dbo].[AmenityRoom] ([AmenitiesId], [RoomsId]) VALUES (10, 49)
INSERT [dbo].[AmenityRoom] ([AmenitiesId], [RoomsId]) VALUES (12, 49)
INSERT [dbo].[AmenityRoom] ([AmenitiesId], [RoomsId]) VALUES (13, 49)
INSERT [dbo].[AmenityRoom] ([AmenitiesId], [RoomsId]) VALUES (14, 49)
INSERT [dbo].[AmenityRoom] ([AmenitiesId], [RoomsId]) VALUES (16, 49)
INSERT [dbo].[AmenityRoom] ([AmenitiesId], [RoomsId]) VALUES (17, 49)
INSERT [dbo].[AmenityRoom] ([AmenitiesId], [RoomsId]) VALUES (18, 49)
INSERT [dbo].[AmenityRoom] ([AmenitiesId], [RoomsId]) VALUES (20, 49)
INSERT [dbo].[AmenityRoom] ([AmenitiesId], [RoomsId]) VALUES (21, 49)
GO
SET IDENTITY_INSERT [dbo].[Areas] ON 

INSERT [dbo].[Areas] ([Id], [Name]) VALUES (18, N'Tầng 1')
INSERT [dbo].[Areas] ([Id], [Name]) VALUES (19, N'Tầng 2')
INSERT [dbo].[Areas] ([Id], [Name]) VALUES (20, N'Tầng 3')
INSERT [dbo].[Areas] ([Id], [Name]) VALUES (21, N'Tầng 4')
INSERT [dbo].[Areas] ([Id], [Name]) VALUES (22, N'Tầng 5')
INSERT [dbo].[Areas] ([Id], [Name]) VALUES (23, N'Tầng 6')
INSERT [dbo].[Areas] ([Id], [Name]) VALUES (24, N'Tầng 7')
INSERT [dbo].[Areas] ([Id], [Name]) VALUES (25, N'Tầng 8')
INSERT [dbo].[Areas] ([Id], [Name]) VALUES (26, N'Tầng 9')
INSERT [dbo].[Areas] ([Id], [Name]) VALUES (27, N'Tầng 10')
INSERT [dbo].[Areas] ([Id], [Name]) VALUES (28, N'Tầng 11')
INSERT [dbo].[Areas] ([Id], [Name]) VALUES (29, N'Tầng 12')
INSERT [dbo].[Areas] ([Id], [Name]) VALUES (30, N'Tầng 13')
INSERT [dbo].[Areas] ([Id], [Name]) VALUES (31, N'Tầng 14')
SET IDENTITY_INSERT [dbo].[Areas] OFF
GO
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'71db8f10-10b9-42a5-a2c0-99de342614e3', N'Admin', N'ADMIN', NULL)
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'a80ae94d-7812-4456-9f0a-dc89c815a69d', N'Client', N'CLIENT', NULL)
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'bb0db3a8-2273-4be3-bab8-49c0b90b83d5', N'71db8f10-10b9-42a5-a2c0-99de342614e3')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'2e9ee625-4693-446f-9904-4b6282a8245a', N'a80ae94d-7812-4456-9f0a-dc89c815a69d')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'd995a70a-66fc-4975-a913-cd5f9709d225', N'a80ae94d-7812-4456-9f0a-dc89c815a69d')
GO
INSERT [dbo].[AspNetUsers] ([Id], [FirstName], [LastName], [FullName], [Email], [PhoneNumber], [UserName], [NormalizedUserName], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [Password], [AvatarUrl]) VALUES (N'2e9ee625-4693-446f-9904-4b6282a8245a', N'Huuwx', N'Tân', N'Huuwx Tân', N'huutan1@gmail.com', N'0338476122', N'huutan1@gmail.com', N'HUUTAN1@GMAIL.COM', N'HUUTAN1@GMAIL.COM', 0, N'AQAAAAIAAYagAAAAEBuPf6OonwKf+CtiHkL7qLih/IClq2dEFPXhNtEVYvb6X9SeMqFvGIsVdm3zIiMyKQ==', N'B4MWCGNGDDQIA2BJTHQBPR53OXG6KUGI', N'c06626b3-c98f-424c-8a72-c5d977272e49', 0, 0, NULL, 1, 0, N'Huutan172', N'~/upload/15122003basicavatar.png')
INSERT [dbo].[AspNetUsers] ([Id], [FirstName], [LastName], [FullName], [Email], [PhoneNumber], [UserName], [NormalizedUserName], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [Password], [AvatarUrl]) VALUES (N'bb0db3a8-2273-4be3-bab8-49c0b90b83d5', N'Admin', N'Admin', N'Admin Admin', N'huutan1722003@gmail.com', N'0338476122', N'huutan1722003@gmail.com', N'HUUTAN1722003@GMAIL.COM', N'HUUTAN1722003@GMAIL.COM', 0, N'AQAAAAIAAYagAAAAEPf4TzfDv24fzdI/1uh7aPz8MDPxZ3Cmfxxg+9IGIF15lisAuPpGJbgS2H10mm3Abg==', N'KAMRUGH7K6AAPR3TB35GEOGRD77GOVKX', N'9a28fe4c-288e-4b70-9cd9-a1b6c17e44d7', 0, 0, NULL, 1, 0, N'Huutan172', N'~/upload/15122003basicavatar.png')
INSERT [dbo].[AspNetUsers] ([Id], [FirstName], [LastName], [FullName], [Email], [PhoneNumber], [UserName], [NormalizedUserName], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [Password], [AvatarUrl]) VALUES (N'd995a70a-66fc-4975-a913-cd5f9709d225', N'Trần', N'Tân2', N'Trần Tân2', N'huutan2@gmail.com', N'0338476122', N'huutan2@gmail.com', N'HUUTAN2@GMAIL.COM', N'HUUTAN2@GMAIL.COM', 0, N'AQAAAAIAAYagAAAAEElRcL6O8czn0fuKmc57G8Cr1NCtNgZ2kBPsUPlq20hnyS4blkKE/tpSuhHmyOZMeQ==', N'OVZJURZDKQQV4MQKCLDGPJAVCRPO44I2', N'cc65fe06-bf78-4b1d-8cea-786e6833c131', 0, 0, NULL, 1, 0, N'Huutan172', N'~/upload/15122003basicavatar.png')
GO
INSERT [dbo].[Conversations] ([Id], [CustomerId], [AdminId], [StartDate], [Status]) VALUES (N'36a1f5de-12f6-4bee-8f45-1a49e12d0b67', N'2e9ee625-4693-446f-9904-4b6282a8245a', N'bb0db3a8-2273-4be3-bab8-49c0b90b83d5', CAST(N'2025-05-22T16:31:46.5505406' AS DateTime2), N'Active')
INSERT [dbo].[Conversations] ([Id], [CustomerId], [AdminId], [StartDate], [Status]) VALUES (N'8a16b781-8ff8-4934-96f3-33c66e670745', N'd995a70a-66fc-4975-a913-cd5f9709d225', N'bb0db3a8-2273-4be3-bab8-49c0b90b83d5', CAST(N'2025-05-22T17:05:30.9826325' AS DateTime2), N'Active')
GO
SET IDENTITY_INSERT [dbo].[Images] ON 

INSERT [dbo].[Images] ([Id], [Path], [Caption], [RoomID]) VALUES (91, N'/upload/638694787164279100.jpg', N'638694787164279100.jpg', 44)
INSERT [dbo].[Images] ([Id], [Path], [Caption], [RoomID]) VALUES (92, N'/upload/gallery2.jpg', N'gallery2.jpg', 44)
INSERT [dbo].[Images] ([Id], [Path], [Caption], [RoomID]) VALUES (93, N'/upload/gallery4.jpg', N'gallery4.jpg', 44)
INSERT [dbo].[Images] ([Id], [Path], [Caption], [RoomID]) VALUES (94, N'/upload/gallery7.jpg', N'gallery7.jpg', 44)
INSERT [dbo].[Images] ([Id], [Path], [Caption], [RoomID]) VALUES (95, N'/upload/gallery5.jpg', N'gallery5.jpg', 45)
INSERT [dbo].[Images] ([Id], [Path], [Caption], [RoomID]) VALUES (96, N'/upload/gallery6.jpg', N'gallery6.jpg', 45)
INSERT [dbo].[Images] ([Id], [Path], [Caption], [RoomID]) VALUES (97, N'/upload/gallery7.jpg', N'gallery7.jpg', 45)
INSERT [dbo].[Images] ([Id], [Path], [Caption], [RoomID]) VALUES (98, N'/upload/gallery5.jpg', N'gallery5.jpg', 46)
INSERT [dbo].[Images] ([Id], [Path], [Caption], [RoomID]) VALUES (99, N'/upload/gallery6.jpg', N'gallery6.jpg', 46)
INSERT [dbo].[Images] ([Id], [Path], [Caption], [RoomID]) VALUES (100, N'/upload/gallery3.jpg', N'gallery3.jpg', 46)
INSERT [dbo].[Images] ([Id], [Path], [Caption], [RoomID]) VALUES (101, N'/upload/gallery2.jpg', N'gallery2.jpg', 46)
INSERT [dbo].[Images] ([Id], [Path], [Caption], [RoomID]) VALUES (102, N'/upload/gallery5.jpg', N'gallery5.jpg', 47)
INSERT [dbo].[Images] ([Id], [Path], [Caption], [RoomID]) VALUES (103, N'/upload/638694790827841774.jpg', N'638694790827841774.jpg', 47)
INSERT [dbo].[Images] ([Id], [Path], [Caption], [RoomID]) VALUES (104, N'/upload/gallery3.jpg', N'gallery3.jpg', 47)
INSERT [dbo].[Images] ([Id], [Path], [Caption], [RoomID]) VALUES (105, N'/upload/gallery6.jpg', N'gallery6.jpg', 48)
INSERT [dbo].[Images] ([Id], [Path], [Caption], [RoomID]) VALUES (106, N'/upload/blog2.jpg', N'blog2.jpg', 48)
INSERT [dbo].[Images] ([Id], [Path], [Caption], [RoomID]) VALUES (107, N'/upload/638694791089300023.jpg', N'638694791089300023.jpg', 48)
INSERT [dbo].[Images] ([Id], [Path], [Caption], [RoomID]) VALUES (108, N'/upload/gallery5.jpg', N'gallery5.jpg', 49)
INSERT [dbo].[Images] ([Id], [Path], [Caption], [RoomID]) VALUES (109, N'/upload/room1.jpg', N'room1.jpg', 49)
INSERT [dbo].[Images] ([Id], [Path], [Caption], [RoomID]) VALUES (110, N'/upload/gallery7.jpg', N'gallery7.jpg', 49)
SET IDENTITY_INSERT [dbo].[Images] OFF
GO
INSERT [dbo].[Messages] ([Id], [ConversationId], [SenderId], [Content], [Timestamp], [IsRead]) VALUES (N'092498fb-bcda-4ff4-b05a-e67fa8409185', N'36a1f5de-12f6-4bee-8f45-1a49e12d0b67', N'2e9ee625-4693-446f-9904-4b6282a8245a', N'Demo admin', CAST(N'2025-05-22T17:03:49.9380894' AS DateTime2), 0)
INSERT [dbo].[Messages] ([Id], [ConversationId], [SenderId], [Content], [Timestamp], [IsRead]) VALUES (N'0fc5d344-2969-4894-966e-a9f57ccdd6a1', N'8a16b781-8ff8-4934-96f3-33c66e670745', N'd995a70a-66fc-4975-a913-cd5f9709d225', N'Huutan2', CAST(N'2025-05-22T17:07:55.8622726' AS DateTime2), 0)
INSERT [dbo].[Messages] ([Id], [ConversationId], [SenderId], [Content], [Timestamp], [IsRead]) VALUES (N'133c8025-cdd7-4d52-87d3-4ae510e310cb', N'8a16b781-8ff8-4934-96f3-33c66e670745', N'd995a70a-66fc-4975-a913-cd5f9709d225', N'Alo', CAST(N'2025-05-22T17:05:44.0633142' AS DateTime2), 0)
INSERT [dbo].[Messages] ([Id], [ConversationId], [SenderId], [Content], [Timestamp], [IsRead]) VALUES (N'21341641-336e-4040-b02a-edc81dbef46e', N'8a16b781-8ff8-4934-96f3-33c66e670745', N'd995a70a-66fc-4975-a913-cd5f9709d225', N'Demo', CAST(N'2025-05-22T17:06:01.5880518' AS DateTime2), 0)
INSERT [dbo].[Messages] ([Id], [ConversationId], [SenderId], [Content], [Timestamp], [IsRead]) VALUES (N'2d4d519e-22b4-4846-b1e3-12aa2c291b12', N'36a1f5de-12f6-4bee-8f45-1a49e12d0b67', N'2e9ee625-4693-446f-9904-4b6282a8245a', N'Hello Hello', CAST(N'2025-05-22T17:04:49.9894371' AS DateTime2), 0)
INSERT [dbo].[Messages] ([Id], [ConversationId], [SenderId], [Content], [Timestamp], [IsRead]) VALUES (N'4c7435c9-6017-45c2-83a3-3a55023300a7', N'36a1f5de-12f6-4bee-8f45-1a49e12d0b67', N'2e9ee625-4693-446f-9904-4b6282a8245a', N'Huutan1', CAST(N'2025-05-22T17:07:44.8328015' AS DateTime2), 0)
INSERT [dbo].[Messages] ([Id], [ConversationId], [SenderId], [Content], [Timestamp], [IsRead]) VALUES (N'4df441fe-1208-4f10-90f4-5b32ba2534ea', N'36a1f5de-12f6-4bee-8f45-1a49e12d0b67', N'2e9ee625-4693-446f-9904-4b6282a8245a', N'ss', CAST(N'2025-05-22T17:42:20.3371706' AS DateTime2), 0)
INSERT [dbo].[Messages] ([Id], [ConversationId], [SenderId], [Content], [Timestamp], [IsRead]) VALUES (N'75dcfba5-a290-4f05-ad36-9331e93b8e7d', N'8a16b781-8ff8-4934-96f3-33c66e670745', N'd995a70a-66fc-4975-a913-cd5f9709d225', N'Huutan2', CAST(N'2025-05-22T17:08:13.1183421' AS DateTime2), 0)
INSERT [dbo].[Messages] ([Id], [ConversationId], [SenderId], [Content], [Timestamp], [IsRead]) VALUES (N'7b4d1c68-28a8-477a-b365-e9590675a209', N'36a1f5de-12f6-4bee-8f45-1a49e12d0b67', N'bb0db3a8-2273-4be3-bab8-49c0b90b83d5', N'ssssss', CAST(N'2025-05-22T17:00:16.3952825' AS DateTime2), 0)
INSERT [dbo].[Messages] ([Id], [ConversationId], [SenderId], [Content], [Timestamp], [IsRead]) VALUES (N'8249c520-3fdf-4595-b6ea-ccb7069639d0', N'36a1f5de-12f6-4bee-8f45-1a49e12d0b67', N'bb0db3a8-2273-4be3-bab8-49c0b90b83d5', N'Demo3', CAST(N'2025-05-22T17:55:01.1813943' AS DateTime2), 0)
INSERT [dbo].[Messages] ([Id], [ConversationId], [SenderId], [Content], [Timestamp], [IsRead]) VALUES (N'a34ead29-a7ae-4aa3-a403-171f0169fd2b', N'36a1f5de-12f6-4bee-8f45-1a49e12d0b67', N'2e9ee625-4693-446f-9904-4b6282a8245a', N'Huutan3', CAST(N'2025-05-22T17:08:17.9002462' AS DateTime2), 0)
INSERT [dbo].[Messages] ([Id], [ConversationId], [SenderId], [Content], [Timestamp], [IsRead]) VALUES (N'b5ed4648-11e1-47bf-81da-36355d1de8c5', N'36a1f5de-12f6-4bee-8f45-1a49e12d0b67', N'bb0db3a8-2273-4be3-bab8-49c0b90b83d5', N'Demo2', CAST(N'2025-05-22T17:54:48.4582114' AS DateTime2), 0)
INSERT [dbo].[Messages] ([Id], [ConversationId], [SenderId], [Content], [Timestamp], [IsRead]) VALUES (N'bc740b3a-7037-4ab4-ba71-ab78eb1cede6', N'36a1f5de-12f6-4bee-8f45-1a49e12d0b67', N'bb0db3a8-2273-4be3-bab8-49c0b90b83d5', N'Demo4', CAST(N'2025-05-22T17:55:31.2738535' AS DateTime2), 0)
INSERT [dbo].[Messages] ([Id], [ConversationId], [SenderId], [Content], [Timestamp], [IsRead]) VALUES (N'db9376d3-d52f-46f3-a42a-c31071f9dfff', N'36a1f5de-12f6-4bee-8f45-1a49e12d0b67', N'2e9ee625-4693-446f-9904-4b6282a8245a', N'sss', CAST(N'2025-05-22T17:43:33.8449304' AS DateTime2), 0)
INSERT [dbo].[Messages] ([Id], [ConversationId], [SenderId], [Content], [Timestamp], [IsRead]) VALUES (N'de1f051d-fc83-489f-a265-f5925e778cc1', N'36a1f5de-12f6-4bee-8f45-1a49e12d0b67', N'bb0db3a8-2273-4be3-bab8-49c0b90b83d5', N'Demo1', CAST(N'2025-05-22T17:54:40.5789460' AS DateTime2), 0)
INSERT [dbo].[Messages] ([Id], [ConversationId], [SenderId], [Content], [Timestamp], [IsRead]) VALUES (N'f07cfa63-87fe-46b2-9e69-a309e8358a01', N'36a1f5de-12f6-4bee-8f45-1a49e12d0b67', N'bb0db3a8-2273-4be3-bab8-49c0b90b83d5', N'huutan', CAST(N'2025-05-22T17:00:13.8505706' AS DateTime2), 0)
INSERT [dbo].[Messages] ([Id], [ConversationId], [SenderId], [Content], [Timestamp], [IsRead]) VALUES (N'f154bce6-9c33-42fe-b9d3-a61262861c04', N'36a1f5de-12f6-4bee-8f45-1a49e12d0b67', N'2e9ee625-4693-446f-9904-4b6282a8245a', N'sss', CAST(N'2025-05-22T17:58:04.7992079' AS DateTime2), 0)
GO
SET IDENTITY_INSERT [dbo].[Rooms] ON 

INSERT [dbo].[Rooms] ([Id], [TypeId], [AreaId], [Price], [Discount], [Status], [Code], [PhuongXa], [QuanHuyen]) VALUES (44, 10, 18, CAST(10000000.00 AS Decimal(18, 2)), CAST(0.20 AS Decimal(18, 2)), 0, N'4/20/2025 3:38:56 AM', N'Phường Hòa Hiệp Bắc', N'Quận Liên Chiểu')
INSERT [dbo].[Rooms] ([Id], [TypeId], [AreaId], [Price], [Discount], [Status], [Code], [PhuongXa], [QuanHuyen]) VALUES (45, 10, 18, CAST(15000000.00 AS Decimal(18, 2)), CAST(0.10 AS Decimal(18, 2)), 0, N'3/20/2025 3:39:41 AM', N'Phường Hòa Thuận Tây', N'Quận Hải Châu')
INSERT [dbo].[Rooms] ([Id], [TypeId], [AreaId], [Price], [Discount], [Status], [Code], [PhuongXa], [QuanHuyen]) VALUES (46, 10, 18, CAST(10000000.00 AS Decimal(18, 2)), CAST(0.15 AS Decimal(18, 2)), 0, N'2/20/2025 3:40:29 AM', N'Phường Thanh Khê Đông', N'Quận Thanh Khê')
INSERT [dbo].[Rooms] ([Id], [TypeId], [AreaId], [Price], [Discount], [Status], [Code], [PhuongXa], [QuanHuyen]) VALUES (47, 10, 18, CAST(7000000.00 AS Decimal(18, 2)), CAST(0.02 AS Decimal(18, 2)), 0, N'1/20/2025 3:41:33 AM', N'Phường Mỹ An', N'Quận Ngũ Hành Sơn')
INSERT [dbo].[Rooms] ([Id], [TypeId], [AreaId], [Price], [Discount], [Status], [Code], [PhuongXa], [QuanHuyen]) VALUES (48, 10, 18, CAST(10000000.00 AS Decimal(18, 2)), CAST(0.20 AS Decimal(18, 2)), -1, N'5/20/2025 4:10:21 AM', N'Phường Hòa Hiệp Bắc', N'Quận Liên Chiểu')
INSERT [dbo].[Rooms] ([Id], [TypeId], [AreaId], [Price], [Discount], [Status], [Code], [PhuongXa], [QuanHuyen]) VALUES (49, 10, 18, CAST(9000000.00 AS Decimal(18, 2)), CAST(0.10 AS Decimal(18, 2)), 1, N'5/20/2025 4:10:57 AM', N'Phường Bình Hiên', N'Quận Hải Châu')
SET IDENTITY_INSERT [dbo].[Rooms] OFF
GO
SET IDENTITY_INSERT [dbo].[RoomTypes] ON 

INSERT [dbo].[RoomTypes] ([Id], [Name], [Description], [People], [ImagePath]) VALUES (10, N'Căn hộ studio', N'Không gian mở, không có tường ngăn giữa các khu vực (phòng ngủ, bếp, phòng khách).', 2, N'~/upload/638694786347110115.jpg')
INSERT [dbo].[RoomTypes] ([Id], [Name], [Description], [People], [ImagePath]) VALUES (11, N'Căn hộ chung cư', N'Căn hộ tiêu chuẩn với phòng ngủ, phòng khách, nhà bếp, phòng tắm riêng biệt.', 5, N'~/upload/638694786670700120.jpg')
INSERT [dbo].[RoomTypes] ([Id], [Name], [Description], [People], [ImagePath]) VALUES (12, N'Căn hộ dịch vụ', N'Giống khách sạn, có dịch vụ dọn dẹp, giặt ủi, lễ tân; phù hợp người đi công tác, du lịch dài ngày.', 4, N'~/upload/638694787164279100.jpg')
INSERT [dbo].[RoomTypes] ([Id], [Name], [Description], [People], [ImagePath]) VALUES (13, N'Căn hộ văn phòng', N'Kết hợp giữa văn phòng và nhà ở; phù hợp doanh nhân hoặc startup.', 2, N'~/upload/638694787507368903.jpg')
INSERT [dbo].[RoomTypes] ([Id], [Name], [Description], [People], [ImagePath]) VALUES (14, N'Căn hộ thương mại', N'Tầng trệt dùng để kinh doanh, tầng trên để ở', 6, N'~/upload/638694788003869841.jpg')
INSERT [dbo].[RoomTypes] ([Id], [Name], [Description], [People], [ImagePath]) VALUES (15, N'Căn hộ áp mái', N'Căn hộ trần cao, có gác lửng tạo không gian rộng rãi.', 4, N'~/upload/638694788330380952.jpg')
INSERT [dbo].[RoomTypes] ([Id], [Name], [Description], [People], [ImagePath]) VALUES (16, N'Căn hộ penthouse', N'Căn hộ cao cấp nằm trên tầng cao nhất của toà nhà, có tầm nhìn đẹp, nội thất sang trọng.', 8, N'~/upload/638694788649928196.jpg')
INSERT [dbo].[RoomTypes] ([Id], [Name], [Description], [People], [ImagePath]) VALUES (17, N'Căn hộ kép', N'Gồm 2 căn hộ riêng biệt cùng một cửa chính; thuận tiện cho thuê/ở cùng gia đình.', 6, N'~/upload/638694789062794359.jpg')
INSERT [dbo].[RoomTypes] ([Id], [Name], [Description], [People], [ImagePath]) VALUES (18, N'Căn hộ thông tầng', N'Căn hộ có 2 tầng thông nhau (bên trong), giống nhà phố.', 6, N'~/upload/638694789481098959.jpg')
INSERT [dbo].[RoomTypes] ([Id], [Name], [Description], [People], [ImagePath]) VALUES (19, N'Căn hộ Sky Villa', N'Biệt thự trên không, cao cấp như villa nhưng nằm trong chung cư cao tầng.', 10, N'~/upload/638694790335464449.jpg')
INSERT [dbo].[RoomTypes] ([Id], [Name], [Description], [People], [ImagePath]) VALUES (20, N'Căn hộ tầng hầm ', N'Căn hộ nằm ở tầng hầm hoặc bán hầm, thường có giá thấp hơn do ánh sáng và thông thoáng kém.', 3, N'~/upload/638694790827841774.jpg')
SET IDENTITY_INSERT [dbo].[RoomTypes] OFF
GO
SET IDENTITY_INSERT [dbo].[Vouchers] ON 

INSERT [dbo].[Vouchers] ([Id], [Name], [Quantity], [Code], [Status], [Discount], [Description], [ImagePath]) VALUES (2, N'Sale 10%', 3, N'#2323111', 0, CAST(0.10 AS Decimal(18, 2)), N'Giải nhiệt mùa hè', N'/images/voucher4.jpg')
INSERT [dbo].[Vouchers] ([Id], [Name], [Quantity], [Code], [Status], [Discount], [Description], [ImagePath]) VALUES (5, N'Sale 30%', 200, N'#3302021', 0, CAST(0.30 AS Decimal(18, 2)), N'Tết sum quầy', N'/images/voucher1.jpg')
INSERT [dbo].[Vouchers] ([Id], [Name], [Quantity], [Code], [Status], [Discount], [Description], [ImagePath]) VALUES (6, N'Sale 50%', 99, N'#1201010', 0, CAST(0.50 AS Decimal(18, 2)), N'Mùa đông ấm êm', N'/images/voucher2.jpg')
SET IDENTITY_INSERT [dbo].[Vouchers] OFF
GO
/****** Object:  Index [IX_AmenityRoom_RoomsId]    Script Date: 5/22/2025 7:22:29 PM ******/
CREATE NONCLUSTERED INDEX [IX_AmenityRoom_RoomsId] ON [dbo].[AmenityRoom]
(
	[RoomsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetRoleClaims_RoleId]    Script Date: 5/22/2025 7:22:29 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetRoleClaims_RoleId] ON [dbo].[AspNetRoleClaims]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [RoleNameIndex]    Script Date: 5/22/2025 7:22:29 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
(
	[NormalizedName] ASC
)
WHERE ([NormalizedName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserClaims_UserId]    Script Date: 5/22/2025 7:22:29 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserClaims_UserId] ON [dbo].[AspNetUserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserLogins_UserId]    Script Date: 5/22/2025 7:22:29 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserLogins_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserRoles_RoleId]    Script Date: 5/22/2025 7:22:29 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserRoles_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [EmailIndex]    Script Date: 5/22/2025 7:22:29 PM ******/
CREATE NONCLUSTERED INDEX [EmailIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedEmail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UserNameIndex]    Script Date: 5/22/2025 7:22:29 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedUserName] ASC
)
WHERE ([NormalizedUserName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Bookings_RoomID]    Script Date: 5/22/2025 7:22:29 PM ******/
CREATE NONCLUSTERED INDEX [IX_Bookings_RoomID] ON [dbo].[Bookings]
(
	[RoomID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Bookings_UserID]    Script Date: 5/22/2025 7:22:29 PM ******/
CREATE NONCLUSTERED INDEX [IX_Bookings_UserID] ON [dbo].[Bookings]
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Bookings_VoucherID]    Script Date: 5/22/2025 7:22:29 PM ******/
CREATE NONCLUSTERED INDEX [IX_Bookings_VoucherID] ON [dbo].[Bookings]
(
	[VoucherID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_CCCDs_BookingId]    Script Date: 5/22/2025 7:22:29 PM ******/
CREATE NONCLUSTERED INDEX [IX_CCCDs_BookingId] ON [dbo].[CCCDs]
(
	[BookingId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Conversations_AdminId]    Script Date: 5/22/2025 7:22:29 PM ******/
CREATE NONCLUSTERED INDEX [IX_Conversations_AdminId] ON [dbo].[Conversations]
(
	[AdminId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Conversations_CustomerId]    Script Date: 5/22/2025 7:22:29 PM ******/
CREATE NONCLUSTERED INDEX [IX_Conversations_CustomerId] ON [dbo].[Conversations]
(
	[CustomerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Images_RoomID]    Script Date: 5/22/2025 7:22:29 PM ******/
CREATE NONCLUSTERED INDEX [IX_Images_RoomID] ON [dbo].[Images]
(
	[RoomID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Messages_ConversationId]    Script Date: 5/22/2025 7:22:29 PM ******/
CREATE NONCLUSTERED INDEX [IX_Messages_ConversationId] ON [dbo].[Messages]
(
	[ConversationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Messages_SenderId]    Script Date: 5/22/2025 7:22:29 PM ******/
CREATE NONCLUSTERED INDEX [IX_Messages_SenderId] ON [dbo].[Messages]
(
	[SenderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Rooms_AreaId]    Script Date: 5/22/2025 7:22:29 PM ******/
CREATE NONCLUSTERED INDEX [IX_Rooms_AreaId] ON [dbo].[Rooms]
(
	[AreaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Rooms_TypeId]    Script Date: 5/22/2025 7:22:29 PM ******/
CREATE NONCLUSTERED INDEX [IX_Rooms_TypeId] ON [dbo].[Rooms]
(
	[TypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AspNetUsers] ADD  DEFAULT (N'') FOR [Password]
GO
ALTER TABLE [dbo].[Bookings] ADD  DEFAULT ('0001-01-01T00:00:00.0000000') FOR [CreateAt]
GO
ALTER TABLE [dbo].[CCCDs] ADD  DEFAULT ((0)) FOR [BookingId]
GO
ALTER TABLE [dbo].[Rooms] ADD  DEFAULT (N'') FOR [Code]
GO
ALTER TABLE [dbo].[Rooms] ADD  DEFAULT (N'') FOR [PhuongXa]
GO
ALTER TABLE [dbo].[Rooms] ADD  DEFAULT (N'') FOR [QuanHuyen]
GO
ALTER TABLE [dbo].[AmenityRoom]  WITH CHECK ADD  CONSTRAINT [FK_AmenityRoom_Amenities_AmenitiesId] FOREIGN KEY([AmenitiesId])
REFERENCES [dbo].[Amenities] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AmenityRoom] CHECK CONSTRAINT [FK_AmenityRoom_Amenities_AmenitiesId]
GO
ALTER TABLE [dbo].[AmenityRoom]  WITH CHECK ADD  CONSTRAINT [FK_AmenityRoom_Rooms_RoomsId] FOREIGN KEY([RoomsId])
REFERENCES [dbo].[Rooms] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AmenityRoom] CHECK CONSTRAINT [FK_AmenityRoom_Rooms_RoomsId]
GO
ALTER TABLE [dbo].[AspNetRoleClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetRoleClaims] CHECK CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserTokens]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserTokens] CHECK CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[Bookings]  WITH CHECK ADD  CONSTRAINT [FK_Bookings_AspNetUsers_UserID] FOREIGN KEY([UserID])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Bookings] CHECK CONSTRAINT [FK_Bookings_AspNetUsers_UserID]
GO
ALTER TABLE [dbo].[Bookings]  WITH CHECK ADD  CONSTRAINT [FK_Bookings_Rooms_RoomID] FOREIGN KEY([RoomID])
REFERENCES [dbo].[Rooms] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Bookings] CHECK CONSTRAINT [FK_Bookings_Rooms_RoomID]
GO
ALTER TABLE [dbo].[Bookings]  WITH CHECK ADD  CONSTRAINT [FK_Bookings_Vouchers_VoucherID] FOREIGN KEY([VoucherID])
REFERENCES [dbo].[Vouchers] ([Id])
GO
ALTER TABLE [dbo].[Bookings] CHECK CONSTRAINT [FK_Bookings_Vouchers_VoucherID]
GO
ALTER TABLE [dbo].[CCCDs]  WITH CHECK ADD  CONSTRAINT [FK_CCCDs_Bookings_BookingId] FOREIGN KEY([BookingId])
REFERENCES [dbo].[Bookings] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CCCDs] CHECK CONSTRAINT [FK_CCCDs_Bookings_BookingId]
GO
ALTER TABLE [dbo].[Conversations]  WITH CHECK ADD  CONSTRAINT [FK_Conversations_AspNetUsers_AdminId] FOREIGN KEY([AdminId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[Conversations] CHECK CONSTRAINT [FK_Conversations_AspNetUsers_AdminId]
GO
ALTER TABLE [dbo].[Conversations]  WITH CHECK ADD  CONSTRAINT [FK_Conversations_AspNetUsers_CustomerId] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Conversations] CHECK CONSTRAINT [FK_Conversations_AspNetUsers_CustomerId]
GO
ALTER TABLE [dbo].[Images]  WITH CHECK ADD  CONSTRAINT [FK_Images_Rooms_RoomID] FOREIGN KEY([RoomID])
REFERENCES [dbo].[Rooms] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Images] CHECK CONSTRAINT [FK_Images_Rooms_RoomID]
GO
ALTER TABLE [dbo].[Messages]  WITH CHECK ADD  CONSTRAINT [FK_Messages_AspNetUsers_SenderId] FOREIGN KEY([SenderId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Messages] CHECK CONSTRAINT [FK_Messages_AspNetUsers_SenderId]
GO
ALTER TABLE [dbo].[Messages]  WITH CHECK ADD  CONSTRAINT [FK_Messages_Conversations_ConversationId] FOREIGN KEY([ConversationId])
REFERENCES [dbo].[Conversations] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Messages] CHECK CONSTRAINT [FK_Messages_Conversations_ConversationId]
GO
ALTER TABLE [dbo].[Rooms]  WITH CHECK ADD  CONSTRAINT [FK_Rooms_Areas_AreaId] FOREIGN KEY([AreaId])
REFERENCES [dbo].[Areas] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Rooms] CHECK CONSTRAINT [FK_Rooms_Areas_AreaId]
GO
ALTER TABLE [dbo].[Rooms]  WITH CHECK ADD  CONSTRAINT [FK_Rooms_RoomTypes_TypeId] FOREIGN KEY([TypeId])
REFERENCES [dbo].[RoomTypes] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Rooms] CHECK CONSTRAINT [FK_Rooms_RoomTypes_TypeId]
GO
USE [master]
GO
ALTER DATABASE [HotelApp] SET  READ_WRITE 
GO
