# Path to the file you want to delete
$filePath = "C:\Path\To\File.txt"

# Date and time to delete the file (MM/DD/YYYY HH:MM:SS)
$deleteTime = "08/06/2024 11:31:00"

# Task name and description
$taskName = "Delete File"
$taskDescription = "Delete a file at a scheduled time"

# Create a new scheduled task
$task = New-ScheduledTaskAction -Execute 'cmd.exe' -Argument "/c del /f /q `"$filePath`""
$trigger = New-ScheduledTaskTrigger -Once -At $deleteTime
$settings = New-ScheduledTaskSettingsSet
$principal = New-ScheduledTaskPrincipal -UserId "SYSTEM" -LogonType ServiceAccount

Register-ScheduledTask -Action $task -Trigger $trigger -Settings $settings -Principal $principal -TaskName $taskName -Description $taskDescription
