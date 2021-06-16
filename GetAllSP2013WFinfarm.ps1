asnp *sh*
$WebApps = Get-SPWebApplication
foreach($webApp in $WebApps)
 {
  # Get All Site Collection
  foreach ($spSite in $webApp.Sites)
{
    # get the collection of webs
    foreach($spWeb in $spSite.AllWebs)
      {
      $wfm = New-object Microsoft.SharePoint.WorkflowServices.WorkflowServicesManager($spWeb)
      $wfsService = $wfm.GetWorkflowSubscriptionService()
      foreach ($spList in $spWeb.Lists)
           {
        $subscriptions = $wfsService.EnumerateSubscriptionsByList($spList.ID)
        

         foreach ($subscription in $subscriptions)
             {

        $subscription | select id,Name
        
             }  
           } 
       }
  }
     }
        

    