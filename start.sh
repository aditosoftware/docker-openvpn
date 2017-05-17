#!/bin/bash


if [ ! -f '/a/config/server.conf' ]
then
    gunzip -c /usr/share/doc/openvpn/examples/sample-config-files/server.conf.gz > /a/config/server.conf
fi
ln -sf /a/config/server.conf /etc/openvpn/


if [ ! -f '/a/config/vars' ]
then
    cp /etc/openvpn/easy-rsa/vars.example /a/config/vars
fi
ln -sf /a/config/vars /etc/openvpn/easy-rsa/

openvpn --verb 3 --config /etc/openvpn/server.conf