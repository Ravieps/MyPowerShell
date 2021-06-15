$web= Get-SPWeb http://app/
$list = $web.lists["Ravi"]
$list.Fields.Add("Name","Text",0)
$list.Fields.Add("Owner","User",0)


