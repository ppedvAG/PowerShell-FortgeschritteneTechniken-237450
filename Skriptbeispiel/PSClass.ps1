enum Antrieb
{
    Elektrisch
    Verbrenner
    Hybrid
    Wasserstoff = 99
}

enum Fortbewegung
{
    fliegen
    schwimmen
    amphybisch
    fahren
}

class Fahrzeug
{

[Antrieb]$Antrieb

[int]$Leistung

[Fortbewegung]$Fortbewegung
}

class Auto : Fahrzeug
{
[int]$Sitzplätze
[string]$Marke
[int]$VMAx
[int] hidden $kmCounter

Auto()
{}

Auto([string]$Marke)
{
    $this.Marke = $Marke
}

fahre([int]$Speed , [int]$Strecke)
{
    Clear-Host
    $straße = "-🚗-"
    for($i = 1; $i -le $strecke; $i ++)
    {
        $this.kmCounter++
        Clear-Host
        $straße = " - " + $straße
        Write-Host -Object $straße
        Start-Sleep -Milliseconds (200 - $Speed)
    }
}

[string] ToString()
{
    $ausgabe = $this.Marke + " | VMAx: " + $this.VMAx
    return $ausgabe
}
}

$BMW = [Auto]::new("BMW")
$BMW.Antrieb = [Antrieb]::Verbrenner
$BMW.Fortbewegung = [FortBewegung]::fahren
$BMW.Leistung = 252
#$BMW.Marke = "BMW"
$BMW.Sitzplätze = 5
$BMW.VMAx = 260

$BMW


