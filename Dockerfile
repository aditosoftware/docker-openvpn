FROM ubuntu:16.04

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get install -y wget \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN wget --no-check-certificate -O - https://swupdate.openvpn.net/repos/repo-public.gpg | apt-key add -
RUN echo "deb http://swupdate.openvpn.net/apt xenial main" > /etc/apt/sources.list.d/swupdate.openvpn.net.list

RUN apt-get update \
    && apt-get install -y openvpn ssmtp iptables p7zip-full whois \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

VOLUME /a/data
VOLUME /a/log

ADD start.sh /a/start.sh
RUN chmod +x /a/start.sh
CMD /a/start.sh