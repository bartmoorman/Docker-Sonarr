### Build
```
docker build \
--tag sonarr \
https://github.com/iVirus/Docker.git#master:Sonarr
```

### Run
```
docker run \
--rm \
--detach \
--name sonarr \
--network backend \
--volume /mnt/sonarr:/data \
--volume /mnt/media:/media \
--volume /mnt/sabnzbd:/sabnzbd-data \
--volume transmission-public-data:/transmission-public-data \
--volume transmission-private-data:/transmission-private-data \
--publish 8989:8989 \
sonarr
```
