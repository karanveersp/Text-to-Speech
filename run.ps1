param(
    [Parameter(Mandatory=$true)]
    [string]$Name
)

# Build output path with auto-incrementing index if file already exists
$outputDir = "outputs"
$candidate = "$outputDir/$Name.mp3"

if (Test-Path $candidate) {
    $index = 1
    while (Test-Path "$outputDir/${Name}_$index.mp3") {
        $index++
    }
    $candidate = "$outputDir/${Name}_$index.mp3"
}

# Generate speech
$text = Get-Content "input.txt" -Raw
$body = @{ model="kokoro"; input=$text; voice="am_michael"; response_format="mp3"; speed=0.9 } | ConvertTo-Json

Invoke-RestMethod -Uri "http://localhost:8880/v1/audio/speech" `
    -Method POST `
    -ContentType "application/json" `
    -Body $body `
    -OutFile $candidate

Write-Host "Saved: $candidate"