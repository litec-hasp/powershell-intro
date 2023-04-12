# taken from https://herringsfishbait.com/2016/03/18/powershell-a-function-template/

# for approved verbs see https://docs.microsoft.com/en-us/powershell/scripting/developer/cmdlet/approved-verbs-for-windows-powershell-commands?view=powershell-7.1

<#
.SYNOPSIS
   <short descr>   
.DESCRIPTION
   <longer descr>
.EXAMPLE 
   Verb-Noun -Parameter param1
   <explantion of example>
.NOTES
  author: HASP
  version: 0.1
#>
function Verb-Noun
{
    [CmdletBinding()]
    param
    (
        # <param explanation>
        [Parameter(Mandatory=$true, ValueFromPipeline=$true)]
        [Alias('Alias')]
        [PSObject]$SourceObject
    )
    BEGIN
    {
        Write-Verbose "$((Get-Date).ToShortDateString()) : Started running $($MyInvocation.MyCommand)"
        #Initialise Variables
    }
    PROCESS
    {
        #Get data from object depending on type
        If ($SourceObject -is [String])
        {
        }
        #Code to check for passed parameter name
        if (!($PSBoundParameters.ContainsKey('PSTExportFolder')))
        {
        }
    }
    END
    {
        
    }
}