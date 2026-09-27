@echo off
setlocal
call "%~dp0config.bat"
powershell.exe -NoProfile -ExecutionPolicy Bypass -File "%~dp0scripts\send-telegram.ps1" "Laptop shutdown/restart" "%BOT_TOKEN%" "%CHAT_ID%"
endlocal