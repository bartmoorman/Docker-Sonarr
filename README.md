### Docker Run
```
docker run \
--detach \
--name sonarr \
--publish 8989:8989 \
--volume sonarr-config:/config \
--volume /mnt/media:/mnt/media \
--volume sabnzbd-data:/sabnzbd-data \
--volume transmission-data:/transmission-data \
bmoorman/sonarr:latest
```

### Docker Compose
```
version: "3.7"
services:
  sonarr:
    image: bmoorman/sonarr:latest
    container_name: sonarr
    ports:
      - "8989:8989"
    volumes:
      - sonarr-config:/config
      - /mnt/media:/mnt/media
      - sabnzbd-data:/sabnzbd-data
      - transmission-data:/transmission-data

volumes:
  sonarr-config:
  sabnzbd-data:
  transmission-data
```
