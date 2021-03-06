USE [IlacTakipDb]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 26.12.2021 00:07:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__MigrationHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ContextKey] [nvarchar](300) NOT NULL,
	[Model] [varbinary](max) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_dbo.__MigrationHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC,
	[ContextKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PatientInformations]    Script Date: 26.12.2021 00:07:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PatientInformations](
	[PatientId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[PatientNameSurname] [nvarchar](max) NULL,
	[MedicineName] [nvarchar](max) NULL,
	[MedicineRepetetionTime] [int] NOT NULL,
	[Statament] [nvarchar](max) NULL,
	[MedicineStartTime] [datetime] NOT NULL,
 CONSTRAINT [PK_dbo.PatientInformations] PRIMARY KEY CLUSTERED 
(
	[PatientId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PatientMedicineControls]    Script Date: 26.12.2021 00:07:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PatientMedicineControls](
	[RegistrationId] [int] IDENTITY(1,1) NOT NULL,
	[PatientId] [int] NOT NULL,
	[PatientNameSurname] [nvarchar](max) NULL,
	[MedicineName] [nvarchar](max) NULL,
	[MedicineStartTime] [datetime] NOT NULL,
	[TakeTheMedicine] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.PatientMedicineControls] PRIMARY KEY CLUSTERED 
(
	[RegistrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserInformations]    Script Date: 26.12.2021 00:07:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserInformations](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](max) NULL,
	[UserSurname] [nvarchar](max) NULL,
	[UserTelNumber] [nvarchar](max) NULL,
	[UserEmail] [nvarchar](max) NULL,
	[Password] [nvarchar](max) NULL,
	[UserRegisterDate] [datetime] NOT NULL,
	[UserStatus] [bit] NOT NULL,
 CONSTRAINT [PK_dbo.UserInformations] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[PatientInformations]  WITH CHECK ADD  CONSTRAINT [FK_dbo.PatientInformations_dbo.UserInformations_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[UserInformations] ([UserId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PatientInformations] CHECK CONSTRAINT [FK_dbo.PatientInformations_dbo.UserInformations_UserId]
GO
ALTER TABLE [dbo].[PatientMedicineControls]  WITH CHECK ADD  CONSTRAINT [FK_dbo.PatientMedicineControls_dbo.PatientInformations_PatientId] FOREIGN KEY([PatientId])
REFERENCES [dbo].[PatientInformations] ([PatientId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PatientMedicineControls] CHECK CONSTRAINT [FK_dbo.PatientMedicineControls_dbo.PatientInformations_PatientId]
GO
