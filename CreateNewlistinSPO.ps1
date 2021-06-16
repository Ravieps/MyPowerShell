#Set the Tenant credentials in $cred variable

$cred= Add-PnPStoredCredential -Name https://tenantname.sharepoint.com/sites/sitename/ -Username user@tenantname.onmicrosoft.com -Password (ConvertTo-SecureString -String "*******" -AsPlainText -Force)

#Store the site url in $site variable

$siteurl="https://tenantname.sharepoint.com/sites/sitename/"

#Connect to the tenant by passing the stored creds and site url

Connect-PnPOnline -Url $siteurl -Credentials $cred

#Store the list name

$listName="New List"

#Create the list

New-PnPList -Title $listName -Url "List" -Template GenericList
