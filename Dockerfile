FROM ubuntu:20.04

RUN apt-get update && apt-get -y install deluged deluge-console deluge-web

RUN echo '#!/bin/bash\n\
nohup deluged -c bomb.conf &>/dev/null &\n\
deluge-web -c bomb.conf --fork' > /start.sh && chmod +x /start.sh

EXPOSE 8112 

CMD ["/start.sh"]
