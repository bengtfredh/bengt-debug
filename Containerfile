FROM fedora:latest as build-env
LABEL org.opencontainers.image.authors="Bengt <bengt@fredhs.net>"

RUN mkdir /output
RUN dnf -y --installroot=/output --use-host-config --setopt=install_weak_deps=false --nodocs install glibc-minimal-langpack coreutils-single curl bind-utils tcpdump postgresql kubernetes-client
RUN dnf -y --installroot=/output clean all

FROM scratch
COPY --from=build-env /output /

ENTRYPOINT ["tail", "-f", "/dev/null"]
