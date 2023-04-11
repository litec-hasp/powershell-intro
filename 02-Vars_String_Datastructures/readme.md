# Variables in PowerShell

## and Strings and Datastructures

> - Link: [about Variables - PowerShell](https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_variables?view=powershell-7.2)
>  - German Doc (github only): [provider](../doc_ger/03-provider.md) and [programming](../doc_ger/05-programming.md)

---

## Overview <small>1/2</small>

- Nearly "everything" can be stored in variables in PS
  - result of command
  - object
  - elements that are used in commands
  - the classics: like strings, numbers, boolean, ...
- a unit of memory where values are stored
- start wit a `$`-sign
- are NOT case-sensitive (same as with all commands)
- direct assignment or Commands - see `Get-Command -Noun Variable`

---

## Overview <small>2/2</small>

- automatic [Types](https://learn.microsoft.com/en-us/powershell/scripting/lang-spec/chapter-04?view=powershell-7.3) or explicit (with [])
  - e.g `[int]$a=42` or `[String]$str="abc"`
- categories:
  - user created
  - [automatic](https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_automatic_variables?view=powershell-7.2) 
    - `$_`, `$True`, `$False`, `$HOME`, `$Host`
  - [environmental](https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_environment_variables?view=powershell-7.2)
    - e.g. `$Env:Path` and tryout: `cd Env:\; ls`
  - [preference](https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_preference_variables?view=powershell-7.2) ( customize the behavior of PowerShell)

---

## Strings and Quoting Rules

> Link: [quoting rules](https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_quoting_rules?view=powershell-7.2)

- string literals use single (`'`) or double quotation marks (`"`)
- double quoted:
  - expandable string (can contain variables, expressions, cmdlts)
- single quoted:
  - *verbatim* string - as is
- here string: 
  - surrounded by `@"..."@`
  - allows more lines
  - interprets quotes literally

---

## String examples

```powershell
# double quotes
$a = 5
"var: a = $a"
"backtick allows dollar sign: `$a = $a"
"expression: 40+2 = $(40+2)"
"member access: PS Version: $($PSVersionTable.PSVersion)"
"cmdlet: $(Get-Date) is now"

# single quotes
'$ is shown directly, so no $a...'
'quote: "i am a quote in quote"'

# here strings
@"
Use a quotation mark (' or ")
to begin a string.
"@
```

---

## Arrays

> Link:
>
> - [about Arrays](https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_arrays?view=powershell-7.3)
> - [everything about arrays](https://learn.microsoft.com/en-us/powershell/scripting/learn/deep-dives/everything-about-arrays?view=powershell-7.2)

- array can contain DIFFERENT types
- created by `@()` or directly assigned with comma as separator
  - or with range operator `..`
- array in array possible
- has own methods! (avoid)

---

### Array Examples

```powershell
# creation
$a = "abc", 1, 99, 3.1
$b = @()
$c = 1..5
$p = @(Get-Process code)
# add
$b += "added"
$b += 23
#change & access
$a[0..2]
$a[1]="x"
# methods
$b | Get-Member
$b.Clear()
```



---

## HashTables

> Links:
>  - [hastables](https://learn.microsoft.com/en-us/powershell/scripting/lang-spec/chapter-10?view=powershell-7.2)
>  - [everything about hash tables](https://learn.microsoft.com/en-us/powershell/scripting/learn/deep-dives/everything-about-hashtable?view=powershell-7.2)

- collection of *key/value* pairs
- type: `[Hastable]`
- created by `@{ key1=val1; key2=val2, ... }`
- access via `.`or`[]`

---

### HashTable Examples

```powershell
# creation
$hero = @{ name="Bruce Wayne"; born=1939; father="Bob Kane"}
# access
$hero.father
$hero["name"]
#add
$hero.enemy = "Joker"
# get keys
$hero.keys
# joker got finally killed
$hero.Remove("enemy")
# foreach
ForEach ($key in $hero.Keys) {
  "key: " + $key + ", val: " + $hero[$key]
}
```

---

## PSCustomObject

> - Link: [about PSCustomObject](https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_pscustomobject?view=powershell-7.3) 
> - Link: [everything about PSCustomObject](https://learn.microsoft.com/en-us/powershell/scripting/learn/deep-dives/everything-about-pscustomobject?view=powershell-7.2)

- it's a [Type Accelerator](https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_type_accelerators?view=powershell-7.3) (alias for .NET Framework classes)
- for easy conversion of hashtables
- a lot of `Get-...` cmdlet results are such objects

#### Examples

```powershell
# old way (PSObject)
$old=bj = New-Object -TypeName PSObject -Property @{one=1; two=2}
# new way
$newObj = [pscustomobject]@{one=1; two=2}
# details
$newObj | Get-Member
```
