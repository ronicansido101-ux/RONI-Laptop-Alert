param(
 [string]$EventName,
 [string]$BotToken,
 [string]$ChatId
)
$time = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
$computer = $env:COMPUTERNAME
$user = $env:USERNAME
if ($EventName -eq "Laptop login") {
 $emoji = "🟢"
} else {
 $emoji = "🔴"
}
$message = "$emoji $EventName`nComputer: $computer`nUser: $user`nTime: $time"
$uri = "https://api.telegram.org/bot$BotToken/sendMessage"
try {
 Invoke-RestMethod -Uri $uri -Method Post -Body @{chat_id=$ChatId; text=$message} | Out-Null
} catch {
 exit 1
}
