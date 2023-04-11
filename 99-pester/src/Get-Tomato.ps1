Function Get-Tomato() {
    New-Object psobject -property @{ Name = "Tomato" }
}

Function Save-Tomato() {
    Param(
      [string] $Name
    )
    New-Item -ItemType File -Path ./Tomato.txt -Value $Name -Force
 }