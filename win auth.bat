echo off
echo "Start Backup Database"
sqlcmd -S hostname -i "C:\Users\DSS\Downloads\Scheduler\backup.sql"
exit
