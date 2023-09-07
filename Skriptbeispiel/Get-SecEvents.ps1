<#
.SYNOPSIS
 Abfrage von Security Events
.DESCRIPTION
 Abfrage von Anmelde / abmeldebezogenen Events
.PARAMETER EventId
 4624 | Anmeldung
 4625 | Anmeldung fehlgeschlagen
 4634 | Abmeldung
.EXAMPLE
Get-SecEvents.ps1 -Eventid 4634

   Index Time          EntryType   Source                 InstanceID Message
   ----- ----          ---------   ------                 ---------- -------
  570971 Sep 07 13:45  SuccessA... Microsoft-Windows...         4634 Ein Konto wurde abgemeldet....
  570968 Sep 07 13:45  SuccessA... Microsoft-Windows...         4634 Ein Konto wurde abgemeldet....
  570967 Sep 07 13:45  SuccessA... Microsoft-Windows...         4634 Ein Konto wurde abgemeldet....
  570966 Sep 07 13:45  SuccessA... Microsoft-Windows...         4634 Ein Konto wurde abgemeldet....
  570963 Sep 07 13:44  SuccessA... Microsoft-Windows...         4634 Ein Konto wurde abgemeldet.... 
.EXAMPLE
Get-SecEvents.ps1 -Eventid 4634 -Verbose
AUSFÜHRLICH: Es wurden folgende Werte angegeben: 4634 , 5 , localhost

   Index Time          EntryType   Source                 InstanceID Message
   ----- ----          ---------   ------                 ---------- -------
  570971 Sep 07 13:45  SuccessA... Microsoft-Windows...         4634 Ein Konto wurde abgemeldet....
  570968 Sep 07 13:45  SuccessA... Microsoft-Windows...         4634 Ein Konto wurde abgemeldet....
  570967 Sep 07 13:45  SuccessA... Microsoft-Windows...         4634 Ein Konto wurde abgemeldet....
  570966 Sep 07 13:45  SuccessA... Microsoft-Windows...         4634 Ein Konto wurde abgemeldet....
  570963 Sep 07 13:44  SuccessA... Microsoft-Windows...         4634 Ein Konto wurde abgemeldet....
.LINK
https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_comment_based_help?view=powershell-5.1#comment-based-help-keywords
#>
[cmdletbinding()]
param(
[Parameter(Mandatory=$true)]
[int]$Eventid,

[int]$Newest = 5,

[string]$Computername = "localhost"
)
Write-Verbose -Message "Es wurden folgende Werte angegeben: $Eventid , $Newest , $Computername"
Get-EventLog -LogName Security -ComputerName $Computername | Where-Object EventId -eq $Eventid | Select-Object -First $Newest

