#!/bin/bash
set -e

if [ -f /.nginx_configured ]; then
    echo "=> Nginx has been configured!"
    exit 0
fi

: ${INFLUXDB_SERVICE_HOST:=127.0.0.1}
: ${INFLUXDB_SERVICE_PORT:=8086}

echo "=> Configuring Nginx"
sed -i \
    -e "s/<--IDB-ADDR-->/${INFLUXDB_SERVICE_HOST}/g" \
    -e "s/<--IDB-PORT-->/${INFLUXDB_SERVICE_PORT}/g" \
    /etc/nginx/sites-enabled/default

ln -sf /dev/stdout /var/log/nginx/access.log
ln -sf /dev/stderr /var/log/nginx/error.log

touch /.influx_db_configured
echo "=> Nginx has been configured as follows:"
echo "   InfluxDB ADDRESS:      ${INFLUXDB_SERVICE_HOST}"
echo "   InfluxDB PORT:         ${INFLUXDB_SERVICE_PORT}"
echo "   ** Please check your environment variables if you find something is misconfigured. **"
echo "=> Done!"
