<#
.Synopsis
   Get list of all students.
.DESCRIPTION
   Returns the id, key ("matrikel-nr"), name (same as key), foreName, longName, and gender.
   No parameters needed, but login-session to WebUntis should exist.
.EXAMPLE
   Get-WebUntisStudents
   Returns full list of all students.
#>
function Get-WebUntisStudents
{
    [CmdletBinding()]   
    Param()
    Invoke-WebUntisRequest -Method "getStudents"
}