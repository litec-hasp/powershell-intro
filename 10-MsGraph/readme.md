# MS Graph with Powershell Core

![](https://docs.microsoft.com/en-us/graph/images/microsoft-graph.png)

[Microsoft Graph overview](https://docs.microsoft.com/en-us/graph/overview)

---

## Tutorials

> - [Get started with the Microsoft Graph PowerShell SDK](https://docs.microsoft.com/en-us/powershell/microsoftgraph/get-started?view=graph-powershell-1.0)
> - [Build PowerShell scripts with Microsoft Graph](https://docs.microsoft.com/en-us/graph/tutorials/powershell?tabs=aad%2Cwindows)

### For a Start Head Over to...

- [MsGraph-Intro Slides](https://litec-hasp.github.io/MSGraph-intro/)
- or github: [Ms-Graph-Intro](https://github.com/litec-hasp/MSGraph-intro)

---

## Lab Setup *[optional]*

- Let'S create a Lab Setup (Azure AD, ...) Test Environment

- We will join the MS Developer Program

- Follow this guide: [Microsoft 365 Developer Program | Microsoft Learn](https://learn.microsoft.com/en-us/office/developer-program/microsoft-365-developer-program)

---

## Setup PowerShell Graph API

> [Install the Microsoft Graph PowerShell SDK | Microsoft Docs](https://docs.microsoft.com/en-us/powershell/microsoftgraph/installation?view=graph-powershell-1.0)

Without explanations (see link directly above if you want to know more)

```powershell
Install-Module PowerShellGet -Force 
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
Install-Module Microsoft.Graph -Scope CurrentUser
```
