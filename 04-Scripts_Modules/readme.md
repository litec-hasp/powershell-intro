# Scripts and Modules

> - Link: [Use functions and modules in Windows PowerShell scripts](https://learn.microsoft.com/en-us/training/modules/use-functions-modules-windows-powershell-scripts/)
> - German Docs (github only): [scripts_functions](../doc_ger/06-scripts_functions.md)

- write your own stuff (scripts)
- use existing modules
- create your own modules

---

## Overview

- **Scripts**: small repetitive tasks glued together in a script-file
- **Modules**:
  - Libraries
  - Collections of Cmdlets, Functions (and Scripts)

---

## Functions

- A block of reusable code
  - keyword `Function`
  - named by `Verb-Noun`
  - parameters
  - "return" values
- For details see german doc (github only):  [scripts_functions](../doc_ger/06-scripts_functions.md)
- Code Snippets: vs code ok, Powershell ISE better

---

### Function - Mini Example

```powershell
# a simple definition (with prefered param() block style)
Function Get-SystemEvent {
    [CmdletBinding()]
    Param (
       [string]$ComputerName
    ) #end Param
    Get-EventLog -LogName system -ComputerName $ComputerName -Newest 10
}
 
# call example
Get-SystemEvent -ComputerName $env:computername
```

---

## Scripts

- Example above can already be seen as a script
  - a collection of function(s) and single commands
  - and if and loop, ...
- just store it as an `.ps1`-file
- call it by using full or relative path
- lets try it out...
- oops, ExecutionPolicy doenst allow to start the script?
- ok, let's solve that problem 

---

### ExecutionPolicy <small>1/2</small>

> Link: [about_ExecutionPolicy](https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_execution_policies?view=powershell-7.2)

- safety "feature" to control the loading  of config files and running of scripts
- default setting is restrictive - to prevent the execution of harmful scripts
- can be set for machine /user /session
- policy is stored in registry
- non-Windows systems: only `Unrestricted` exists

| Policy         | Description                                                  |
| -------------- | ------------------------------------------------------------ |
| `AllSigned`    | Only scripts signed by a trusted publisher can be run.       |
| `Bypass`       | No restrictions; all Windows PowerShell scripts can be run.  |
| `RemoteSigned` | Downloaded scripts must be signed by a trusted publisher before they can be run. |
| `Restricted`   | No scripts can be run. Windows PowerShell can be used only in interactive mode. |
| `Unrestricted` | Similar to `Bypass` (If you run an unsigned script that was downloaded from the Internet, you are prompted for permission before it runs.) |

---

### ExecutionPolicy <small>2/2</small>

- Cmdlets: `Get-ExecutionPolicy` and `Set-ExecutionPolicy`
- "workaround" for single scripts: `pwsh -ExecutionPolicy Bypass .\script.ps1`

```powershell
# lets see the current policy
Get-ExecutionPolicy -List
# Set it to RemoteSigned (if we download modules they need to be signed)
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope LocalMachine
# or bypass for the current user (not recommended)
Set-ExecutionPolicy -ExecutionPolicy Bypass -Scope CurrentUser
```

---


### Debugging (Scripts and Functions)

> Link: [Troubleshoot scripts and handle errors in PowerShell](https://learn.microsoft.com/en-us/training/modules/troubleshoot-scripts-handle-errors-windows-powershell/)

- **Use VS Code!** 
  - `F5` and especially `F8` are your best friends (and breakpoints!)
- or add specific Output:

  | Cmdlet            | Description                                          |
  | :---------------- | :--------------------------------------------------- |
  | **Write-Verbose** | displayed only when you use the `-Verbose` parameter |
  | **Write-Debug**   | displayed only when you use the `-Debug` parameter   |

- this is also where [CmdletBindings()] comes in handy
  - allows usage of cmdlet default parameters
- or use Breakpoints: `Get-Help Set-PSBreakPoint -Examples`

---

## Use Existing Modules

> A *module* is a set of related Windows PowerShell functionalities, grouped together as a convenient unit (usually saved in a single directory)

### PowerShellGet

> Links:
>
> - [PowerShellGet Module - PowerShell | Microsoft Learn](https://learn.microsoft.com/en-us/powershell/module/powershellget/?view=powershell-7.2)

- **PowerShellGet** is a module with commands for discovering, installing, updating and publishing PowerShell artifacts like Modules and Scripts.

- Already installed!

---

### PSGallery

> Link: [PowerShell Gallery | Home](https://www.powershellgallery.com/)

- package repository containing scripts, modules, ...
- Use PowershellGet Commands with parameter `-Repository PSGallery`.
- Recommended way to use:
  1. Review:  use `Save-Module` to download and review the package
  2. Install: use `Install-Module` (if only for current user use `-Scope CurrentUser` Parameter)
  3. Use: `Import-Module`

---

### Command Overview

| Cmdlet                                                       | Description                                                  |
| ------------------------------------------------------------ | ------------------------------------------------------------ |
| [Find-Module](https://learn.microsoft.com/en-us/powershell/module/powershellget/find-module?view=powershell-7.2) | Finds modules in a repository that match specified criteria. |
| [Get-InstalledModule](https://learn.microsoft.com/en-us/powershell/module/powershellget/get-installedmodule?view=powershell-7.2) | Gets a list of modules on the computer that were installed by PowerShellGet. |
| [Get-PSRepository](https://learn.microsoft.com/en-us/powershell/module/powershellget/get-psrepository?view=powershell-7.2) | Gets PowerShell repositories.                                |
| [Install-Module](https://learn.microsoft.com/en-us/powershell/module/powershellget/install-module?view=powershell-7.2) | Downloads one or more modules from a repository, and installs them on the local computer. |
| [Register-PSRepository](https://learn.microsoft.com/en-us/powershell/module/powershellget/register-psrepository?view=powershell-7.2) | Registers a PowerShell repository.                           |
| [Set-PSRepository](https://learn.microsoft.com/en-us/powershell/module/powershellget/set-psrepository?view=powershell-7.2) | Sets values for a registered repository.                     |
| [Uninstall-Module](https://learn.microsoft.com/en-us/powershell/module/powershellget/uninstall-module?view=powershell-7.2) | Uninstalls a module.                                         |
| [Unregister-PSRepository](https://learn.microsoft.com/en-us/powershell/module/powershellget/unregister-psrepository?view=powershell-7.2) | Unregisters a repository.                                    |
| [Update-Module](https://learn.microsoft.com/en-us/powershell/module/powershellget/update-module?view=powershell-7.2) | Downloads and installs the newest version of specified modules from an online gallery to the local computer. |

---

### Mini-Workshop

> We want to install a Toast Notification Module.<br>
> (do not use prerelease!)

1. Head to [PowerShell Gallery | BurntToast 1.0.0-Preview1](https://www.powershellgallery.com/packages/BurntToast/1.0.0-Preview1) and have a look at it
2. `Save-Module -Name BurntToast -Path .`
3. Review the downloaded folder and files
4. Install Module for current user:<br> `Install-Module -Name BurntToast -Repository PSGallery -Scope CurrentUser`
5. *[optional] import it:* `Import-Module -Name Burntoast`
6. Use it!
   1. `Get-Command -Module BurntToast`
   2. or visit github: [Windos/BurntToast (github.com)](https://github.com/Windos/BurntToast)

---

## Write Your Own Modules

> Link: [Writing a Windows PowerShell Module](https://learn.microsoft.com/en-us/powershell/scripting/developer/module/writing-a-windows-powershell-module?view=powershell-7.2)

- create Modules to store functions "for sharing"
- for direct access store them in `$Env:PSModulePath`
  - Lets look at that: `$Env:PSModulePath -split ';'`
  - More than one folder!
    - for User and for Host (and for different Powershell Versions)
- cheap alternative: dot sourcing

---

### Dot Sourcing

- just add a dot and a space 
  - before a relative or absolute path to a function script
- import a script/functions into current scope (powershell session)
  - functions remains in session memory until console is closed
- load from local file or use Universal Naming Convention (UNC) path
- Example: `. .\Get-SystemEvent.ps1`

---

## Details on Modules

### 4 Basic Components

1. Some sort of **code** file (script or a managed cmdlet assembly)
2. **resources** - anything else that the above code file may need (additional assemblies, help files, or scripts).
3. A **manifest file** that describes the above files, as well as stores metadata such as author and versioning information.
4. A **directory** that contains all of the above content, and is located where PowerShell can reasonably find it.

---

### Types of Modules

- *Script modules* - a simple script file (just rename a script from `.ps1` to `.psm1`)
- Binary modules - a .NET Framework assembly (`.dll`)
- *Manifest modules* -  manifest file to describe all components and collection of files
- Dynamic modules - created dynamically by a script, using the `New-Module` cmdlet

---

### Module Manifest <small>1/2</small>

- A **module manifest** is a `.psd1` file that contains a hash table.
- The keys and values in the hash table do the following things:

- Describe the contents and attributes of the module.
- Define the prerequisites.
- Determine how the components are processed.

---

### Module Manifest <small>2/2</small>

- Stored Information:
  - Metadata -  module version number, the author, and the description.
  - Prerequisites needed to import the module (Windows PowerShell version, the common language runtime (CLR) version, required modules).
  - Processing directives, such as the scripts, formats, and types to process.
  - Restrictions on the members of the module to export, such as the aliases, functions, variables, and cmdlets to export.


- Sample: [How to Write a PowerShell Module Manifest](https://learn.microsoft.com/en-us/powershell/scripting/developer/module/how-to-write-a-powershell-module-manifest?view=powershell-7.3#sample-module-manifest)
- Tryout: `New-ModuleManifest -Path C:\myModuleName.psd1 -ModuleVersion "2.0" -Author "YourNameHere"`
- Details: [How to Write a PowerShell Module Manifest - PowerShell | Microsoft Learn](https://learn.microsoft.com/en-us/powershell/scripting/developer/module/how-to-write-a-powershell-module-manifest?view=powershell-7.2)

---

### Module Cmdlets and Variables

| Cmdlet / Variable                                            | Description                                                  |
| ------------------------------------------------------------ | ------------------------------------------------------------ |
| [New-Module](https://learn.microsoft.com/en-us/powershell/module/Microsoft.PowerShell.Core/New-Module) | creates a new dynamic module that exists only in memory.     |
| [New-ModuleManifest](https://learn.microsoft.com/en-us/powershell/module/Microsoft.PowerShell.Core/New-ModuleManifest) | creates a new module manifest (`.psd1`) file, populates its values, and saves the manifest file to the specified path. |
| [Import-Module](https://learn.microsoft.com/en-us/powershell/module/Microsoft.PowerShell.Core/Import-Module) | adds one or more modules to the current session.             |
| [Get-Module](https://learn.microsoft.com/en-us/powershell/module/Microsoft.PowerShell.Core/Get-Module) | retrieves information about the modules that have been or that can be imported into the current session. |
| [Remove-Module](https://learn.microsoft.com/en-us/powershell/module/Microsoft.PowerShell.Core/Remove-Module) | removes modules from the current session.                    |
| [Test-ModuleManifest](https://learn.microsoft.com/en-us/powershell/module/Microsoft.PowerShell.Core/Test-ModuleManifest) | verifies that a module manifest accurately describes the components of a module. |
| `$PSScriptRoot`                                              | contains the directory from which the script module is being executed. It enables scripts to use the module path to access other resources. |
| `$Env:PSModulePath`                                          | contains a list of the directories in which Windows PowerShell modules are stored. |
