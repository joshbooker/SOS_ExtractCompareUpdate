rem --load environment variables
call environment
rem --execute create database script for source db
sqlcmd -i "%ProjectPath%\%SqlPath%\createDatabase.sqlcmd.sql" -v DatabaseName="%Source%" -v DefaultDataPath=%DefaultDataPath% -v DefaultLogPath=%DefaultLogPath%
rem --execute create database script for target db
sqlcmd -i "%ProjectPath%\%SqlPath%\createDatabase.sqlcmd.sql" -v DatabaseName="%Target%" -v DefaultDataPath=%DefaultDataPath% -v DefaultLogPath=%DefaultLogPath%