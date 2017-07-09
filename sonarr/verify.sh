#!/bin/bash
doLog () {
    cat <<EOM>> /data/verify.log
-=-=-=-=-=-
[$1]
$(date)
-=-=-=-=-=-
Dst Path: $sonarr_episodefile_path
Src Path: $sonarr_episodefile_sourcepath

Dst SHA1: $sonarr_episodefile_sha1
Src SHA1: $sonarr_episodefile_sourcesha1
EOM
}

if [ "$sonarr_eventtype" == "Download" ]; then
    sonarr_episodefile_sha1=$(sha1sum "$sonarr_episodefile_path" | awk '{print $1}')
    sonarr_episodefile_sourcesha1=$(sha1sum "$sonarr_episodefile_sourcepath" | awk '{print $1}')

    if [ "$sonarr_episodefile_sha1" != "$sonarr_episodefile_sourcesha1" ]; then
        doLog ERROR
    else
        doLog INFO
    fi
fi
