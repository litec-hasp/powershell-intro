---
src: herdt ps5.1
title: scripts and functions summary
---

# Skripten (scripts) und Funktionen

## Scripts

- Spätestens nun ist es Zeit für VSCODE!
  - plugin: `ms-vscode.powershell`
- Dateiendung: `.ps1` 
  - (`ps` war schon für postscript vergeben...)
  - Ich wäre für `.posh` gewesen ;) - siehe [Posh Definition & Meaning - Merriam-Webster](https://www.merriam-webster.com/dictionary/posh)

- Ausführung mit Angabe von relativen (`.\myscript.ps1`) oder absoluten Pfad
  - Liegt Pfad als String vor - Ausführung mit `&`vorangestellt
  - Bsp: `& "$HOME\ps\myscipt.ps1"`

---

## Functions

- Schlüsselwort: `Function`
- Bezeichner in Form `Verb-Noun`
- Parameter(liste): 
  - direkt nach Bezeichner oder "innerhalb" (siehe später)
  - `switch`-Parameter möglich
  - Default-Values optional
  - Typ-Parametrisierung optional
  - Pipelines optional
- Rückgabe: `Return`
- Siehe auch virtuelles Laufwerk `Function:\`: `Get-ChildItem Function:\`

Beispiel:

```powershell
# "simple" function
Function Get-LargeFiles ($location = "C:\Windows", $length = 1MB, [switch]$Recurse = $False) 
{ 
  Get-ChildItem $location -Recurse:$Recurse | Where-Object {$_.length -ge $length} 
}
# call
Get-LargeFiles 
Get-LargeFiles –location $HOME
Get-LargeFiles –location $HOME -length 500MB -Recurse

# special info
(Get-Item Function:\Get-LargeFiles).Definition
```

---

### Pipeline

- Jede Funktion kann Eingaben von Pipeline akzeptieren
  - Schlüsselwörter (als Block) `Begin, Process, End`
  - Zugriff auf aktuellen Pipeline-Wert via `$_` (in `Process`)
  - `Begin,End`werden nur 1x ausgeführt
  - `Process` bearbeitete alle Eingaben
  - Man muss nicht alle Codeblöcke angeben!
- Alternative: **Filter**
  - Schlüsselwort: `filter`
  - Entspricht Pipe-Funktion mit `Process` ohne `Begin, End`

Beispiel:

```powershell
# pipe function
Function Out-Pipe {
  Begin { 
    Write-Host "Big files are red!" 
  }
  Process {
    If ($_.length -lt 1MB) {
      $_ 
    } 
    Else { 
      #not working: Write-Host -BackgroundColor Red $_
      $defaultCol = $host.UI.RawUI.BackgroundColor 
 	  $host.UI.RawUI.BackgroundColor = "Red"
 	  $_ 
      $host.UI.RawUI.BackgroundColor = $defaultCol
    }
  } 
  End { 
    Write-Host "Finished!"
  } 
}

#call
Get-ChildItem C:\Windows | Out-Pipe
```

---

### Funktionen dokumentieren

- "Help your Functions to work with `Get-Help`!" 
- Direkt vor der Funktion kommentieren mit `<# .... #>`

Ein laaanges Code-Snippet:

```powershell
<#
.Synopsis
   Short description
.DESCRIPTION
   Long description
.EXAMPLE
   Example of how to use this cmdlet
.EXAMPLE
   Another example of how to use this cmdlet
.INPUTS
   Inputs to this cmdlet (if any)
.OUTPUTS
   Output from this cmdlet (if any)
.NOTES
   General notes
.COMPONENT
   The component this cmdlet belongs to
.ROLE
   The role this cmdlet belongs to
.FUNCTIONALITY
   The functionality that best describes this cmdlet
#>
function Verb-Noun
{
    [CmdletBinding(DefaultParameterSetName='Parameter Set 1', 
                  SupportsShouldProcess=$true, 
                  PositionalBinding=$false,
                  HelpUri = 'http://www.microsoft.com/',
                  ConfirmImpact='Medium')]
    [Alias()]
    [OutputType([String])]
    Param
    (
        # Param1 help description
        [Parameter(Mandatory=$true, 
                   ValueFromPipeline=$true,
                   ValueFromPipelineByPropertyName=$true, 
                   ValueFromRemainingArguments=$false, 
                   Position=0,
                   ParameterSetName='Parameter Set 1')]
        [ValidateNotNull()]
        [ValidateNotNullOrEmpty()]
        [ValidateCount(0,5)]
        [ValidateSet("sun", "moon", "earth")]
        [Alias("p1")] 
        $Param1,

        # Param2 help description
        [Parameter(ParameterSetName='Parameter Set 1')]
        [AllowNull()]
        [AllowEmptyCollection()]
        [AllowEmptyString()]
        [ValidateScript({$true})]
        [ValidateRange(0,5)]
        [int]
        $Param2,

        # Param3 help description
        [Parameter(ParameterSetName='Another Parameter Set')]
        [ValidatePattern("[a-z]*")]
        [ValidateLength(0,15)]
        [String]
        $Param3
    )

    Begin
    {
    }
    Process
    {
        if ($pscmdlet.ShouldProcess("Target", "Operation"))
        {
        }
    }
    End
    {
    }
}
```

- `CmdletBinding`: [about Functions CmdletBindingAttribute](https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_functions_cmdletbindingattribute?view=powershell-7.3)
- `Param`: [about Functions Advanced Parameters](https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_functions_advanced_parameters?view=powershell-7.3)

---

### Klassen

- "just to mention them..."

Code Snippet:

```powershell
class TypeName
{
   # Property with validate set
   [ValidateSet("val1", "Val2")]
   [string] $P1

   # Static property
   static [hashtable] $P2

   # Hidden property does not show as result of Get-Member
   hidden [int] $P3

   # Constructor
   TypeName ([string] $s)
   {
       $this.P1 = $s       
   }

   # Static method
   static [void] MemberMethod1([hashtable] $h)
   {
       [TypeName]::P2 = $h
   }

   # Instance method
   [int] MemberMethod2([int] $i)
   {
       $this.P3 = $i
       return $this.P3
   }
}
```

