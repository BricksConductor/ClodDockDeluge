FROM ubuntu:20.04

RUN apt-get update && apt-get -y install deluged deluge-console deluge-web
RUN nohup deluged &>/dev/null &
RUN pkill -f deluged
RUN sed -i 's/"allow_remote": false,/"allow_remote": true,/g' $HOME/.config/deluge/core.conf
RUN echo '#!/bin/bash\n\
nohup deluged -c bomb.conf &>/dev/null &\n\
deluge-web -c bomb.conf --fork' > /start.sh && chmod +x /start.sh

CMD ["/start.sh"]
