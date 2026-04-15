FROM docker.io/library/alpine@sha256:5b10f432ef3da1b8d4c7eb6c487f2f5a8f096bc91145e68878dd4a5019afde11
LABEL org.opencontainers.image.authors="Bengt <bengt@fredhs.net>"

RUN apk update && apk upgrade -a && \
    apk add bash iputils bind-tools openssh-client curl postgresql-client && \
    rm -rf /tmp/* /var/cache/apk/*

ENTRYPOINT ["tail", "-f", "/dev/null"]
