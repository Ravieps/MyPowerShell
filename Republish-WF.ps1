Add-PSSnapin Microsoft.SharePoint.PowerShell
[System.Reflection.Assembly]::LoadWithPartialName("Microsoft.SharePoint.WorkflowServicesBase")

$webapp = Get-SPWebApplication  <Web App URL>

foreach ($site in $webapp.Sites)
{

foreach ($web in $site.allwebs)

{

$wfm = new-object Microsoft.SharePoint.WorkflowServices.WorkflowServicesManager($web)
$ds  = $wfm.GetWorkflowDeploymentService()
$col = $ds.EnumerateDefinitions($false)
$wss = $wfm.GetWorkflowSubscriptionService()

foreach($spworkflow in $col)
{
   Write-Output $spworkflow.DisplayName
   $ds.SaveDefinition($spworkflow)
   $ds.PublishDefinition($spworkflow.Id)
   $ws = $wss.EnumerateSubscriptionsByDefinition($spworkflow.Id)
   if($ws -ne $null)
   {
      $wss.PublishSubscription($ws[0])
   }
}

}

}