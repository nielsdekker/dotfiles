FROM localhost/alpine-base:latest

RUN apk add --repository=http://dl-cdn.alpinelinux.org/alpine/edge/testing/ \
    volatility3
