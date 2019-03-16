DECLARE @pathName NVARCHAR(512)
DECLARE @dateTime NVARCHAR(20)
SET @dateTime = REPLACE(CONVERT(VARCHAR(8), GETDATE(),112),'/','') + '_' +  REPLACE(CONVERT(VARCHAR, GETDATE(),108),':','')
SET @pathName = N'fileName_' + @dateTime + '.bak'
BACKUP DATABASE [DB_Name] TO  DISK = @pathName WITH NOFORMAT, NOINIT,  NAME = N'Full Database Backup', SKIP, NOREWIND, NOUNLOAD,  STATS = 10;
