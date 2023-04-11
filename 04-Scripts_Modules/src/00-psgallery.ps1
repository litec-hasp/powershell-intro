# https://learn.microsoft.com/en-us/powershell/scripting/gallery/installing-psget?view=powershell-7.3
# https://learn.microsoft.com/en-us/powershell/scripting/gallery/getting-started?view=powershell-7.3

Set-PSRepository -Name PSGallery -InstallationPolicy Trusted

$Env:PSModulePath

# https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_execution_policies?view=powershell-7.3
# https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.security/set-executionpolicy?view=powershell-7.3
Get-ExecutionPolicy

# Invoke-Command

# locla modules
# https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/get-module?source=recommendations&view=powershell-7.3
Get-InstalledModule
Get-Module
Get-Module -ListAvailable

# "external" modules 
# https://learn.microsoft.com/en-us/powershell/module/powershellget/find-module?source=recommendations&view=powershell-7.3
Find-Module -Name Pester

# install
# https://learn.microsoft.com/en-us/powershell/scripting/developer/module/installing-a-powershell-module?view=powershell-7.3
