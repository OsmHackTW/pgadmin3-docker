#!/bin/sh
POSTGREDB_DOCKER=${1:-"osm-postgis"}
docker run --rm -t -i --link ${POSTGREDB_DOCKER}:pg -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY=$DISPLAY osmtw/pgadmin3
