@echo off
echo "Start Backup Database"
sqlcmd -S .\InstanceName,1433 -i "C:\Users\DSS\Downloads\Scheduler\backup.sql"
exit
