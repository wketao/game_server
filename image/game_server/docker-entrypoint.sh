#!/bin/sh
set -e

cp /root/config/etc/* /etc/
cp /root/config/config/* /home/tlbb/Server/Config/
#replace
sed  -i "s#tlbb1234#${DB_PASSWORD}#g"  /etc/odbc.ini
sed  -i "s#tlbb1234#${DB_PASSWORD}#g"  /home/tlbb/Server/Config/LoginInfo.ini
sed  -i "s#tlbb1234#${DB_PASSWORD}#g"  /home/tlbb/Server/Config/ShareMemInfo.ini
sed  -i "s#192.168.200.8#${BILLING_IP}#g"  /home/tlbb/Server/Config/ServerInfo.ini
sed  -i "s#12680#${BILLING_PORT}#g"  /home/tlbb/Server/Config/ServerInfo.ini
exec "$@"