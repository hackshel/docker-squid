FROM alpine:latest


WORKDIR /opt/

ENV SQUID_VERSION=5.9 \
    SQUID_CACHE_DIR=/var/cache/squid \
    SQUID_LOG_DIR=/var/log/squid \
    SQUID_USER=squid


RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.tuna.tsinghua.edu.cn/g' /etc/apk/repositories \
    && apk update \
    && apk add squid squid-lang-zh \
    && chown squid:squid /var/cache/squid  \
    && chmod 0755 -R /var/cache/squid 


COPY ./entrypoint.sh  /opt/entrypoint.sh
RUN chmod 755 /opt/entrypoint.sh

EXPOSE 3128/tcp

ENTRYPOINT ["/opt/entrypoint.sh"]



