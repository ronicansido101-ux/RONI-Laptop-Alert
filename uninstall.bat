@echo off
schtasks /Delete /TN "RONI Laptop Alert - Login" /F >nul 2>&1
schtasks /Delete /TN "RONI Laptop Alert - Shutdown" /F >nul 2>&1
echo RONI Laptop Alert tasks removed.
pause
