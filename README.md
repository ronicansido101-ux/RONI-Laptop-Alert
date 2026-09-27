# RONI Laptop Alert 💻📲

Windows 10/11 utility for sending Telegram notifications on Windows login and normal shutdown/restart events.

## Setup
1. Copy `config.example.bat` to `config.bat`.
2. Put your own Telegram bot token and chat ID in `config.bat`.
3. Run `install.bat` as Administrator.
4. Restart Windows to test the login alert.

## Security
Never publish `config.bat` or your bot token. `.gitignore` already excludes it.

## Files
- `install.bat` — installs both event triggers.
- `uninstall.bat` — removes them.
- `config.example.bat` — safe configuration template.
- `send_login.bat` — login sender.
- `send_shutdown.bat` — shutdown/restart sender.
- `scripts/send-telegram.ps1` — Telegram API helper.
- `LICENSE` — MIT.

Event 1074 covers normal user/application initiated shutdown or restart. Sudden power loss or a crash may not send a notification.

Use only on computers you own or are authorized to administer.
