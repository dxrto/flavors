FROM d.xr.to/xbps-builder AS builder
COPY files/template /_workdir/srcpkgs/img/template
RUN xbps-build img
FROM d.xr.to/base:glibc AS main
LABEL maintainer="=@eater.me"
COPY --from=builder /_workdir/hostdir/binpkgs /tmp/xbps
RUN xbps-local img
