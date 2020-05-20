FROM debian:buster-slim
MAINTAINER azi <azi03@qq.com>

# RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
# RUN echo 'Asia/Shanghai' >/etc/timezone

# RUN sed -i "s/archive.ubuntu./mirrors.aliyun./g" /etc/apt/sources.list
# RUN sed -i "s/deb.debian.org/mirrors.aliyun.com/g" /etc/apt/sources.list
# RUN sed -i "s/security.debian.org/mirrors.aliyun.com/g" /etc/apt/sources.list

RUN apt-get update && apt-get install -y --no-install-recommends ppp pptp-linux inetutils-ping net-tools iproute2 && rm -rf /var/lib/apt/lists/*

COPY docker-entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/docker-entrypoint.sh
RUN ln -s /usr/local/bin/docker-entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]

