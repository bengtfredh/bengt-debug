FROM docker.io/library/alpine@sha256:a2d49ea686c2adfe3c992e47dc3b5e7fa6e6b5055609400dc2acaeb241c829f4
LABEL org.opencontainers.image.authors="Bengt <bengt@fredhs.net>"

RUN apk update && apk upgrade -a && \
    apk add bash iputils bind-tools openssh-client curl postgresql-client && \
    rm -rf /tmp/* /var/cache/apk/*

RUN printf '%s\n' \
    "alias cp='cp -i'" \
    "alias egrep='grep -E --color=auto'" \
    "alias fgrep='grep -F --color=auto'" \
    "alias grep='grep --color=auto'" \
    "alias l.='ls -d .* --color=auto'" \
    "alias ll='ls -l --color=auto'" \
    "alias ls='ls --color=auto'" \
    "alias mv='mv -i'" \
    "alias rm='rm -i'" \
    "alias vi='vim'" \
    > /root/.bashrc

WORKDIR /root

ENTRYPOINT ["tail", "-f", "/dev/null"]
