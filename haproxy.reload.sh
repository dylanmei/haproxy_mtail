#!/bin/bash

config=/etc/haproxy/haproxy.cfg

haproxy -c -f $config
retcode=$?
if [ $retcode != 0 ]; then
  exit $retcode
fi

pkill -SIGUSR2 ^haproxy-systemd
