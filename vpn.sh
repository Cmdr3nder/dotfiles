#!/bin/sh

if [ -z "$(ps aux | grep 'openconnect' | grep -v 'grep')" ]; then
    pass Cengage/corp/abowers | openconnect contractor.cengage.net -u abowers --no-cert-check --passwd-on-stdin --disable-ipv6
fi
