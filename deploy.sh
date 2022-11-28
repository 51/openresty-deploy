#!/bin/bash
if [[ ! -f ./nginx/sites/default.conf ]]
then
   echo './nginx/sites/default.conf not found'
   exit 0 
fi

if [[ ! -d /etc/ngx-openresty/conf.d ]]
then
    mkdir  -p /etc/ngx-openresty/conf.d
fi

if [[ ! -f /etc/ngx-openresty/conf.d/default.conf ]]
then
    cp ./nginx/sites/default.conf /etc/ngx-openresty/conf.d/default.conf
fi

if [[ ! -f /usr/local/sbin/nginx ]]
then
    cp ./nginx/nginx /usr/local/sbin/nginx
    chmod +x /usr/local/sbin/nginx
fi

if [[ ! -d /opt/verynginx/configs/ ]]
then
    mkdir  -p /opt/verynginx/configs/
fi

if [[ ! -f /opt/verynginx/configs/config.json ]]
then
    cp ./nginx/verynginx/configs/config.json.example /opt/verynginx/configs/config.json
fi

if [[ ! -d /opt/www/ ]]
then
    mkdir  -p /opt/www/
fi

if [[ ! -d /opt/www/default ]]
then
    cp -r ./code/default /opt/www/
fi

if [[ ! -d /etc/cert/ ]]
then
    mkdir  -p /etc/cert/
fi

if [[ ! -d /var/log/nginx/ ]]
then
    mkdir  -p /var/log/nginx/
fi

docker compose up -d
