param ($monthmin = 1, $monthmax = 12, $daymin = 1, $daymax = 28, $year, $path = ".", $filecount)

$fileExt = ".txt"
$randomString = ([System.Guid]::NewGuid()).ToString()
$randomString = $randomString.Replace('-','')
$randomString = $randomString.Substring(0,10)

for ($i = 1; $i -le $filecount; $i++) {
    $date = "$((Get-Random -Minimum $monthmin -Maximum $monthmax).ToString('00'))/$((Get-Random -Minimum $daymin -Maximum $daymax).ToString('00'))/$year 00:00:00"
    $date = [datetime]::ParseExact($date, "MM/dd/yyyy h:mm:ss", $null)
    New-Item -Path $path -Name "$randomString _ $i$fileExt" -Value "this file is named $randomString _ $i$fileExt and it's creation and modification date is $date"
    Write-Host $date
    (Get-Item "$randomString _ $i$fileExt").CreationTime=($date)
    (Get-Item "$randomString _ $i$fileExt").LastWriteTime=($date)
}