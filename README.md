### Usage
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
