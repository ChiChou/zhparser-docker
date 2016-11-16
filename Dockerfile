FROM postgres:9.6

ENV SCWS_VERSION 1.2.3
RUN apt-get update && apt-get install -y --no-install-recommends ca-certificates wget \
    && apt-get install -y tar make gcc
RUN apt-get install -y postgresql-server-dev-$PG_MAJOR
RUN mkdir build \
    && cd build \
    && wget -q -O - http://www.xunsearch.com/scws/down/scws-$SCWS_VERSION.tar.bz2 | tar xjf -  \
    && wget -q -O - https://github.com/amutu/zhparser/archive/master.tar.gz | tar xzf - \
    && cd scws-$SCWS_VERSION ; ./configure ; make install ; cd .. \
    && rm -rf scws-$SCWS_VERSION
RUN cd zhparser-master ; SCWS_HOME=/usr/local make && make install ; cd .. \
    && rm -rf zhparser-master
RUN apt-get purge -y --auto-remove ca-certificates wget postgresql-server-dev-$PG_MAJOR make gcc
ADD init.sql /docker-entrypoint-initdb.d/