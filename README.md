# Docker OpenVPN

## Quick Start

```console
$ docker run --name openvpn -p 1194:1194 -v /my/own/datadir:/a/config --privileged=true adito/openvpn
```