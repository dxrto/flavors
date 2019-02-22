FROM d.xr.to/xbps-builder AS builder
RUN git pull;
COPY files/template /_workdir/srcpkgs/reg/template
RUN ./xbps-src pkg reg
FROM d.xr.to/base AS main
LABEL maintainer="=@eater.me"
COPY --from=builder /_workdir/hostdir/binpkgs /tmp/xbps
RUN xbps-install -SyR /tmp/xbps reg && xbps-remove -Oo && rm -rf /var/cache/xbps/* /tmp/xbps
EXPOSE 8080/tcp
