# a simple definition (with prefered param() block style)
Function Get-SystemEvent {
    Param (
       [string]$ComputerName
    ) #end Param
    Get-EventLog -LogName system -ComputerName $ComputerName -Newest 10
}
 
# call example
Get-SystemEvent -ComputerName $env:computername