#!/usr/bin/with-contenv bashio

bashio::log.info "nginx cont-init.d"

ingress_entry=$(bashio::addon.ingress_entry)
sed -i "s#%%ingress_entry%%#${ingress_entry}#g" /etc/nginx/nginx.conf
