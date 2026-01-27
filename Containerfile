FROM docker.io/library/alpine@sha256:51183f2cfa6320055da30872f211093f9ff1d3cf06f39a0bdb212314c5dc7375
LABEL org.opencontainers.image.authors="Bengt <bengt@fredhs.net>"

RUN apk update && apk upgrade -a && \
    apk add bash iputils bind-tools openssh-client curl postgresql-client && \
    rm -rf /tmp/* /var/cache/apk/*

ENTRYPOINT ["tail", "-f", "/dev/null"]
