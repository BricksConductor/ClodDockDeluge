FROM ubuntu:20.04

RUN apt-get update && apt-get -y install deluged deluge-console deluge-web
#RUN nohup deluged &>/dev/null &
#RUN sleep 10
#RUN deluge-console "config -s allow_remote True"
#RUN pkill -f deluged
RUN echo '#!/bin/bash\n\
nohup deluged &>/dev/null &\n\
deluge-web --fork' > /start.sh && chmod +x /start.sh

CMD ["/start.sh"]
