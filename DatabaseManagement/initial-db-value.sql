
-- BULK INSERT City
    -- FROM 'H:\Api\DatabaseManagement\Script\csv\cities.csv'
    -- WITH
    -- (
    -- FIRSTROW = 2,
    -- FIELDTERMINATOR = ',',  --CSV field delimiter
    -- ROWTERMINATOR = '\n',   --Use to shift the control to next row
    -- TABLOCK
    -- )

CREATE TABLE [dbo].[Log](  
    [Id] [int] IDENTITY(1,1) NOT NULL,  
    [Message] [nvarchar](max) NULL,  
    [MessageTemplate] [nvarchar](max) NULL,  
    [Level] [nvarchar](128) NULL,  
    [TimeStamp] [datetimeoffset](7) NOT NULL,  
    [Exception] [nvarchar](max) NULL,  
    [Properties] [xml] NULL,  
    [LogEvent] [nvarchar](max) NULL,  
    [UserName] [nvarchar](200) NULL,  
    [IP] [varchar](200) NULL,  
 CONSTRAINT [PK_Log] PRIMARY KEY CLUSTERED   
(  
    [Id] ASC  
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]  
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]  


SET IDENTITY_INSERT AspNetRoles ON
if not exists (select [name] from AspNetRoles where name='Admin')
begin
INSERT INTO [dbo].[AspNetRoles]([Id],[ConcurrencyStamp],[Name],[NormalizedName]) VALUES (1,NEWID(),'Admin','ADMIN');
end
if not exists (select [name] from AspNetRoles where name='Doctor')
begin
INSERT INTO [dbo].[AspNetRoles]([Id],[ConcurrencyStamp],[Name],[NormalizedName]) VALUES (2,NEWID(),'Doctor','DOCTOR');
end
if not exists (select [name] from AspNetRoles where name='Nurse')
begin
INSERT INTO [dbo].[AspNetRoles]([Id],[ConcurrencyStamp],[Name],[NormalizedName]) VALUES (3,NEWID(),'Nurse','NURSE');
end

SET IDENTITY_INSERT AspNetRoles OFF


--Insert Data [ContactDataType], [ContactEntity], [ContactType]

INSERT [dbo].[ContactDataType] ([Id], [Name]) VALUES (1, N'Email')
GO
INSERT [dbo].[ContactDataType] ([Id], [Name]) VALUES (2, N'Celluar')
GO
INSERT [dbo].[ContactDataType] ([Id], [Name]) VALUES (3, N'Other')
GO
INSERT [dbo].[ContactEntity] ([Id], [Name]) VALUES (1, N'User')
GO
INSERT [dbo].[ContactEntity] ([Id], [Name]) VALUES (2, N'Spouse')
GO
INSERT [dbo].[ContactEntity] ([Id], [Name]) VALUES (3, N'NextOfKin')
GO
INSERT [dbo].[ContactEntity] ([Id], [Name]) VALUES (4, N'FamilyMember')
GO
INSERT [dbo].[ContactType] ([Id], [Name]) VALUES (1, N'Home')
GO
INSERT [dbo].[ContactType] ([Id], [Name]) VALUES (2, N'Work')
GO
INSERT [dbo].[ContactType] ([Id], [Name]) VALUES (3, N'Emergency')
GO
INSERT [dbo].[ContactType] ([Id], [Name]) VALUES (4, N'Other')
GO


--if not exists (select [name] from UserStatus where [name]='Active')
--begin
--INSERT INTO [dbo].[UserStatus]([Id],[Name]) VALUES (1,'Active');
--end

--if not exists (select [name] from UserStatus where [name]='Pending')
--begin
--INSERT INTO [dbo].[UserStatus]([Id],[Name]) VALUES (2,'Pending');
--end

--if not exists (select [name] from UserStatus where [name]='Inactive')
--begin
--INSERT INTO [dbo].[UserStatus]([Id],[Name]) VALUES (3,'Inactive');
--end

--if not exists (select [name] from UserStatus where [name]='Blocked')
--begin
--INSERT INTO [dbo].[UserStatus]([Id],[Name]) VALUES (4,'Blocked');
--end
