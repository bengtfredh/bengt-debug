FROM docker.io/library/alpine@sha256:5b10f432ef3da1b8d4c7eb6c487f2f5a8f096bc91145e68878dd4a5019afde11
LABEL org.opencontainers.image.authors="Bengt <bengt@fredhs.net>"

RUN apk update && apk upgrade -a && \
    apk add bash iputils bind-tools openssh-client curl postgresql-client && \
    mv /etc/profile.d/color_prompt.sh.disabled /etc/profile.d/color_prompt.sh && \
    rm -rf /tmp/* /var/cache/apk/*

RUN tee /etc/profile.d/aliases.sh << 'EOF'
alias cp='cp -i'
alias egrep='grep -E --color=auto'
alias fgrep='grep -F --color=auto'
alias grep='grep --color=auto'
alias l.='ls -d .* --color=auto'
alias ll='ls -l --color=auto'
alias ls='ls --color=auto'
alias mv='mv -i'
alias rm='rm -i'
alias vi='vim'
EOF

ENTRYPOINT ["tail", "-f", "/dev/null"]
