#!/bin/sh
echo $USER > /tmp.txt
echo $PASSWORD >> /tmp.txt
openvpn \
--config /vpn/ovpn.conf \
--auth-user-pass /tmp.txt \
--up /usr/local/bin/sockd.sh \
--script-security 2 