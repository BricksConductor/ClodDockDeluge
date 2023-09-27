FROM ubuntu:20.04

RUN apt-get update && apt-get -y install deluged deluge-console deluge-web
RUN mkdir -p /config/deluge
COPY bomb.conf /config/deluge/core.conf
COPY ClodStart.sh /config/deluge/ClodStart.sh

EXPOSE 8112 58846 58946 58946/udp

CMD ["/config/deluge/ClodStart.sh"]
