FROM d.xr.to/xbps-builder AS builder
RUN git pull;
COPY files/template /_workdir/srcpkgs/grumble/template
RUN ./xbps-src pkg grumble
FROM d.xr.to/base AS main
LABEL maintainer="=@eater.me"
COPY --from=builder /_workdir/hostdir/binpkgs /tmp/xbps
RUN xbps-install -SyR /tmp/xbps grumble && xbps-remove -Oo && rm -rf /var/cache/xbps/* /tmp/xbps
RUN mkdir /grumble
COPY files/grumble.ini /grumble/grumble.ini
VOLUME /grumble
EXPOSE 64738/tcp
EXPOSE 64738/udp
EXPOSE 443/tcp
CMD grumble --datadir /grumble
