$BASE_URL = "http://www.xkcd.com/"
$LIMIT = 500

$webClient = New-Object System.Net.WebClient
$webClient.Encoding = [System.Text.Encoding]::UTF8
$regex = [regex] '(?<=<title>)([\S\s]*?)(?=</title>)'

for($i = 1; $i -le $LIMIT; $i++) {
    $data = $webClient.downloadstring($BASE_URL+$i+"/")
    [string] $i + ";" + $regex.Match($data).value.trim() | Out-File -Append scraped.txt
}