#Get web

$web= Get-SPWeb http://app/

#Get list
$list = $web.lists["Ravi"]

#Get All items view
$views = $list.Views["All Items"]

#Add fields to the view
$views.ViewFields.Add("Name")
$views.ViewFields.Add("Owner")

#Update the view
$views.update()
