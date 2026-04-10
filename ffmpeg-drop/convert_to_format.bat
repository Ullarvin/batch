@echo off 
set /p "TYPE=Convert to what file type? [mp4, mp3, wav, avi, etc...] "

cd "%~dp0"

if not exist ".\converted\" mkdir ".\converted\"
for %%i in (%*) do  (
echo "%%i to %~dp0converted\%%~ni.%TYPE%"
"ffmpeg" -i %%i "%~dp0converted\%%~ni.%TYPE%"
)


ECHO -------------------------------------------------------------
ECHO                      F I N I S H E D
ECHO -------------------------------------------------------------
ECHO Press any key to exit...
Pause >nul

