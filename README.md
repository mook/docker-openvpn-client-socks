# OpenVPN-client

This is a docker image of an OpenVPN client tied to a SOCKS proxy server.  It is
useful to isolate network changes (so the host is not affected by the modified
routing).

## Usage

Preferably, using `start` in this repository:
```bash
start client_config.ovpn
```

Alternatively, using `docker run` directly:

```bash
docker run -t -i --device=/dev/net/tun --cap-add=NET_ADMIN \
    --volume client_config.ovpn:/ovpn.conf:ro \
    mook/openvpn-client-socks
```

### OpenVPN Configuration Constraints

- The configuration file must have embedded certificates; references to other
  files are not allowed.
- The configuration file must use `dev tun0`.
