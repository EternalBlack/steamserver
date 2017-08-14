FROM phusion/baseimage:0.9.22
MAINTAINER Markus Bittner <Bittner@EternalBlack.com>

ENV APPID=4020 \
    MAP=gm_construct

ADD . /docker

# APPS INSTALL && CONFIG
RUN apt-get update && apt-get install -y lib32gcc1 wget
RUN chmod +x /docker/install_steamcmd.sh && useradd -m steam
RUN mkdir -p /home/steam/csgo/csgo/cfg
RUN chown steam:steam /home/steam -R

VOLUME /home/steam/csgo/csgo/cfg

USER steam
CMD /docker/install_steamcmd.sh
EXPOSE 27015
EXPOSE 27015/udp
