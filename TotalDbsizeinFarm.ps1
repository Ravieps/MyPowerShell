asnp *sh*

$dbs = Get-SPDatabase
$count=0
Foreach($db in $dbs)

{
     
     $count = $count + ("{0:N2}" -f ($db.DiskSizeRequired/1gb))
     
     

}

write-host The total databases space is : $count GB -BackgroundColor DarkCyan -ForegroundColor Green



