#!/bin/bash

VERSION=$1

# install deps
yum install -y wget gcc make tcl

# install redis
wget http://download.redis.io/releases/redis-$VERSION.tar.gz
tar xzf redis-$VERSION.tar.gz
cd redis-$VERSION
make

# config file -> /etc/redis.conf
touch /var/log/redis.conf
mkdir /var/lib/redis
sed -e "s/^daemonize no$/daemonize yes/" -e "s/^dir \.\//dir \/var\/lib\/redis\//" -e "s/^loglevel debug$/loglevel notice/" -e "s/^logfile stdout$/logfile \/var\/log\/redis.log/" redis.conf > /etc/redis.conf

# create init.d script
cd /etc/init.d
wget https://raw.githubusercontent.com/zhuqling/autosetup/master/scripts/centos-redis-init
mv centos-redis-init redis
chmod u+x redis

# chkconfig
chkconfig --add redis
chkconfig redis on

# start server
/etc/init.d/redis start



