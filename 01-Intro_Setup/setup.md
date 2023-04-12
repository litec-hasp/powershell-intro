# Setup Dev-Env for PowerShell

> [Install PowerShell on Windows, Linux, and macOS](https://learn.microsoft.com/en-us/powershell/scripting/install/installing-powershell?view=powershell-7.3)

---

## Details on Windows

1. [Install VS Code](https://code.visualstudio.com/Download) or ... `winget install vscode`
2. [Install Git](https://git-scm.com/downloads) or ... `winget install git.git`

   ```powershell
   git config --global user.name "Peter Haslinger"
   git config --global user.email hasp@litec.ac.at
   ```

3. [Install Powershell 7.3](https://learn.microsoft.com/en-us/powershell/scripting/install/installing-powershell?view=powershell-7.3) or ... `winget install Microsoft.PowerShell`
4. Install VsCode Plugins:

   ```powershell
   # markdown
   code --install-extension bierner.github-markdown-preview
   code --install-extension davidanson.vscode-markdownlint
   # git
   code --install-extension eamodio.gitlens
   code --install-extension mhutchie.git-graph
   code --install-extension ivangabriele.vscode-git-add-and-commit
   # powershell
   code --install-extension ms-vscode.powershell
   code --install-extension tylerleonhardt.vscode-inline-values-powershell
   code --install-extension vin-liberty.powershell-snippets
   ```

---

## Our First Mini-Workshop

- Get used to your tools!
- Playtime with VS-Code!
- No explanations here, just follow the leader...
