# Text to Speech Docker Command

## Fetch and run Kokoro server

```sh
docker run -d --name kokoro -p 8880:8880 ghcr.io/remsky/kokoro-fastapi-cpu:latest
```

1. Write text in `input.txt`
2. Invoke `./run.ps1` to generate `speech.mp3`

##

You can browse all voices by hitting http://localhost:8880/v1/audio/voices in your browser while the container is running.

## Stopping and removing

```sh
docker stop kokoro      # stop it
docker start kokoro     # start it again (no re-download, reuses existing container)
docker rm kokoro        # remove it entirely
```

