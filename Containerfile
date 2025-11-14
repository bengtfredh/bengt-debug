FROM docker.io/library/alpine:latest
LABEL org.opencontainers.image.authors="Bengt <bengt@fredhs.net>"

RUN apk update && apk upgrade -a && \
    apk add bash iputils bind-tools openssh-client curl postgresql-client && \
    rm -rf /tmp/* /var/cache/apk/*

ENTRYPOINT ["tail", "-f", "/dev/null"]
