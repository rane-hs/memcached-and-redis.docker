FROM alpine:latest
#FROM alloylab/memcached
MAINTAINER Hiroshi Seki <rane-hs@gmail.com>


ENV TERM xterm

ENV MEMCACHED_MEMORY 256
ENV MEMCACHED_MAX_CONNECTIONS 1024

EXPOSE 11211 11211/udp

# Install redis
RUN apk add --update redis memcached
RUN mkdir /data
RUN chown -R redis:redis /data
RUN echo -e "include /etc/redis-local.conf\n" >> /etc/redis.conf

# Add the files
ADD root /

VOLUME ["/data"]

# Expose the ports for redis
EXPOSE 6379

COPY conf/start.sh /start.sh
RUN chmod +x /start.sh
CMD ["/start.sh"]

RUN rm -rf /var/cache/apk/*

USER memcached
