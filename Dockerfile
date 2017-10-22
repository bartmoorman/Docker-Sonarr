FROM ubuntu:xenial

ENV TZ="America/Denver" \
    LANG="en_US.UTF-8"

ARG DEBIAN_FRONTEND=noninteractive

RUN echo 'deb http://apt.sonarr.tv master main' > /etc/apt/sources.list.d/sonarr.list && \
    apt-key adv --keyserver keyserver.ubuntu.com --recv-keys FDA5DFFC && \
    apt-get update && \
    apt-get dist-upgrade --yes && \
    apt-get install --yes --no-install-recommends tzdata locales ca-certificates libcurl3 nzbdrone && \
    locale-gen en_US.UTF-8 && \
    apt-get autoremove --yes --purge && \
    apt-get clean && \
    rm --recursive --force /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY sonarr/ /etc/sonarr/

VOLUME /data

CMD ["/etc/sonarr/start.sh"]

EXPOSE 8989
