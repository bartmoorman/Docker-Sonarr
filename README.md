```
docker run \
--rm \
--detach \
--init \
--name sonarr \
--hostname sonarr \
--volume sonarr-config:/config \
--volume /mnt/media:/mnt/media \
--volume sabnzbd-data:/sabnzbd-data \
--volume transmission-public-data:/transmission-public-data \
--volume transmission-private-data:/transmission-private-data \
--publish 8989:8989 \
bmoorman/sonarr
```
