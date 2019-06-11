get-azcontext -listavailable -pipelinevariable AzureRMSub | set-azcontext | foreach {
    $azsectask = get-azsecuritytask
    $azsectask | where RecommendationType -EQ  "Require secure transfer to storage account" | foreach {
        Write-host "$($_.ResourceId)"
        $_ | select `
            @{n='Sub';e={$_.ResourceId.split('/')[-7]}}, `
            @{n='SAName';e={$_.ResourceId.split('/')[-1]}}
    } | export-csv ~/clouddrive/sahttps.csv -Append -NoTypeInformation
}

