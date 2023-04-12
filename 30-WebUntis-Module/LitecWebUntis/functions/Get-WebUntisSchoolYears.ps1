<#
.Synopsis
   Get list of all school years.
.DESCRIPTION
   Returns ....
   No parameters needed, but login-session to WebUntis should exist.
.EXAMPLE
   Get-WebUntisSchoolYears
   Returns full list of all classes of the current school year.
#>
function Get-WebUntisSchoolYears
{
    [CmdletBinding()]   
    Param()
    Invoke-WebUntisRequest -Method "getSchoolyears"
}