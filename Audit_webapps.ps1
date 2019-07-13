$shellOutFilePath = "~/clouddrive/webapp_win_language_version.csv"
Get-AzContext -ListAvailable -PipelineVariable AzureRMSub | Set-AzContext | foreach{
Get-AzResource -ResourceType microsoft.web/sites -ExpandProperties -PipelineVariable webapp| select `
    @{n='SubscriptionName';e={$AzureRMSub.Name}}, `
    ResourceGroupName,Name, `
    @{n='Kind';e={(Get-AzResource -ResourceGroupName $webapp.ResourceGroupName -ResourceType microsoft.web/sites -Name $webapp.Name -ApiVersion 2018-02-01).kind}}, `
    @{n='linuxFxVersion';e={(Get-AzResource -ResourceGroupName $webapp.ResourceGroupName -ResourceType microsoft.web/sites/config -Name $webapp.Name -ApiVersion 2018-02-01).Properties.linuxFxVersion}}, `
    @{n='HTTPVersion';e={(Get-AzResource -ResourceGroupName $webapp.ResourceGroupName -ResourceType microsoft.web/sites/config -Name $webapp.Name -ApiVersion 2018-02-01).Properties.http20Enabled}}, `
    @{n='NetFrameworkVersion';e={(Get-AzResource -ResourceGroupName $webapp.ResourceGroupName -ResourceType microsoft.web/sites/config -Name $webapp.Name -ApiVersion 2018-02-01).Properties.netFrameworkVersion}}, `
    @{n='PhpVersion';e={(Get-AzResource -ResourceGroupName $webapp.ResourceGroupName -ResourceType microsoft.web/sites/config -Name $webapp.Name -ApiVersion 2018-02-01).Properties.phpVersion}}, `
    @{n='PythonVersion';e={(Get-AzResource -ResourceGroupName $webapp.ResourceGroupName -ResourceType microsoft.web/sites/config -Name $webapp.Name -ApiVersion 2018-02-01).Properties.pythonVersion}}, `
    @{n='JavaVersion';e={(Get-AzResource -ResourceGroupName $webapp.ResourceGroupName -ResourceType microsoft.web/sites/config -Name $webapp.Name -ApiVersion 2018-02-01).Properties.javaVersion}}, `
    @{n='MinTLsVersion';e={(Get-AzResource -ResourceGroupName $webapp.ResourceGroupName -ResourceType microsoft.web/sites/config -Name $webapp.Name -ApiVersion 2018-02-01).Properties.minTlsVersion}}, `
    @{n='HTTPSOnly';e={(Get-AzResource -ResourceGroupName $webapp.ResourceGroupName -ResourceType microsoft.web/sites -Name $webapp.Name -ApiVersion 2018-02-01).Properties.httpsOnly}}
    } | Export-Csv $shellOutFilePath -Append -NoTypeInformation
    

