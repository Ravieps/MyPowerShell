$list = (Get-SPWeb http://app).lists["Ravi"]
For($i=1;$i -le 5000; $i++)
{


$item = $list.items.add()
$item["Title"] = "Item Title" + $i
$item["Name"] = (Get-random -Input "Value1", "Value2","Value3")
$item.update()


}
