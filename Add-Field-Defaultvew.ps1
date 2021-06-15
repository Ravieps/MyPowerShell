$web= Get-SPWeb http://app/
$list = $web.lists["Ravi"]
$views = $list.Views["All Items"]
$views.ViewFields.Add("Name")
$views.ViewFields.Add("Owner")
$views.update()
