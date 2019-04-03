#!/usr/bin/env bash

# install python
yum update -y \
  && yum install -y yum-utils epel-release

/usr/bin/yum-builddep -y python \
  && curl -O https://www.python.org/ftp/python/3.7.2/Python-3.7.2.tgz \
  && tar -xf Python-3.7.2.tgz \
  && cd Python-3.7.2 \
  && ./configure --enable-optimizations \
  && make && make altinstall

# install tor and privoxy
yum install -y tor privoxy \
  && echo 'forward-socks5 / 127.0.0.1:9050 .' >> /etc/privoxy/config \
  && systemctl start tor \
  && systemctl enable tor \
  && systemctl start privoxy \
  && systemctl enable privoxy
