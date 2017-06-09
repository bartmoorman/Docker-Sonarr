#!/bin/bash
exec $(which mono) \
    --debug \
    /opt/NzbDrone/NzbDrone.exe \
    -nobrowser \
    -data=/data
