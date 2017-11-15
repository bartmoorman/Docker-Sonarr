#!/bin/bash
exec $(which mono) \
    /opt/NzbDrone/NzbDrone.exe \
    --data=/data \
    --nobrowser
