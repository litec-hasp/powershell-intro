<#
.Synopsis
   Get list of all Classes.
   @tbd change from schoolyearid to schoolyear string like "2020/2021" - sadly this needs Get-WebUntisSchoolYears (or stored csv-file).
.DESCRIPTION
   Returns the id, name, longname, active and id of class teacher.
   No parameters needed, but login-session to WebUntis should exist.
.EXAMPLE
   Get-WebUntisClasses
   Returns full list of all classes of the current school year.
.EXAMPLE
   Get-WebUntisClasses -SchoolYearId "9" 
   Returns full list of all classes of the school year with id=9 (which is 2020/2021 @ litec).
#>
function Get-WebUntisClasses
{
    [CmdletBinding()]
   
    Param(
        [Parameter(Mandatory=$false)]
        [String]$SchoolYearId
    )
    
    $params = @{}
    if($SchoolYearId) {
        $params.Add("schoolyearId",$SchoolYearId)
    } 

    Invoke-WebUntisRequest -Method "getKlassen" -Params $params
}