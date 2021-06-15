[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
Install-PackageProvider -Name NuGet
Install-Module -Name SqlServer -AllowClobber -Force

$instance = "SQL2014"
$database = "WSS_Content_pwa"
$table = "Alllists"

$data = Read-SqlTableData -ServerInstance $instance -DatabaseName $database -SchemaName "dbo" -TableName $table | ?{$_.tp_servertemplate -eq "121"}
$data | Out-GridView