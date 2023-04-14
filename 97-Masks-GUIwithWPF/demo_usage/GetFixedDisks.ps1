# taken from: https://adamtheautomator.com/build-powershell-gui/
# work dir: https://techblog.dorogin.com/powershell-current-directory-relative-to-executing-script-e0647aa6e898
# first one that really worked ^^

Add-Type -AssemblyName PresentationFramework

Function Get-FixedDisk {
    [CmdletBinding()]
    
    param (
        [Parameter(Mandatory)]
        [string]$Computer  # e.g. $env:computername
    )

    # WMI query command which gets the list of all logical disks and saves the results to a variable named $DiskInfo    
    $DiskInfo = Get-WmiObject Win32_LogicalDisk -ComputerName $Computer -Filter 'DriveType=3'

    $DiskInfo
}

# XAML (GUI) File
$scriptDirPath = Split-Path -parent $MyInvocation.MyCommand.Definition
$xamlFile = (Join-Path  $scriptDirPath "GUI_GetFixedDisks.XAML")

#create window
$inputXML = Get-Content $xamlFile -Raw
$inputXML = $inputXML -replace 'mc:Ignorable="d"', '' -replace "x:N", 'N' -replace '^<Win.*', '<Window'
[XML]$XAML = $inputXML

#Read XAML
$reader = (New-Object System.Xml.XmlNodeReader $xaml)
try {
    $window = [Windows.Markup.XamlReader]::Load( $reader )
} catch {
    Write-Warning $_.Exception
    throw
}

# Create variables based on form control names.
# Variable will be named as 'var_<control name>'

$xaml.SelectNodes("//*[@Name]") | ForEach-Object {
    #"trying item $($_.Name)"
    try {
        Set-Variable -Name "var_$($_.Name)" -Value $window.FindName($_.Name) -ErrorAction Stop
    } catch {
        throw
    }
}
Get-Variable var_*

$var_btnQuery.Add_Click( {
    #clear the result box
    $var_txtResults.Text = ""
    
    if ($result = Get-FixedDisk -Computer $var_txtComp.Text) {
        foreach ($item in $result) {
            $var_txtResults.Text = $var_txtResults.Text + "DeviceID: $($item.DeviceID)`n"
            $var_txtResults.Text = $var_txtResults.Text + "VolumeName: $($item.VolumeName)`n"
            $var_txtResults.Text = $var_txtResults.Text + "FreeSpace: $($item.FreeSpace)`n"
            $var_txtResults.Text = $var_txtResults.Text + "Size: $($item.Size)`n`n"
        }
    }       
})

$var_txtComp.Text = $env:COMPUTERNAME

$Null = $window.ShowDialog()