$a = 42
"a = $a"
'a = $a'
Write-Host "explicit cmdlet call"

# array @()
$arr = 12, "abc", 3.1
$arr2 = @(21, 12, "abc")
$arr[0]=21
$arr += "xyz"
$empty = @()
$empty += 2

# hash-table (key value pairs) @{}
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
  "key: $key, val: $($hero[$key])"
}

if ($hero.name -eq "Bruce Wayne") {
    "Batman!"
}
else {
    "Not my hero!"
}

For ($i = 1; $i -le 5; $i++) { 
    Test-Connection -ComputerName 127.0.0.$i -Count 1 
}

$arr = @(1,2,3,"abc")
foreach ($i in $arr) {
    $i
}

### pipeline

Get-Process | Select-Object -Property ProcessName,Id | 
  Where-Object {$_.ProcessName -eq "pwsh"} | Out-GridView

Get-Help Where-Object -Online

Get-Process | Where-Object Handles -GE 1000
