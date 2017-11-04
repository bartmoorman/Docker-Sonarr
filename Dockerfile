FROM bmoorman/ubuntu

ARG DEBIAN_FRONTEND="noninteractive"

RUN echo 'deb http://apt.sonarr.tv master main' > /etc/apt/sources.list.d/sonarr.list && \
    apt-key adv --keyserver keyserver.ubuntu.com --recv-keys FDA5DFFC && \
    apt-get update && \
    apt-get dist-upgrade --yes && \
    apt-get install --yes --no-install-recommends nzbdrone libcurl3 && \
    apt-get autoremove --yes --purge && \
    apt-get clean && \
    rm --recursive --force /var/lib/apt/lists/* /tmp/* /var/tmp/*

VOLUME /data

CMD ["mono", "/opt/NzbDrone/NzbDrone.exe", "--nobrowser", "--data=/data"]

EXPOSE 8989
