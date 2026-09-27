@echo off
setlocal
call "%~dp0config.bat"
powershell.exe -NoProfile -ExecutionPolicy Bypass -File "%~dp0scripts\send-telegram.ps1" "Laptop login" "%BOT_TOKEN%" "%CHAT_ID%"
endlocal
