# MS Graph with Powershell Core

![](https://docs.microsoft.com/en-us/graph/images/microsoft-graph.png)

[Microsoft Graph overview](https://docs.microsoft.com/en-us/graph/overview)

---

## Prerequisites (Windows) *[optional]*

1. Package Installer: [WinGet](https://docs.microsoft.com/en-us/windows/package-manager/winget/) or chocolatey
   - WinGet is going to be default soon, so lets use it...
   - If you are on Win11 you should already have it, in case older win 10 see link above to install it (via app installer in MS Store)
   - A small WinGet Cheat Sheet:

       ```powershell
       winget list # list local installed package(s)
       winget upgrade # list local updateable packages
       winget update <packagename|Id> # performs update to latest version
       winget search <packagename> # search for installable packages
       winget install <packagename> # command says it all
       winget uninstall <packagename> # command says it allwinget u
       ```

2. Start up a powershell console and install PowerShell CORE and windows terminal

   ```powershell
   winget install Microsoft.PowerShell
   winget install Microsoft.WindowsTerminal.Preview
   ```

3. Switch to Terminal, and use it from now on. (different CLIs with tabs, context menu in file explorer, ... )

---

## Setup

> [Install the Microsoft Graph PowerShell SDK | Microsoft Docs](https://docs.microsoft.com/en-us/powershell/microsoftgraph/installation?view=graph-powershell-1.0)

Without explanations (see link directly above if you want to know more)

```powershell
Install-Module PowerShellGet -Force 
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
Install-Module Microsoft.Graph -Scope CurrentUser
```

---

## Tutorials

> - [Get started with the Microsoft Graph PowerShell SDK](https://docs.microsoft.com/en-us/powershell/microsoftgraph/get-started?view=graph-powershell-1.0)
> - [Build PowerShell scripts with Microsoft Graph](https://docs.microsoft.com/en-us/graph/tutorials/powershell?tabs=aad%2Cwindows)

### Head Over to

- [MsGraph-Intro Slides](https://litec-hasp.github.io/MSGraph-intro/)
- or github: [Ms-Graph-Intro](https://github.com/litec-hasp/MSGraph-intro)
