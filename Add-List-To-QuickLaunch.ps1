$web= Get-SPWeb http://app/
$list = $web.lists["Ravi"]
$list.OnQuickLaunch = $true
$list.update()
