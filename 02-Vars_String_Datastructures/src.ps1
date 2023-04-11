### STRING ###

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

### ARRAY ###

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

### HASHTABLE ###

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

### PSCUSTOMOBJECT ###

# old way (PSObject)
$old=bj = New-Object -TypeName PSObject -Property @{one=1; two=2}
# new way
$newObj = [pscustomobject]@{one=1; two=2}
# details
$newObj | Get-Member