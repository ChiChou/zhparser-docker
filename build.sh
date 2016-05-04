#!/bin/sh
echo downloading scws 1.2.3 and latest zhparser
wget http://www.xunsearch.com/scws/down/scws-1.2.3.tar.bz2
tar -jxvf scws-1.2.3.tar.bz2
wget https://github.com/amutu/zhparser/archive/master.zip -O zhparser.zip
unzip zhparser.zip
echo building docker image