get-azcontext -listavailable -pipelinevariable AzureRMSub | set-azcontext | foreach {

    $azsectask = get-azsecuritytask

    $azsectask | where RecommendationType -EQ  "Diagnostics logs in Key Vault should be enabled" | foreach {

        Write-host "$($_.ResourceId)"

        $_ | select `

            @{n='Sub';e={$_.ResourceId.split('/')[-7]}}, `

            @{n='Kvname';e={$_.ResourceId.split('/')[-1]}}

    } | export-csv ~/clouddrive/kvdiags.csv -Append -NoTypeInformation

}
