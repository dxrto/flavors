FROM d.xr.to/xbps-builder AS builder
COPY files/template /_workdir/srcpkgs/reg/template
RUN xbps-build reg
FROM d.xr.to/base:glibc AS main
LABEL maintainer="=@eater.me"
COPY --from=builder /_workdir/hostdir/binpkgs /tmp/xbps
RUN xbps-local reg
EXPOSE 8080/tcp
