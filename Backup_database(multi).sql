DECLARE @name VARCHAR(50) -- database name  
DECLARE @path VARCHAR(256) -- path for backup files  
DECLARE @fileName VARCHAR(256) -- filename for backup  
DECLARE @fileDate VARCHAR(20) -- used for file name 

SET @path = 'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\Backup\'  

SELECT @fileDate = REPLACE(CONVERT(VARCHAR(8), GETDATE(),112),'/','') + '_' +  REPLACE(CONVERT(VARCHAR, GETDATE(),108),':','')

DECLARE db_cursor CURSOR FOR  
SELECT name 
FROM master.dbo.sysdatabases 
WHERE name NOT IN ('master','model','msdb','tempdb')  

OPEN db_cursor   
FETCH NEXT FROM db_cursor INTO @name   

WHILE @@FETCH_STATUS = 0   
BEGIN   
       SET @fileName = @path + @name + '_' + @fileDate + '.bak'  
       BACKUP DATABASE @name TO DISK = @fileName WITH NOFORMAT, NOINIT,  NAME = N'Full Database Backup', SKIP, NOREWIND, NOUNLOAD,  STATS = 10;

       FETCH NEXT FROM db_cursor INTO @name   
END   

CLOSE db_cursor   
DEALLOCATE db_cursor 

