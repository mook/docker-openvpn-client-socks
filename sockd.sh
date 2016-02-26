#!/bin/bash
set -e
[ -f /etc/openvpn/up.sh ] && /etc/openvpn/up.sh "$@"
/usr/sbin/sockd -D
