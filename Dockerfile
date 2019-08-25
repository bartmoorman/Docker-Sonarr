FROM bmoorman/ubuntu:bionic

ENV SONARR_PORT="8989"

ARG DEBIAN_FRONTEND="noninteractive"

RUN echo 'deb http://apt.sonarr.tv master main' > /etc/apt/sources.list.d/sonarr.list \
 && apt-key adv --keyserver keyserver.ubuntu.com --recv-keys EFD15863FDA5DFFC \
 && echo 'deb https://download.mono-project.com/repo/ubuntu stable-bionic main' > /etc/apt/sources.list.d/mono-official-stable.list \
 && apt-key adv --keyserver keyserver.ubuntu.com --recv-keys A6A19B38D3D831EF \
 && apt-get update \
 && apt-get install --yes --no-install-recommends \
    curl \
    libcurl4 \
    nzbdrone \
 && apt-get autoremove --yes --purge \
 && apt-get clean \
 && rm --recursive --force /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY sonarr/ /etc/sonarr/

VOLUME /config

EXPOSE ${SONARR_PORT}

CMD ["/etc/sonarr/start.sh"]

HEALTHCHECK --interval=60s --timeout=5s CMD curl --head --insecure --silent --show-error --fail "http://localhost:${SONARR_PORT}/" || exit 1
