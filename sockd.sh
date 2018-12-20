#!/bin/sh
set -e
/etc/openvpn/up.sh "$@"
pidof sockd | xargs --no-run-if-empty kill -TERM
exec /usr/sbin/sockd -D
