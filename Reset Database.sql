DECLARE @pathName NVARCHAR(512)
DECLARE @dateTime NVARCHAR(20)
SET @dateTime = REPLACE(CONVERT(VARCHAR(8), GETDATE(),112),'/','') + '_' +  REPLACE(CONVERT(VARCHAR, GETDATE(),108),':','')
SET @pathName = N'DB_Name_' + @dateTime + '.bak'

BACKUP DATABASE DB_Name TO  DISK = @pathName WITH NOFORMAT, NOINIT,  NAME = N'Full Backup', SKIP, NOREWIND, NOUNLOAD,  STATS = 10;

USE master;

ALTER DATABASE DB_Name
SET single_user
WITH ROLLBACK IMMEDIATE;

DROP DATABASE DB_Name;

CREATE DATABASE DB_Name;

USE DB_Name;

EXEC sp_changedbowner 'dapen';

USE master;
