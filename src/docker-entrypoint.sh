#!/bin/sh
set -e

#如果目录不存在,则尝试解压
if [ ! -d "/home/tlbb" ] && [ -f "/home/tlbb.tar.gz" ] ;then
	cd /home
	tar -zxf tlbb.tar.gz
fi

if [ -d "/home/tlbb" ];then
	cp /root/config/etc/* /etc/
	cp /root/config/config/* /home/tlbb/Server/Config/
	cp /root/config/billing/* /root/files/billing/
	#replace
	sed  -i "s#DB_PASSWORD#${DB_PASSWORD}#g"  /etc/odbc.ini
	sed  -i "s#DB_PASSWORD#${DB_PASSWORD}#g"  /root/files/billing/Config.ini
	sed  -i "s#DB_PASSWORD#${DB_PASSWORD}#g"  /home/tlbb/Server/Config/LoginInfo.ini
	sed  -i "s#DB_PASSWORD#${DB_PASSWORD}#g"  /home/tlbb/Server/Config/ShareMemInfo.ini
	sed  -i "s#GAME_SERVER_IP#${GAME_SERVER_IP}#g"  /home/tlbb/Server/Config/ServerInfo.ini
	#copy脚本
	cp /root/files/run.sh /home/tlbb/
	cp /root/files/stop.sh /home/tlbb/
else
	echo "dir /home/tlbb not found"
	exit 1
fi
exec "$@"