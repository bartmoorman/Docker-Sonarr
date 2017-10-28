```
docker run \
--rm \
--detach \
--name sonarr \
--hostname sonarr \
--network backend \
--volume /mnt/sonarr-data:/data \
--volume /mnt/media:/media \
--volume /mnt/sabnzbd-data:/sabnzbd-data \
--volume transmission-public-data:/transmission-public-data \
--volume transmission-private-data:/transmission-private-data \
--publish 8989:8989 \
bmoorman/sonarr
```
