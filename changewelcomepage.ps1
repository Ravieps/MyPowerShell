Add-PSSnapin *sh* -InformationAction SilentlyContinue

$web = Get-SPWeb https://sps2013-1/
$pages = $web.Lists | ?{$_.title -like "*pages*"}
$pages.items | select url

#check welcome page by below powershell

$root = $web.RootFolder
$root.WelcomePage

#To set welcome page to a different page do
#$root.WelcomePage = "url"
#$root.update()
