Save-Module -Name BurntToast -Path . -AllowPrerelease
Uninstall-Module -Name BurntToast
Install-Module -Name BurntToast -Repository PSGallery -Scope CurrentUser
Update-Module -Name BurntToast  -Force
Import-Module -Name Burntoast -Scope CurrentUser
Get-Command -Module BurntToast
Find-Module -Name BurntToast