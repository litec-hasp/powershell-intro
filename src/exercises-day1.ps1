Get-Command -Noun *JSON*
# what about ConvertTo-Json?
#Get-Help ConvertTo-Json -online

# ok, lets get some process info...
Get-Process -Name pwsh 
| Select-Object -Property Description, CPU, Company, Handles
| ConvertTo-JSON
| Out-File ./pwsh-process.json