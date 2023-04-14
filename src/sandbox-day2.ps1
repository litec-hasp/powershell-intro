# FUNCTIONS

# a simple definition (with prefered param() block style)
Function Get-SystemEvent {
    [CmdletBinding()]
    Param (
       [string]$ComputerName
    ) #end Param
    Get-EventLog -LogName system -ComputerName $ComputerName -Newest 10
}
 
# call example
Get-SystemEvent -ComputerName $env:computername

Get-ExecutionPolicy -List
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope LocalMachine

Get-Command -Noun *Module*

Get-PSRepository
Save-Module -Name BurntToast -Path . -Repository PSGallery
Install-Module -Name BurntToast -Repository PSGallery -Scope CurrentUser
$Env:PSModulePath -split ';'

# teams
a02857b8-c5a8-458e-9ad4-b1a7cbface49
#channel
19:5d0e40d1f97246eba007bd8330ab5e67@thread.tacv2

Find-Module Microsoft.Graph*

Install-Module -Name Microsoft.Graph.Users -Scope CurrentUser
Install-Module -Name Microsoft.Graph.Teams -Scope CurrentUser

Get-InstalledModule