# azureCIS
Powershell scripts to report on components from the CIS benchmarks for Azure
Scripts are intended to run in the Azure CloudShell using the AZ PowerShell module. Any outputs will be written to CloudDrive

As of 6/12/19 the AZ.security module is not yet native in CloudShell. Run "Import-module Az.Security" into your cloudshell before executing.

Scripts with names starting with "remediate" will make changes! Be sure to validate before executing. 
