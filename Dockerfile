FROM ubuntu:20.04

# Install Deluge
RUN apt-get update && apt-get -y install deluged deluge-console deluge-web

# Create the Deluge configuration directory and set permissions
RUN mkdir -p /config && chmod -R 777 /config

# Modify Deluge configuration
RUN sed -i 's/"allow_remote": false,/"allow_remote": true,/g' $HOME/.config/deluge/core.conf

# Start Deluge daemon and web UI
CMD ["sh", "-c", "nohup deluged &>/dev/null && deluge-web --fork"]
