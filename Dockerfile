FROM bmoorman/ubuntu:xenial

ARG DEBIAN_FRONTEND="noninteractive"

RUN echo 'deb http://apt.sonarr.tv master main' > /etc/apt/sources.list.d/sonarr.list \
 && apt-key adv --keyserver keyserver.ubuntu.com --recv-keys FDA5DFFC \
 && apt-get update \
 && apt-get install --yes --no-install-recommends \
    curl \
    libcurl3 \
    nzbdrone \
 && apt-get autoremove --yes --purge \
 && apt-get clean \
 && rm --recursive --force /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY sonarr/ /etc/sonarr/

VOLUME /config

EXPOSE 8989

CMD ["/etc/sonarr/start.sh"]

HEALTHCHECK --interval=60s --timeout=5s CMD curl --silent --location --fail http://localhost:8989/ > /dev/null || exit 1
