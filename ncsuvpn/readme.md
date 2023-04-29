# NCSU VPN Docker
This dockerfile builds a docker image that can be used to connect to the NCSU VPN. 
The pre-built image can be found on [Docker Hub](https://hub.docker.com/r/findhao/ncsuvpn/tags). You can pull the image by running `docker pull findhao/ncsuvpn:latest`.

```
docker run -d --name ncsu  --privileged -p 127.0.0.1:9000:9000 -p 127.0.0.1:8123:8123 -v custom.conf:/etc/unbound/unbound.conf.d/custom.conf -e OPTIONS="-u user_name --authgroup=2" -e SERVER=vpn_server -e PASSWORD="yourpassword\npush\n" -t findhao/ncsuvpn
```

More details could be found on [my blog](https://findhao.net/easycoding/2584).