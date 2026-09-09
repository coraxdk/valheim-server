FROM cm2network/steamcmd:latest AS server

RUN sleep 5;./steamcmd.sh +force_install_dir /home/steam/valheim-dedicated \
             +login anonymous \
             +app_update 896660 validate \
             +quit

FROM ubuntu:latest
LABEL maintainer="Dennis Nielsen <contact@coraxnet.dk>"
LABEL org.opencontainers.image.source https://github.com/coraxdk/valheim-server

ENV NAME="My Server"
ENV PORT=2456
ENV WORLD="Dedicated"
ENV PUBLIC=1
ENV SAVEINTERVAL=1800
ENV BACKUPS=4
ENV BACKUPSHORT=7200
ENV BACKUPLONG=43200
ENV CROSSPLAY=true
ENV INSTANCEID=1
ENV PRESET=""
ENV MODIFIER=""
ENV SETKEY=""

RUN apt update && \
    apt upgrade -y && \
    apt install -y curl libatomic1 libpulse-dev libpulse0

RUN mkdir /server
RUN mkdir /data

COPY --from=server /home/steam/valheim-dedicated /server
COPY --from=server /home/steam/steamcmd/linux64/steamclient.so /usr/lib

WORKDIR /server
COPY Docker/entrypoint.sh .
RUN chmod +x entrypoint.sh
ENTRYPOINT ["/server/entrypoint.sh"]

EXPOSE 2456/udp
EXPOSE 2457/udp
EXPOSE 2458/udp