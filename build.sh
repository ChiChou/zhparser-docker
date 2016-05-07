#!/bin/sh
echo downloading scws 1.2.3 and latest zhparser
[ -f scws-1.2.3.tar.bz2 ] || wget http://www.xunsearch.com/scws/down/scws-1.2.3.tar.bz2
[ -d scws-1.2.3 ] || tar -jxvf scws-1.2.3.tar.bz2
[ -f zhparser.zip ] || wget https://github.com/amutu/zhparser/archive/master.zip -O zhparser.zip
[ -d zhparser-master ] || unzip zhparser.zip
echo building docker image
docker build -t postgresql-zhparser .