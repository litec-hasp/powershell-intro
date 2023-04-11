# type ps-var to see snippet in action
# run the code by pressing F5
# set a breakpoint before Write-Output

$var1 = "a string"
$var2 = 'string too'
$var3 = 3.1415
$var4 = 1.1

$var5 = $var3 + $var4

Write-Output '$var1 $var2 $var5'
Write-Output "$var1 $var2 $var5" # string concatination

# ENV
# https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_environment_variables?view=powershell-7.3
$Env:PROCESSOR_ARCHITECTURE
$ENV:SystemRoot
$ENV:OS