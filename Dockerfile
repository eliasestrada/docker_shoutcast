FROM ubuntu:14.04

RUN mkdir /opt/shoutcast && \
    mkdir /var/log/shoutcast

WORKDIR /opt/shoutcast

RUN apt-get update && \
    apt-get install -y wget && \
    wget http://download.nullsoft.com/shoutcast/tools/sc_serv2_linux_x64-latest.tar.gz && \
    tar -xzvf sc_serv2_linux_x64-latest.tar.gz

VOLUME ["/etc/shoutcast"]

COPY shoutcast.conf /etc/shoutcast/

EXPOSE 10001 10002

ENTRYPOINT ["/opt/shoutcast/sc_serv", "/etc/shoutcast/shoutcast.conf"]
