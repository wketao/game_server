FROM ubuntu:14.04
COPY config /root/config
COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint
ARG UBUNTU_APT_MIRROR_URL=
RUN chmod a+x /usr/local/bin/docker-entrypoint \
	&& if [ ! -z "${UBUNTU_APT_MIRROR_URL}" ];then \
		cp /etc/apt/sources.list /etc/apt/sources.list.bak; \
		sed  -i "s#archive.ubuntu.com#${UBUNTU_APT_MIRROR_URL}#g"  /etc/apt/sources.list; \
	fi \
	&& dpkg --add-architecture i386 \
	&& apt-get update
RUN apt-get install -y libc6:i386 libncurses5:i386 libstdc++6:i386 unixodbc:i386 unixodbc-dev:i386 libmyodbc:i386 mysql-client ; exit 0
RUN rm -rf /usr/share/libtool/libltdl/Makefile.in /var/cache/apt/archives/libltdl-dev_*ubuntu1_i386.deb
RUN apt-get install -y -f ; exit 0
EXPOSE 7384
ENTRYPOINT ["docker-entrypoint"]
CMD ["tail","-f","/dev/null"]