$web = Get-SPWeb http://sps2013-1/
 
#Get the Contacts List
$List = $web.Lists["Documents"]
$ListItems = $List.items

#This logic will change specific item Title

$item = $listitems.GetItemById(1)
$item["Title"] = "Changed"
$item.Update()

  
#This logic will update all the list items title present in the list
foreach($Item in $ListItems)
{    
    
    $item["Title"] = "Title Updated Again!"
  
   
    $item.Update()
}
