# `d.xr.to/xbps-builder`

```bash
docker pull d.xr.to/xbps-builder
```

A simple pre-configured container to build void packages in, [void-linux/void-packages](https://github.com/void-linux/void-packages)
is checked out in `/_workdir` which is also the current workdir

Building an image inside a Dockerfile and installing it
it in a target docker container looks like the following

```Dockerfile
FROM d.xr.to/xbps-builder AS builder
RUN git pull
RUN ./xbps-src pkg docker
FROM d.xr.to/base
COPY --from=builder /_workdir/hostdir /tmp/xbps
RUN xbps-install -SyR /tmp/xbps docker \
      && xbps-remove -Oo \
      && rm -rf /var/cache/xbps/* /tmp/xbps
```

# Warning

This xbps-builder is bootstrapped with some very bad magic, so if you hit an issue, please create an issue!
