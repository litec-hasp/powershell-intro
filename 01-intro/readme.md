# Introduction to PowerShell

> - Course: [Automate administrative tasks by using PowerShell](https://learn.microsoft.com/en-us/training/paths/powershell/)
> - Also worth a visit: [Getting Started with PowerShell](https://learn.microsoft.com/en-us/powershell/scripting/learn/ps101/01-getting-started)
> - German Docs (via github): [Cmdlets](../doc_ger/01-cmdlets.md) / [Pipeline](../doc_ger/02-pipeline.md)

---

## [What is PowerShell](https://learn.microsoft.com/en-us/training/modules/introduction-to-powershell/)

- command-line shell
- scripting language
- run commands on **local** or **remote** machines
- for
  - DevOps
  - Admins of Azure, Azure AD, AD, Teams, SharePoint, ...
- cross platform
  - core version also for *nix systems
- "interwoven" with .NET

---

### Features

- built-in help system (`Get-Help` cmdlet)
- pipelines
  - output of one command is input for next one (`|`)
- operates on objects over texts
- cmdlets (pronounced *commandlets*)
  - common runtime instead of  sperate executables
  - build on [.NET Core](https://learn.microsoft.com/en-us/dotnet/core/introduction)
  - "create your own cmdlets"
- scripts
- functions
- modules (bundles)

---

### History

- 2006 - Powershell v1.0
- 2009 - Powershell v2.0 - integral part of Win7 nad Windows Server 2008 R2
- 2016 - Powershell became open source - "PowerShell Core"
  - published on github: [PowerShell/PowerShell: PowerShell for every system! (github.com)](https://github.com/PowerShell/PowerShell)
  - based on .NET Core
  - support for *nix systems
  - Last Windows Powershell Version: 5.1 (based on .NET Framework)
- 2023: PowerShell Core v7.3

<small> Source: [PowerShell - Wikipedia](https://en.wikipedia.org/wiki/PowerShell)</small>

---

### First Baby-Steps

1. Fire up a CLI (PowerShell, Terminal, terminal within vscode, ...)
2. Tryout the code snippets below

```powershell
## Powershell Version - an object
$PSVersionTable

# object properties
$PSVersionTable.PSVersion

# case sensitive? nope - give it a try:
$psversiontable
```

---

### Cmdlets <small>1/2</small>

- compiled commands
- thousands exist - challenge is to find and use the right one(s)
- naming standard: **VERB-NOUN**
  - easy to understand
  - use *approved* verbs!

```powershell
### list of approved verbs
Get-Verb

### list of all (currently) available cmdlets on your system
Get-Command
# list too long? try to break it down with parameters
Get-Command -Verb Get -Noun AD*

### help system
Get-Help <cmdlet>
# alias (like man, also use q to leave help)
help
# tryout cmdlet below and get help on help (see extra parameters)
Get-Help help
```

---

### Cmdlets <small>2/2</small>

- command response is an object
  - often contains many properties
- `Get-Member` will help you to nail those down
- we will also use our first Piping!

```powershell
### properties of an object (result of Get-Process)
Get-Process | Get-Member

### hmm, Get-Process looks nice, lets have a closer look
Get-Process

### always Get is boring, lets find other Process cmdlets
Get-Command -ParameterType Process
Stop-Process -ProcessName pwsh
# oops (or did you use vscode?)
```

---

## [Discover Commands](https://learn.microsoft.com/en-us/training/modules/discover-commands)

- maybe you noticed that `Get-Help` asked to install the help system
  - can also be done manually: `Update-Help -UICulture en-US` (or `de-DE`)
  - `-UI-Culture` is optional on windows, but needed on *nix systems
- Help sections:
  - NAME, SYNTAX, ALIAS, REMARKS, PARAMETERS
- Filter help response:
  - `-Full`, `-Detailed`, `-Examples`, `-Online`, `-Parameter <name>`

---

### Filter a Get-Member Result by Using Select-Object

- when you run `Get-Member`, the result is *verbose*
  - many rows are returned
- With `Select-Object` cmdlet, you can choose columns
  - either use a comma-separated list of column names or
  - a wildcard character - asterisk (`*`) for all columns.

```powershell
### wow! double-pipes!
Get-Process -Name pwsh | Get-Member | Select-Object Name, MemberType
```
