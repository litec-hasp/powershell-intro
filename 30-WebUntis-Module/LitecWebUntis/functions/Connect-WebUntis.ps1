<#
.Synopsis
   Login to WebUntis.
   WARNING: atm we are still working with global variables. @tbd: remove those / find alternative
.DESCRIPTION
   Create a session-id/authentification-token for a jsonrpc connection to WebUntis.
.EXAMPLE
   Connect-WebUntis -url "https://arche.webuntis.com/WebUntis/jsonrpc.do?school=litec" -Credential (Get-Secret -Name untisAdmin -Vault untisVault)
   Connects to LiTec's WebUntis instance, with the credentials taken from a Microsoft.PowerShell.SecretStore.
   It might be neccessary to unlock the vault by entering the masterkey word.
#>
function Connect-WebUntis
{
    [CmdletBinding()]
   
    Param
    (
        [Parameter(Mandatory=$false)]
        [String]$Url,

        [Parameter(Mandatory=$false)]
        [PSCredential]$Credential
    )

    Begin
    {
        if (-not $Url -or -not $Credential) {
            if ($global:webuntis) {
                $Url=$global:webuntis.url  
                $Credential = $global:webuntis.credential
            }
            else {
                # use litec (lazy) default values
                # @tbd consider to refine this (maybe url OR cred was given)!
                $Url = "https://arche.webuntis.com/WebUntis/jsonrpc.do?school=litec"
                $Credential = (Get-Secret -Name untisAdmin -Vault untisVault)
            }
        }

        $data= @{
            "id" = Get-Random
            "method" = "authenticate"
            "params" =@{
                "user" = $Credential.UserName
                "password" = $Credential.GetNetworkCredential().Password
                "client" = "ps"
            }
            "jsonrpc" = "2.0"
        }
        $jsonData = ConvertTo-Json $data

        $headers = @{
            "content-Type" = "application/json"
        }

        $reply = Invoke-RestMethod -Method POST -Uri $Url -Body $jsonData -Headers $headers -SessionVariable session
        #$session

        if ($reply.error) {
            Write-Verbose "Login failed!"
            Write-Error $reply.error.message;
        }
        else {
            Write-Verbose "Login successful!"
            if (-not $global:webuntis) {
                # @tbd: consider to use Set-Variable with global and read-only (problem: token change)
                $global:webuntis = @{
                    "url" = $Url
                    "credential" = $Credential
                    "session" = $session
                    "token" = ($reply.result.sessionId)
                }
            } else {
                # reconnection within the same powershell session, so we need to update some entries:
                # set new session and token (webuntis session id)
                $global:webuntis.session = $session
                $global:webuntis.token = $reply.result.sessionId
            }            
            $reply.result
        }
    }
}