FROM ubuntu:20.04

RUN apt-get update && apt-get -y install deluged deluge-console deluge-web
RUN mkdir -p /etc/config/deluge
COPY bomb.conf /etc/config/deluge/core.conf
RUN echo '#!/bin/bash\n\
deluge-web --fork\n\
deluged -c /etc/config/deluge/' > /tmp/start.sh

EXPOSE 8112 58846 58946 58946/udp

CMD ["deluge-web", "--fork"]
