FROM fedora:latest as build-env
LABEL org.opencontainers.image.authors="Bengt <bengt@fredhs.net>"

RUN mkdir /output
RUN dnf -y --installroot=/output --use-host-config --setopt=install_weak_deps=false --nodocs install glibc-minimal-langpack coreutils-single bash dnf curl iproute bind-utils postgresql kubernetes-client
RUN mkdir -p /output/root && (ls /output/etc/skel/.bash* >/dev/null 2>&1 && cp -a /output/etc/skel/.bash* /output/root/ || true)
RUN dnf -y --installroot=/output clean all

FROM scratch
COPY --from=build-env /output /

ENTRYPOINT ["tail", "-f", "/dev/null"]
