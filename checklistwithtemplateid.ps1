$wa = Get-SPWebapplication "https://sps2013-1" 
$sites = $wa.sites 
foreach ($site in $sites) 
{ 
$webs = $site.Allwebs 

foreach($web in $webs) 
{ 
   if($list = $web.lists | ? {$_.BaseTemplate -eq "101"})
  { 
     write-host "The list : $($list.title)" associated with below urls -ForegroundColor Cyan -BackgroundColor Black
     $($webs.url)

   } 


else { write-host "No list found with that template"} 

} 
} 

