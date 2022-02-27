# OpenVPN-client

This is a docker image of an OpenVPN client tied to a SOCKS proxy server.  It is
useful to isolate network changes (so the host is not affected by the modified
routing).

## Usage

Preferably, use docker-compose
```yaml
version: '3.3'
services:
    openvpn-client-socks:
        build: .
        cap_add:
          - NET_ADMIN
        devices:
            - /dev/net/tun
        ports:
            - '1081:1080'
        env_file:
          - .env
        volumes:
            - ./vpn.ovpn:/vpn/ovpn.conf
```

Alternatively, using `docker run` directly:

```bash
docker run -t -i --device=/dev/net/tun --cap-add=NET_ADMIN \
    --publish 127.0.0.1:1080:1080 \
    --volume client_config.ovpn:/vpn/ovpn.conf:ro \
    -e USER=ahh \
    -e PASSWORD=ahh \
    mook/openvpn-client-socks
```

### OpenVPN Configuration Constraints

- The configuration file must have embedded certificates; references to other
  files are not allowed.
- The configuration file must use `dev tun0`.

