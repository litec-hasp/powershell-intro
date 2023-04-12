<#
.Synopsis
   Get list of all teachers.
.DESCRIPTION
   Returns the id, name (UPIS), foreName, longName, title, active, and dids(?).
   As it seems dids is the departmend id list the teacher belongs to.
   No parameters needed, but login-session to WebUntis should exist.
.EXAMPLE
   Get-WebUntisTeachers
   Returns full list of all teachers.
#>
function Get-WebUntisTeachers
{
    [CmdletBinding()]   
    Param()
    Invoke-WebUntisRequest -Method "getTeachers"
}