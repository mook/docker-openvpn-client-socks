#!/bin/sh
set -e
# Ensure external connections via docker network find their way back
docker_ip=$(ip addr show eth0 | awk '$1 == "inet" {gsub(/\/.*$/, "", $2); print $2}')
docker_gw=$(ip route | awk '/default/ {print $3}')
ip rule add from "$docker_ip" table 10
ip route add table 10 default via "$docker_gw" table 10

/etc/openvpn/up.sh "$@"
pidof sockd | xargs --no-run-if-empty kill -TERM
exec /usr/sbin/sockd -D
