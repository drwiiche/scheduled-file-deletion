# scheduled-file-deletion
script to automate the entire process of scheduling a file deletion task in Windows

create a script to automate the entire process of scheduling a file deletion task in Windows. This can be useful if you need to schedule multiple file deletions or if you want to run the command from a script or batch file.

```powershell
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


Here's what the script does:

Specifies the path to the file you want to delete ($filePath).
Sets the date and time for the file deletion ($deleteTime).
Assigns a name and description for the scheduled task ($taskName and $taskDescription).
Creates a new scheduled task action to run the cmd.exe command with the del command to delete the file.
Creates a scheduled task trigger to run the task once at the specified date and time.
Creates settings for the scheduled task.
Creates a new principal (user account) for the scheduled task, using the SYSTEM account.
Registers the scheduled task with the specified action, trigger, settings, and principal.

To use this script, save it as a .ps1 file (e.g., ScheduleFileDelete.ps1), and then open PowerShell as an administrator. Navigate to the folder where you saved the script and run it with the following command:
