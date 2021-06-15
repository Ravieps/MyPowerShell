asnp *sh*


$web = Get-SPWeb http://app/
$web.lists.add("Ravi", "test list", "GenericList")
$list = $web.lists["Ravi"]


