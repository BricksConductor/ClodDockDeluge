FROM ubuntu:20.04

RUN apt-get update && apt-get -y install deluged deluge-console deluge-web
RUN mkdir -p /config/deluge
COPY bomb.conf /config/deluge/core.conf
RUN echo '#!/bin/bash\n\
deluge-web --fork\n\
deluged -c /config/deluge/' > /start.sh

EXPOSE 8112 58846 58946 58946/udp

CMD ["/start.sh"]
