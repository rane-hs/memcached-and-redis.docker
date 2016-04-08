## this container contains
 - memcached (port 11211)
 - redis (port 6379)

## build

```
docker build -t memcached-redis-alpine .
```

## run

```
docker run --restart always --name mcdocker -i -t -d memcached-redis-alpine
```

## from
 - https://github.com/alloylab/Docker-Alpine-Memcached
 - https://github.com/smebberson/docker-alpine/tree/master/alpine-redis

