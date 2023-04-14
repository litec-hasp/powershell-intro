Get-Help Get-Command -online
Select-MgProfile -Name "beta"
Connect-MgGraph -Scopes "User.ReadWrite.All"
Select-MgProfile -Name "beta"

Get-Command -Module *Graph*
Get-Command -Noun *MgUser*
Get-Help Get-MgUser -Examples

Get-MgUser  | Format-List  ID, DisplayName, Mail, UserPrincipalName, CompanyName
Get-MgUser -UserId 1678b740-7d7d-4f97-849b-d9687b5844e8 | Select-Object -Property *

$heinz = Get-MgUser | Select-Object -Property * | Where-Object {$_.DisplayName -like "*Heinz*" }
$heinz.Mail
$heinzId = $heinz.Id
Update-MgUser -UserId $heinzId -CompanyName "HTL Steyr"
Get-Command -Verb Update -Noun *MgUser*
get-Help Update-MgUser -examples
$heinz.CompanyName

$heinz2 = Get-MgUser -UserId $heinz.Id 
$heinz2 | Out-GridView

Disconnect-MgGraph
