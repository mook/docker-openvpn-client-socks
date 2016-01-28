#!/bin/sh
set -e
/etc/openvpn/up.sh "$@"
exec /usr/sbin/sockd -D
