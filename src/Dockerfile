FROM ubuntu:16.04
ADD config.tar.gz /root/
COPY files /root/files
COPY docker-entrypoint.sh /usr/local/bin/init_gs
ARG UBUNTU_APT_MIRROR_URL=
RUN chmod a+x /usr/local/bin/init_gs \
	&& if [ ! -z "${UBUNTU_APT_MIRROR_URL}" ];then \
		cp /etc/apt/sources.list /etc/apt/sources.list.bak; \
		sed  -i "s#archive.ubuntu.com#${UBUNTU_APT_MIRROR_URL}#g"  /etc/apt/sources.list; \
	fi \
	&& dpkg --add-architecture i386 \
	&& apt-get update \
	&& apt-get install -y libc6:i386 libstdc++6:i386 \
	&& cd /root/files \
	&& chmod a+x run.sh stop.sh \
	&& ln -s /root/files/run.sh /usr/local/bin/run_gs \
	&& ln -s /root/files/stop.sh /usr/local/bin/stop_gs \
	&& chmod a+x /root/files/billing/Billing \
	&& tar -zxf unixODBC-so.tar.gz \
	&& cp -Rf unixODBC /usr/local/ \
	&& echo "/usr/local/unixODBC/lib">>/etc/ld.so.conf \
	&& tar -zxf mysql-connector-odbc-5.3.10-linux-ubuntu14.04-x86-32bit.tar.gz \
	&& ln -s /usr/local/unixODBC/lib/libodbc.so.2.0.0 /usr/lib/i386-linux-gnu/libodbc.so.1 \
	&& cd mysql-connector-odbc-5.3.10-linux-ubuntu14.04-x86-32bit \
	&& cp bin/* /usr/local/bin \
	&& cp lib/* /usr/local/lib \
	&& ldconfig \
	&& myodbc-installer -a -d -n "MySQL ODBC 5.3 Driver" -t "Driver=/usr/local/lib/libmyodbc5w.so" \
	&& myodbc-installer -d -l
EXPOSE 7384 3731
ENTRYPOINT ["init_gs"]
CMD ["tail","-f","/dev/null"]