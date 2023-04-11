BeforeAll {
    Write-Host --> Script Root: $PSScriptRoot
    . $PSScriptRoot/Get-Tomato.ps1
}

Describe "Tomatoes" {
    It "Get Tomato" {
        $tomato = Get-Tomato
        $tomato.Name | Should -Be "Tomato"
    }

    It "Save tomato" {
        Mock -CommandName New-Item -MockWith {}
        Save-Tomato "my tomato"
        Should -Invoke -CommandName New-Item -Times 1 -Exactly
    }
}