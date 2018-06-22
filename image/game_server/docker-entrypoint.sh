#!/bin/sh
set -e

cp /root/config/etc/* /etc/
cp /root/config/config/* /home/tlbb/Server/Config/
#replace
sed  -i "s#DB_PASSWORD#${DB_PASSWORD}#g"  /etc/odbc.ini
sed  -i "s#DB_PASSWORD#${DB_PASSWORD}#g"  /home/tlbb/Server/Config/LoginInfo.ini
sed  -i "s#DB_PASSWORD#${DB_PASSWORD}#g"  /home/tlbb/Server/Config/ShareMemInfo.ini
sed  -i "s#BILLING_IP#${BILLING_IP}#g"  /home/tlbb/Server/Config/ServerInfo.ini
sed  -i "s#BILLING_PORT#${BILLING_PORT}#g"  /home/tlbb/Server/Config/ServerInfo.ini
sed  -i "s#GAME_SERVER_IP#${GAME_SERVER_IP}#g"  /home/tlbb/Server/Config/ServerInfo.ini
exec "$@"