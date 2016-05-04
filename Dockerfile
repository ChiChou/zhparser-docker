FROM postgres:9.5
WORKDIR "/tmp"
ADD scws-1.2.3/ /tmp/scws
ADD zhparser-master /tmp/zhparser
RUN apt-get update && apt-get install -y gcc make postgresql-server-dev-9.5
RUN cd scws && ./configure --prefix=/usr/local/lib/scws-1.2.3 && make && make install
RUN cd zhparser && SCWS_HOME=/usr/local/lib/scws-1.2.3 make && make install
ADD init.sql /docker-entrypoint-initdb.d/