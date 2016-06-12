# OpenVPN-client

This is a docker image of an OpenVPN client tied to a SOCKS proxy server.  It is
useful to isolate network changes (so the host is not affected by the modified
routing).

This supports directory style (where the certificates are not bundled together in one `.ovpn` file) and those that contains `update-resolv-conf`

## Usage

Preferably, using `start` in this repository:
```bash
start /your/openvpn/directory
```

`/your/openvpn/directory` should contain *one* OpenVPN `.conf` file. It can reference other certificate files or key files in the same directory.

Alternatively, using `docker run` directly:

```bash
docker run -it --rm --device=/dev/net/tun --cap-add=NET_ADMIN \
    --name openvpn-client \
    --volume /your/openvpn/directory/:/etc/openvpn/:ro -p 1081:1080 \
    kizzx2/openvpn-client-socks
```

Then connect to SOCKS proxy through through `local.docker:1081`. For example:

```bash
curl --proxy socks5://local.docker:1081 ipinfo.io
```
