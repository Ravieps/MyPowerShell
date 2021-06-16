$cred= Add-PnPStoredCredential -Name https://tenantname.sharepoint.com/sites/sitename/ -Username user@tenantname.onmicrosoft.com -Password (ConvertTo-SecureString -String "*******" -AsPlainText -Force)

$siteurl="https://tenantname.sharepoint.com/sites/sitename/"

Connect-PnPOnline -Url $siteurl -Credentials $cred

$listName="New List"

New-PnPList -Title $listName -Url "List" -Template GenericList
