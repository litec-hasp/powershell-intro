## THIS MODULE FILE CONTAINS BASIC FUNCTIONALITY NEEDED FOR ALL SUB-FUNCTIONS
## important functions (which will be used often get their own ps1 file in subfolder)
#####################################################################################

<#
.Synopsis
   Basic function to retrieve any kind of data from webuntis.   
.DESCRIPTION
   Wrapper for Invoke-RestMethod function tailored for webuntis.
.EXAMPLE
   Invoke-WebUntisRequest -Method "getKlassen"
   Returns full list of all classes of the current school year, params optional.
.EXAMPLE
   Invoke-WebUntisRequest -Method "getKlassen" -Params @{}
   Returns full list of all classes of the current school year.
.EXAMPLE
   Invoke-WebUntisRequest -method "getKlassen" -Params @{"schoolyearId"="9"}
   Returns full list of all classes of the school year with id=9 (which is 2020/2021 @ litec).
#>
function Invoke-WebUntisRequest
{
    [CmdletBinding()]
   
    Param(
        [Parameter(Mandatory=$true)]
        [String]$Method,

        [Parameter(Mandatory=$false)] # should be a hashtable
        $Params = @{}
    )

    Begin
    {
        if (-not $global:webuntis.token) {
            Write-Error "You are not connected to WebUntis, try command Connect-WebUntis."
            return
        }
        
        $data = @{
            "id" = ($global:webuntis.token)
            "method" = $Method
            "params" = $Params
            "jsonrpc" = "2.0"
        }
        $jsonData = ConvertTo-Json $data

        $headers=@{
            "content-Type" = "application/json"
        }

        $reply =Invoke-RestMethod -Method POST -Uri ($global:webuntis.url) -Body $jsonData -Headers $headers -websession ($global:webuntis.session)

        if ($reply.error) {
            Write-Error $reply.error.message
        }
        else {
            $reply.result
        }        
    }
}

###############################################################################################
## the following functions are just small wrappers for simple request 
## which are expected to be seldom used

<#
.Synopsis
   Get list of all departments.
.DESCRIPTION
   Returns the id, name, and some additional infos.
   No parameters needed, but login-session to WebUntis should exist.
.EXAMPLE
   Get-WebUntisDepartments
   Returns full list of all departments.
#>
function Get-WebUntisDepartments
{
    [CmdletBinding()]   
    Param()
    Invoke-WebUntisRequest -Method "getDepartments"
}


<#
.Synopsis
   Get list of all Subjects.
.DESCRIPTION
   Returns the id, name, longname, and some additional infos.
   No parameters needed, but login-session to WebUntis should exist.
.EXAMPLE
   Get-WebUntisSubjects
   Returns full list of all subjects.
#>
function Get-WebUntisSubjects
{
    [CmdletBinding()]   
    Param()
    Invoke-WebUntisRequest -Method "getSubjects"
}


<#
.Synopsis
   Get list of all Rooms.
.DESCRIPTION
   Returns the id, name, longname, and some additional infos.
   No parameters needed, but login-session to WebUntis should exist.
.EXAMPLE
   Get-WebUntisRooms
   Returns full list of all rooms.
#>
function Get-WebUntisRooms
{
    [CmdletBinding()]   
    Param()
    Invoke-WebUntisRequest -Method "getRooms"
}