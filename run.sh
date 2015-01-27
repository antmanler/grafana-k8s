#!/bin/bash

set -e

if [ "${HTTP_PASS}" == "**Random**" ]; then
    unset HTTP_PASS
fi

if [ ! -f /.basic_auth_configured ]; then
    /set_basic_auth.sh
fi

if [ ! -f /.influx_db_configured ]; then
    /set_influx_db.sh
fi

if [ ! -f /.dashboard_configured ]; then
    /set_dashboard.sh
fi

if [ ! -f /.nginx_configured ]; then
    /set_nginx.sh
fi

echo "=> Grafana for heapster version: 0.3!"
echo "=> Starting and running Nginx..."
/usr/sbin/nginx
