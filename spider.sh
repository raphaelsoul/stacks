#!/usr/bin/env bash

# install python
yum update -y \
  && yum install -y yum-utils epel-release \
  && yum-buillddep -y python \
  && curl -O https://www.python.org/ftp/python/3.7.2/Python-3.7.2.tgz \
  && tar -xf Python-3.7.2.tgz \
  && cd Python-3.7.2 \
  && ./configure \
  && make && make install \
  && echo "alias python='/usr/local/bin/python3'" > /etc/profile.d/python.sh \
  && chmod 755 /etc/profile.d/python.sh \
  && source /etc/profile.d/python.sh \

# install tor and privoxy
  && yum install -y tor privoxy \

# configure privoxy
  && echo 'forward-socks5 / 127.0.0.1:9050 .' >> ./config \

# enable and start services
  && systemctl start tor \
  && systemctl enable tor \

  && systemctl start privoxy \
  && systemctl enable privoxy
