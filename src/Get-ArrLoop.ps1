function Get-ArrLoop {
    [CmdletBinding()]
    param (
        
    )
    Write-Verbose "Verb: arr created"
    $arr = 1,2,3

    foreach ($i in $arr) {
        Write-Debug "Loop"
        Write-Host $i
    }

    Write-Verbose "finished"
}
