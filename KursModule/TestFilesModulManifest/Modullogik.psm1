<#
.SYNOPSIS
 New Test Files
#>
function New-TestFiles
{
[cmdletBinding()]
param(
[Parameter(Mandatory=$true)]
[ValidateScript({Test-Path -Path $PSItem -Pathtype container})]
[string]$Path ,

[ValidateRange(1,20)]
[int]$FileCount = 9, 

[ValidateLength(5,20)]
[string]$FileBaseName = "File"
)

for($i = 1; $i -le $FileCount; $i ++)
{
    $filenumber = "{0:D2}" -f $i
    $filename = $FileBaseName + $filenumber + ".txt"

    New-Item -Path $Path -Name $filename -ItemType File
}
}

<#
.SYNOPSIS
 New Test Files mit Dir und root
#>
function New-TestFilesDir
{
[cmdletBinding()]
param(
[Parameter(Mandatory=$true)]
[ValidateScript({Test-Path -Path $PSItem -Pathtype container})]
[string]$Path ,

[ValidateRange(1,20)]
[int]$FileCount = 9, 

[ValidateRange(0,20)]
[int]$DirCount = 2,

[ValidateLength(5,20)]
[string]$DirName = "MTestFiles2",

[switch]$Force
)

if($Path.EndsWith("\") -ne $false)
{
    $Path += "\"
}

$TestDirPath = $Path + $DirName

if(Test-Path -Path $TestDirPath)
{
    if($Force)
    {
        Remove-Item -Recurse -Force -Path $TestDirPath
    }
    else
    {
        Write-Host -Object "Ordner vorhanden" -ForegroundColor Red
        exit
    }
}

$TestDir = New-Item -Path $Path -Name $DirName -ItemType Directory

New-TestFiles -Path $TestDir.FullName -FileCount $FileCount
<#ersetzt durch Function New-MTestFiles
for($i = 1; $i -le $FileCount; $i ++)
{
    $filenumber = "{0:D2}" -f $i
    $filename = "Datei" + $filenumber + ".txt"

    New-Item -Path $TestDir.FullName -Name $filename -ItemType File
}
#>

for($i = 1; $i -le $DirCount; $i ++)
{
    $DirNumber = "{0:D2}" -f $i
    $dirname = "Ordner" + $DirNumber
    $subdir = New-Item -Path $TestDir.FullName -Name $dirname -ItemType Directory

    New-TestFiles -Path $subdir.FullName -FileBaseName ($DirName + "Datei") -FileCount $FileCount
    <# Eresetzt durch Function New-MTestFiles
    for($j =1; $J -le $FileCount; $j++)
    {
        $filenumber = "{0:D2}" -f $j
        $filename = $DirName + "-Datei" + $filenumber + ".txt"

        New-Item -Path $Subdir.FullName -Name $filename -ItemType File
    }
    #>
}
}