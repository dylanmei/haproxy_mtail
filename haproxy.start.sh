#!/bin/bash

runner=/usr/local/sbin/haproxy-systemd-wrapper
config=/etc/haproxy/haproxy.cfg

[[ -f /etc/rsyslog.conf ]] && service rsyslog start
$runner -p /var/run/haproxy.pid -f $config
