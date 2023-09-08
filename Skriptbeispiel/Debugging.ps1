[cmdletBinding()]
param(
[Parameter(Mandatory=$True)]
[ValidateSet("Green","Magenta","Cyan")]
[string]$Color,

[ValidateRange(2,10)]
[int]$RandomCount = 4
)

$Dienste = Get-Service

for($i = 1; $i -le $RandomCount; $i++)
{
    Write-Debug -Message "in For Schleife"
    $Dienst = Get-Random -InputObject $Dienste 
    Write-Host -Object $Dienst.Name -ForegroundColor $Color
}