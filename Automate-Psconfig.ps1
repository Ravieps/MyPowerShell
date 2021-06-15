$taskaction = New-ScheduledTaskAction -Execute "Powershell.exe" -Argument C:\scripts\psconfig.ps1
$runat = New-ScheduledTaskTrigger -Daily -At 11am
Register-ScheduledTask -Action $taskaction -Trigger $runat -TaskName "Products config wizard" -Description "This will trigger psconfig"