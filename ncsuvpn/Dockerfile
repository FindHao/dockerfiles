FROM debian:11-slim
LABEL maintainer="find@findhao.net"

RUN apt-get update && \
    apt-get install -y openconnect netcat-traditional ocproxy dnsutils telnet unbound gettext tinyproxy && \
    apt-get clean && \
    rm -rf /var/cache/apt/* && \
    rm -rf /var/lib/apt/lists/*

COPY run.sh /run.sh
RUN chmod 0755 /run.sh

CMD ["/run.sh"]
