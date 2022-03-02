#!/usr/bin/env bash
exec $(which mono) \
    /usr/lib/sonarr/bin/Sonarr.exe \
    --data=/config \
    --nobrowser
