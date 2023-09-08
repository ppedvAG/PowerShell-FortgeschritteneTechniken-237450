[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

function Set-ConSoleColorProfile
{
$ShellSitzung =  $Host.UI.RawUI

$ShellSitzung.WindowTitle= "StefanO Shell"
$ShellSitzung.BackgroundColor = "White"
$ShellSitzung.ForegroundColor = "Black"
if((Get-Command Set-PSReadLineOption).Version.Major -lt 2)
{
Write-Verbose "PSReadlineV1"
Set-PSReadlineOption -TokenKind Command   -ForegroundColor DarkBlue
Set-PSReadlineOption -TokenKind Parameter -ForegroundColor Blue
Set-PSReadlineOption -TokenKind Number    -ForegroundColor DarkRed
Set-PSReadlineOption -TokenKind Member    -ForegroundColor Gray
}
else
{
Write-Verbose "PSReadlineV2"
Set-PSReadLineOption -Colors @{"Parameter" = [ConsoleColor]::Blue
                               "Command"   = [Consolecolor]::DarkBlue
                               "Number"    = [Consolecolor]::DarkRed
                               "Member"    = [ConsoleColor]::Gray
                               "String"    = [Consolecolor]::DarkGreen
                               "Comment"   = [ConsoleColor]::Green
                               "Keyword"   = [ConsoleColor]::Magenta
                               "None"      = [ConsoleColor]::Black
                               "Operator"  = [ConsoleColor]::DarkMagenta
                               "Type"      = [ConsoleColor]::Cyan
                               "Variable"  = [ConsoleColor]::DarkCyan}
}
Clear-Host
}

function Get-Motd
{
if(Test-NetConnection -InformationLevel Quiet)
{
    [string[]]$Urls = " https://catfact.ninja/fact" , "http://numbersapi.com/random"
    $Uri = Get-Random -InputObject $Urls
    
    $fact = Invoke-RestMethod -Uri $Uri
    Write-Host -Object "MOTD: " -NoNewline
    $fact
}

}

function prompt
{
$message = "[" + $env:COMPUTERNAME + "] "
Write-Host -Object $message -NoNewline
}

Set-ConSoleColorProfile
Get-Motd

