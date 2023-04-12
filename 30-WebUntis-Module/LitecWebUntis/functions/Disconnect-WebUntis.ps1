<#
.Synopsis
   Logout of WebUntis.
.DESCRIPTION
   Use the exisiting authentication id to end the jsonrpc connection to WebUntis.
.EXAMPLE
   Disconnect-WebUntis
   Logout of any exisitng webuntis session instance.
#>
function Disconnect-WebUntis
{
    [CmdletBinding()]
    Param()
    Invoke-WebUntisRequest -Method "logout"
}