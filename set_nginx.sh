#!/bin/bash
set -e

if [ -f /.nginx_configured ]; then
    echo "=> Nginx has been configured!"
    exit 0
fi

: ${INFLUX_MASTER_SERVICE_HOST:=127.0.0.1}
: ${INFLUX_MASTER_SERVICE_PORT:=8086}

echo "=> Configuring Nginx"
sed -i \
    -e "s/<--IDB-ADDR-->/${INFLUX_MASTER_SERVICE_HOST}/g" \
    -e "s/<--IDB-PORT-->/${INFLUX_MASTER_SERVICE_PORT}/g" \
    /etc/nginx/sites-enabled/default

ln -sf /dev/stdout /var/log/nginx/access.log
ln -sf /dev/stderr /var/log/nginx/error.log

touch /.influx_db_configured
echo "=> Nginx has been configured as follows:"
echo "   InfluxDB ADDRESS:      ${INFLUX_MASTER_SERVICE_HOST}"
echo "   InfluxDB PORT:         ${INFLUX_MASTER_SERVICE_PORT}"
echo "   ** Please check your environment variables if you find something is misconfigured. **"
echo "=> Done!"
