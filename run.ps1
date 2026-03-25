$text = Get-Content "input.txt" -Raw
$body = @{ model="kokoro"; input=$text; voice="am_michael"; response_format="mp3"; speed=0.9 } | ConvertTo-Json
Invoke-RestMethod -Uri "http://localhost:8880/v1/audio/speech" `
  -Method POST `
  -ContentType "application/json" `
  -Body $body `
  -OutFile "speech.mp3"