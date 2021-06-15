Add-PSSnapin *sh*

$web = Get-SPWebApplication
Write-Output "`nList of All Web apps is:`n" $web >>C:\Data.txt


$site = Get-SPSite -Limit All | Get-SPWeb -Limit All
Write-Output "`nList of All Site collections and subsites`n" >>C:\Data.txt
$site | select title,url >> C:\Data.txt
Foreach($s in $site)
{
Write-Output "Below lists belongs to :" $s.Title >>C:\Data.txt
$s.Lists | select Title,id,parentweb,parentweburl,itemcount >> C:\Data.txt

}