CREATE PROCEDURE [dbo].[Validate_User]
      @Username NVARCHAR(20),
      @Password NVARCHAR(20)
AS
BEGIN
      SET NOCOUNT ON;
      DECLARE @UserId INT, @LastLoginDate DATETIME
     
      SELECT @UserId = UserId, @LastLoginDate = LastLoginDate
      FROM Users WHERE Username = @Username AND [Password] = @Password
     
      IF @UserId IS NOT NULL
      BEGIN
            UPDATE Users
            SET LastLoginDate = GETDATE()
            WHERE UserId = @UserId
            SELECT @UserId [UserId] -- User Valid
      END
      ELSE
      BEGIN
            SELECT -1 -- User invalid.
      END
END

create table Users(
	UserId int unique,  
	Username nvarchar(20),
	[Password] nvarchar(20),
	LastLoginDate datetime 
	primary key(Username)
)

insert into Users(UserId, Username, [Password], LastLoginDate)
values(69696969, 'Admin', 'Admin', GETDATE())