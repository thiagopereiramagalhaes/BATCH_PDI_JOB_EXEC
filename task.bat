@echo OFF 
SETLOCAL 
TITLE JOB_TASK

SET "KITCHEN_PATH=C:\pdi-ce-9.4.0.0-343\data-integration"
SET "JOB_PATH=%~dp0\job.kjb"
SET "DATE=%DATE:~6,4%-%DATE:~3,2%-%DATE:~0,2%"
SET "LOG_FILE=%~dp0\%DATE%.log"

ECHO. > "%LOG_FILE%"
"%KITCHEN_PATH%\Kitchen.bat" /file "%JOB_PATH%" >> "%LOG_FILE%"
ENDLOCAL 
