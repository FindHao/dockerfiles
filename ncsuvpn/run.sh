#!/bin/bash

if [ "$UNBOUND" = "true" ]; then
	echo "Starting unbound..."
	unbound -vv -d -c /etc/unbound/unbound.conf &
	echo "nameserver 127.0.0.1" > /etc/resolv.conf
fi

if [[ (-n "${HTTP_PROXY_USERNAME:-}") && (-n "${HTTP_PROXY_PASSWORD:-}")  ]]; then
    echo "Setting up HTTP proxy with authentication ..."
    echo "BasicAuth ${HTTP_PROXY_USERNAME} ${HTTP_PROXY_PASSWORD}" >> /etc/tinyproxy/tinyproxy.conf
fi

echo "Setting up HTTP proxy ..."
echo "Port 8123" >> /etc/tinyproxy/tinyproxy.conf
echo "Upstream socks5 127.0.0.1:9000" >> /etc/tinyproxy/tinyproxy.conf
tinyproxy -c /etc/tinyproxy/tinyproxy.conf &
sleep 5

echo "Starting openconnect"
echo -n -e "${PASSWORD}" | /usr/sbin/openconnect -v --script-tun --script "/usr/bin/ocproxy -v -k 30 -g -D 9000"  ${OPTIONS} ${SERVER}
