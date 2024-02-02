FROM docker.io/library/alpine:latest
MAINTAINER Bengt <bengt@fredhs.net>

RUN apk update && apk upgrade -a && \
    apk add bash iputils bind-tools openssh-client curl postgresql15-client && \
    rm -rf /tmp/* /var/cache/apk/*

ENTRYPOINT ["tail", "-f", "/dev/null"]
