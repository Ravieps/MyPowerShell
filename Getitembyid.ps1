$web = Get-SPWeb http://sps2013-1
$list = $web.lists["Infopath"]
$list.Items.GetItemById(1) | select DisplayName
