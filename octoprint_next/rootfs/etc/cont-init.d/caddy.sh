#!/usr/bin/with-contenv bashio

bashio::log.info "Caddy cont-init.d"

ingress_entry=$(bashio::addon.ingress_entry)

sed -i "s#%%base_path%%#${ingress_entry}#g" /etc/caddy/Caddyfile