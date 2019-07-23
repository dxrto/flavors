FROM d.xr.to/xbps-builder AS builder
COPY files/template /_workdir/srcpkgs/grumble/template
RUN xbps-build grumble
FROM d.xr.to/base:glibc AS main
LABEL maintainer="=@eater.me"
COPY --from=builder /_workdir/hostdir/binpkgs /tmp/xbps
RUN xbps-local grumble
RUN mkdir /grumble
COPY files/grumble.ini /grumble/grumble.ini
VOLUME /grumble
EXPOSE 64738/tcp
EXPOSE 64738/udp
EXPOSE 443/tcp
CMD grumble --datadir /grumble
