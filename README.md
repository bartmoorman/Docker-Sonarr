```
docker run \
--rm \
--detach \
--init \
--name sonarr \
--network backend \
--volume /mnt/sonarr:/data \
--volume /mnt/media:/media \
--volume /mnt/sabnzbd:/sabnzbd-data \
--volume transmission-public-data:/transmission-public-data \
--volume transmission-private-data:/transmission-private-data \
--publish 8989:8989 \
bmoorman/sonarr
```
