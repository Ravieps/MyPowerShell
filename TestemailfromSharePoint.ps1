# check to ensure Microsoft.SharePoint.PowerShell is loaded 
 $snapin = Get-PSSnapin | Where-Object {$_.Name -eq 'Microsoft.SharePoint.Powershell'}
 if ($snapin -eq $null) {
 Write-Host "Loading SharePoint Powershell Snapin"
 Add-PSSnapin Microsoft.SharePoint.Powershell
 }

#Parameters
 While ($web -eq $null){
 $web = Get-SPWeb (Read-Host "Input SPWeb URL using http://")
 }

$email = (Read-Host "Input E-mail recipient")
$subject = (Read-Host "Input E-mail Subject")
$body = (Read-Host "Input E-mail Body")

#specify start time of action
 $StartTime = (Get-Date).AddMinutes(-1).ToString()
 

# Try sending e-mail via SharePoint.
 $send = [Microsoft.SharePoint.Utilities.SPUtility]::SendEmail($web,0,0,$email,$subject,$body)

#what to do if it fails
 if ($send -eq $false -and $web -ne $null){
 write-host "It didn't work, checking ULS for errors. Please stand by..." -foregroundcolor Red -backgroundcolor Yellow

#specify end time of action
 $EndTime = (Get-Date).AddMinutes(+1).ToString()

#make dir if it does not exist
 $TARGETDIR = "c:\logs"
 if(!(Test-Path -Path c:\logs)){
 New-Item -ItemType directory -Path $TARGETDIR
 }

#finding error and creating log
 start-sleep 5
 Get-SPLogEvent -StartTime $StartTime -EndTime $EndTime | Where-Object {$_.Category -eq "E-Mail"} | Export-Csv -LiteralPath "$TARGETDIR\log.csv"

#starting notepad to open log
 start notepad.exe "$TARGETDIR\log.csv"
 }

#what to do if it works
 else{
 if ($send -eq $true -and $web -ne $null){
 write-host "It Worked..Congrats!" -foregroundcolor DarkGreen -backgroundcolor White
 }
 }

$web.Dispose()
 