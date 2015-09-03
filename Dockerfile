FROM ubuntu:trusty

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get install -y wget

RUN wget --no-check-certificate -O - https://swupdate.openvpn.net/repos/repo-public.gpg|apt-key add -
RUN echo "deb http://swupdate.openvpn.net/apt trusty main" > /etc/apt/sources.list.d/swupdate.openvpn.net.list

RUN apt-get update \
    && apt-get install -y openvpn ssmtp git-core vim iptables p7zip-full whois \
    && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN git clone --depth 1 --branch v3.0.0 https://github.com/OpenVPN/easy-rsa.git /opt/easyrsa/ \
    && cp -R /opt/easyrsa/easyrsa3 /etc/openvpn/easy-rsa

RUN gunzip -c /usr/share/doc/openvpn/examples/sample-config-files/server.conf.gz > /etc/openvpn/server.conf

ADD start.sh /a/start.sh

CMD ["/a/start.sh"]