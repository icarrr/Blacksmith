@echo off
echo "Start Backup Database"
sqlcmd -H localhost -U username -P password -i "C:\Users\DSS\Downloads\Scheduler\backup.sql"
exit
