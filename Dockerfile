FROM ubuntu:xenial
MAINTAINER Rex Tsai <rex.cc.tsai@gmail.com>

ENV DEBIAN_FRONTEND noninteractive
ENV HOME /root
RUN apt-get update && apt-get dist-upgrade -y && apt-get install -y vim

ENV PGADMINE3_VERSION 1.22.0-1
RUN apt-get install -y pgadmin3=$PGADMINE3_VERSION xterm fonts-droid-fallback && \
        rm -rf /var/lib/apt/lists/*

RUN adduser --quiet --disabled-password pgadmin3
USER pgadmin3
ENV HOME /home/pgadmin3
CMD sh -c 'set|grep ^PG; echo $PG_PORT_5432_TCP_ADDR:$PG_PORT_5432_TCP_PORT:*:postgres:$PG_ENV_POSTGRES_PASSWORD > ${HOME}/.pgpass; chmod 600 ${HOME}/.pgpass;echo "[Servers]\nCount=1\n[Servers/1]\nServer=$PG_PORT_5432_TCP_ADDR\nHostAddr=$PG_PORT_5432_TCP_ADDR\nPort=$PG_PORT_5432_TCP_PORT\nDatabase=postgres\nUsername=postgres\nGroup=Servers\nRestore=true\nStorePwd=true" > ${HOME}/.pgadmin3' && /usr/bin/pgadmin3
