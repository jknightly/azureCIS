# Azure CIS
Powershell scripts to report and remediate on components from the CIS benchmarks for Azure.
Scripts are intended to run in the Azure CloudShell using the AZ PowerShell module. Any outputs will be written to CloudDrive

As of 6/12/19 the AZ.security module is not yet native in CloudShell. Run "Import-module Az.Security" into your cloudshell before executing.

Scripts with names starting with "remediate" will make changes! Be sure to validate before executing. These are stored in the "Remediation" folder. 

Information about CIS Benchmarks for Azure can be found here: https://azure.microsoft.com/en-us/resources/cis-microsoft-azure-foundations-security-benchmark/

To enforce benchmarks to new deployments use Azure Policy. See this repo for some great examples: https://github.com/mrajess/Azure-Policy-CIS

For information on making sure all VMs are protected by Azure Security Center, see here: https://techcommunity.microsoft.com/t5/Security-Identity/Identify-Azure-VMs-which-are-not-monitored-by-Security-Center/td-p/733672 
