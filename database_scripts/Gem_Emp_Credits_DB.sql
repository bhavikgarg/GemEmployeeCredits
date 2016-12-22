USE [master]
GO
/****** Object:  Database [Gem_Employee_Credits]    Script Date: 12/22/2016 6:27:00 AM ******/
CREATE DATABASE [Gem_Employee_Credits]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Gem_Employee_Credits', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\Gem_Employee_Credits.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Gem_Employee_Credits_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\Gem_Employee_Credits_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Gem_Employee_Credits] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Gem_Employee_Credits].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Gem_Employee_Credits] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Gem_Employee_Credits] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Gem_Employee_Credits] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Gem_Employee_Credits] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Gem_Employee_Credits] SET ARITHABORT OFF 
GO
ALTER DATABASE [Gem_Employee_Credits] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Gem_Employee_Credits] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Gem_Employee_Credits] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Gem_Employee_Credits] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Gem_Employee_Credits] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Gem_Employee_Credits] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Gem_Employee_Credits] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Gem_Employee_Credits] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Gem_Employee_Credits] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Gem_Employee_Credits] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Gem_Employee_Credits] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Gem_Employee_Credits] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Gem_Employee_Credits] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Gem_Employee_Credits] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Gem_Employee_Credits] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Gem_Employee_Credits] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Gem_Employee_Credits] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Gem_Employee_Credits] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Gem_Employee_Credits] SET  MULTI_USER 
GO
ALTER DATABASE [Gem_Employee_Credits] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Gem_Employee_Credits] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Gem_Employee_Credits] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Gem_Employee_Credits] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Gem_Employee_Credits] SET DELAYED_DURABILITY = DISABLED 
GO
USE [Gem_Employee_Credits]
GO
/****** Object:  Table [dbo].[Designation_MST]    Script Date: 12/22/2016 6:27:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Designation_MST](
	[id] [smallint] IDENTITY(1,1) NOT NULL,
	[Designation] [varchar](max) NOT NULL,
	[IsActive] [bit] NOT NULL CONSTRAINT [DF_Designation_MST_IsActive]  DEFAULT ((1)),
	[DateCreated] [datetime] NOT NULL,
	[DateDeleted] [datetime] NULL,
	[IsDeleted] [bit] NOT NULL CONSTRAINT [DF_Designation_MST_IsDeleted]  DEFAULT ((0)),
 CONSTRAINT [PK_Designation_MST] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Emp_Credits]    Script Date: 12/22/2016 6:27:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Emp_Credits](
	[id] [bigint] NOT NULL,
	[FromEmployee] [bigint] NOT NULL,
	[ToEmployee] [bigint] NOT NULL,
	[Credits] [smallint] NOT NULL,
	[DateCreated] [datetime] NOT NULL,
	[IsRedeemed] [bit] NOT NULL,
	[DateRedeemed] [datetime] NULL,
	[Comments] [varchar](max) NOT NULL,
 CONSTRAINT [PK_Emp_Credits] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 12/22/2016 6:27:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Employee](
	[EmployeeId] [varchar](50) NOT NULL,
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](max) NOT NULL,
	[MiddleName] [varchar](max) NULL,
	[LastName] [varchar](max) NULL,
	[DesignationId] [smallint] NOT NULL,
	[ProfileImage] [varchar](max) NULL,
	[TotalPoints] [smallint] NOT NULL CONSTRAINT [DF_Employee_TotalPoints]  DEFAULT ((0)),
	[DateCreated] [datetime] NOT NULL,
	[DateDeleted] [datetime] NULL,
	[IsActive] [bit] NOT NULL CONSTRAINT [DF_Employee_IsActive]  DEFAULT ((1)),
	[IsDeleted] [bit] NOT NULL CONSTRAINT [DF_Employee_IsDeleted]  DEFAULT ((0)),
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Login]    Script Date: 12/22/2016 6:27:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Login](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[EmployeeId] [bigint] NOT NULL,
	[Email] [varchar](200) NOT NULL,
	[Password] [varchar](100) NOT NULL,
	[Mobile] [varchar](15) NULL,
	[DateCreated] [datetime] NOT NULL CONSTRAINT [DF_Login_DateCreated]  DEFAULT (getdate()),
	[IsActive] [bit] NOT NULL CONSTRAINT [DF_Login_IsActive]  DEFAULT ((0)),
 CONSTRAINT [PK_Login_1] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [FK_Employee] UNIQUE NONCLUSTERED 
(
	[EmployeeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[Emp_Credits] ADD  CONSTRAINT [DF_Emp_Credits_IsRedeemed]  DEFAULT ((0)) FOR [IsRedeemed]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_Designation] FOREIGN KEY([DesignationId])
REFERENCES [dbo].[Designation_MST] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_Designation]
GO
ALTER TABLE [dbo].[Login]  WITH CHECK ADD  CONSTRAINT [FK_Login_Employee] FOREIGN KEY([EmployeeId])
REFERENCES [dbo].[Employee] ([id])
GO
ALTER TABLE [dbo].[Login] CHECK CONSTRAINT [FK_Login_Employee]
GO
/****** Object:  StoredProcedure [dbo].[spAddDesignation]    Script Date: 12/22/2016 6:27:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[spAddDesignation]
(
	@Designation varchar(100)
)
AS
BEGIN
	INSERT INTO Designation_MST
		([Designation],[DateCreated],[DateDeleted],[IsActive],[IsDeleted])
	VALUES 
		(@Designation, GETDATE(), NULL, 1, 0)
END
GO
/****** Object:  StoredProcedure [dbo].[spAddEmployee]    Script Date: 12/22/2016 6:27:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[spAddEmployee]
(
	@FirstName varchar(MAX),
	@MiddleName varchar(MAX) = NULL,
	@LastName varchar(MAX) = NULL,
	@EmployeeId varchar(50),
	@Email varchar(200),
	@Password varchar(100),
	@Mobile varchar(15) = NULL,
	@TotalPoints smallint = 0,
	@DesignationId smallint,
	@ProfileImage varchar(MAX) = "demo"
)
AS
BEGIN
	DECLARE @errorCode smallint 
	BEGIN TRAN
		INSERT INTO Employee 
			([FirstName], [MiddleName], [LastName],[EmployeeId], [DesignationId],[ProfileImage],[TotalPoints],[DateCreated],[DateDeleted],[IsActive],[IsDeleted]) 
		VALUES
			(@FirstName, @MiddleName, @LastName, @EmployeeId , @DesignationId, @ProfileImage, @TotalPoints, GETDATE(), NULL, 1, 0)

	
	DECLARE @InsertedEmpId bigint
		SET @InsertedEmpId = SCOPE_IDENTITY()

		INSERT INTO Login
			([EmployeeId],[Email],[Password],[Mobile],[DateCreated],[IsActive])
		VALUES
			(@InsertedEmpId, @Email, @Password, @Mobile, GETDATE(), 1)

	SELECT @errorCode = @@ERROR
	if(@errorCode <> 0)
		ROLLBACK TRAN
	else 
		COMMIT TRAN	
END
GO
/****** Object:  StoredProcedure [dbo].[spLogin]    Script Date: 12/22/2016 6:27:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spLogin] 
(
	@LoginId varchar(100),
	@Password varchar(100)

)
AS
BEGIN 
SET NOCOUNT ON;   -- to prevent meta information about result
	SELECT EmployeeId FROM [Login]
	WHERE Password = @Password AND (Email = @LoginId OR Mobile = @LoginId)
END
GO
USE [master]
GO
ALTER DATABASE [Gem_Employee_Credits] SET  READ_WRITE 
GO
