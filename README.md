# pgadmin3-docker

Docker image for pgadmin3 in Ubuntu 16.04.

## Features

- Ubuntu 16.04
- pgadmin 1.22.0-1
- Chinese support.

## Usage
    #!/bin/sh
    POSTGREDB_DOCKER=osm-postgis
    docker run --rm -t -i --link ${POSTGREDB_DOCKER}:pg -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY=$DISPLAY chihchun/pgadmin3
