<#
.Synopsis
   Write WebUntis data from a request to csv file.   
.DESCRIPTION
   Takes data in form of a hashtable, and stores it within a csv file of the given path.
   the File is named with a leading date.
   Optionally (if -AsJson is set), it also stores a file with the samne name in json format.
   @tbd: add ValueFromPipeline=$true to data - beware of handling to get all elements
.EXAMPLE
   $teach = Get-WebUntisTeachers
   Write-WebUntisData2File -Data $teach -Name "teachers" -Path "C:\" -AsJson
   Fetches full list of all teachers, and pipes it to this function, stored as C:\<date>-teachers.csv and .json
#>
function Write-WebUntisData2File
{
    [CmdletBinding()] 
    
    Param(
        [Parameter(Mandatory=$true)]  $Data, #should be a hashtable!
        [Parameter(Mandatory=$true)]  [String]$Name,
        [Parameter(Mandatory=$true)]  [String]$Path,
        [Parameter(Mandatory=$false)] [Switch]$AsJson        
    )

    $date = Get-Date -Format "yyMMdd"    
    $Data | Export-Csv "$Path/$date-$Name.csv" -Delimiter ';' -NoTypeInformation -Encoding Unicode
    if($AsJson){
        $jsonData = $Data | ConvertTo-Json -Depth 100
        $jsonData | Out-File "$Path/$date-$Name.json"
        #$jsonData
    }
}
