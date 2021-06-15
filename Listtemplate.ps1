$web = Get-SPWeb http://app/
$web.ListTemplates | select DocumentTemplate,InternalName, Name, BaseType,schemaXml | Out-GridView