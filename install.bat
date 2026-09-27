@echo off
setlocal
cd /d "%~dp0"
if not exist "config.bat" (
 echo Copy config.example.bat to config.bat and configure it first.
 pause
 exit /b 1
)
call config.bat
if "%BOT_TOKEN%"=="" goto bad
if "%CHAT_ID%"=="" goto bad
if "%BOT_TOKEN%"=="PASTE_YOUR_BOT_TOKEN_HERE" goto bad
if "%CHAT_ID%"=="PASTE_YOUR_CHAT_ID_HERE" goto bad

schtasks /Create /TN "RONI Laptop Alert - Login" /TR "\"%~dp0send_login.bat\"" /SC ONLOGON /F >nul
if errorlevel 1 goto fail

schtasks /Create /TN "RONI Laptop Alert - Shutdown" /TR "\"%~dp0send_shutdown.bat\"" /SC ONEVENT /EC System /MO "*[System[(EventID=1074)]]" /F >nul
if errorlevel 1 goto fail

echo Installation complete.
echo Sending a test notification...
call send_login.bat
pause
exit /b 0

:bad
echo Please configure config.bat first.
pause
exit /b 1

:fail
echo Installation failed. Try running this file as Administrator.
pause
exit /b 1
