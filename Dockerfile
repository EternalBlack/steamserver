FROM phusion/baseimage:0.9.22
MAINTAINER Markus Bittner <Bittner@EternalBlack.com>

ENV APPID=4020 \
    MAP=gm_construct \
    GAME_TYPE=garrysmod \
    WORKSHOP_KEY= \
    WORKSHOP_ID= \
    GAME_MODE=Sandbox \
    MAX_PLAYERS=64

ADD . /docker

# APPS INSTALL && CONFIG
RUN apt-get update && apt-get install -y lib32gcc1 lib32stdc++6 wget
RUN chmod +x /docker/install_steamcmd.sh && chmod +x /docker/exec_install.sh && useradd -m steam
RUN mkdir -p /home/steam/server/
RUN chown steam:steam /home/steam -R

VOLUME /home/steam/server

USER steam
CMD /docker/exec_install.sh
EXPOSE 27015
EXPOSE 27015/udp
