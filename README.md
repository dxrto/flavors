# Flavors

A repository of different types of containers based on `d.xr.to/base`, A list can be found under [Containers](#Containers)

# Building

Building of images is done by `flavor` a simple perl5 tool which automatically creates a dependency graph of containers and runs the builds in parallel if possible.

```
flavor [-h] [-r <repo>] [-x <images>] [-o] [-j <jobs>] [-p] [all|images...]

Build Docker images with dependency graphing

Options:
    -x  Comma separated list of images not to rebuild in chain
    -o  Only build given images, don't build parents
    -r  Which repo or prefix to use, default: d.xr.to
    -p  Push image after building
    -j  How many builds should run at the same time, default: 4
    -h  Show this help
```

## Example

```
[eater@momo flavors]$ ./flavor all
INFO: building: nginx, php-fpm, php
INFO: Starting build for nginx
INFO: Starting build for php
INFO: Finished build for php
INFO: Starting build for php-fpm
INFO: Finished build for nginx
INFO: Finished build for php-fpm
INFO: Done building!
```

# Containers

|name||readme|description|author|
|---|---|---|---|---|
|php|`docker pull d.xr.to/php`||PHP, with composer installed and the following extensions: bz2, curl, gettext, gmp, openssl, pdo_mysql, pdo_sqlite, zip, and phar||
|php-fpm|`docker pull d.xr.to/php-fpm`||`d.xr.to/php` with an php-fpm server running on port 9000||
|nginx|`docker pull d.xr.to/nginx`|[README](nginx/)|A simple pre-configured nginx with safe defaults||
|umurmur|`docker pull d.xr.to/umurmur`||Simple umurmur container|[krageon](https://github.com/krageon)|
|jre|`docker pull d.xr.to/jre`||Container with the latest JRE (based on glibc)||
|jdk|`docker pull d.xr.to/jdk`||Container with the latest JDK (based on glibc)||
|pleroma|`docker pull d.xr.to/pleroma`||Base container for a pleroma instance. still requires recompiling for own instance||
|greg|`docker pull d.xr.to/greg`||Greg is a simple command-line podcast aggregator||
|slapd|`docker pull d.xr.to/slapd`||OpenLDAP||
|grumble|`docker pull d.xr.to/grumble`||[Grumble](https://github.com/mumble-voip/grumble) is an alternate Mumble server||
|reg|`docker pull d.xr.to/reg`||[reg](https://github.com/genuinetools/reg): Docker registry v2 command line client and repo listing generator with security checks||
|img|`docker pull d.xr.to/img`||[img](https://github.com/genuinetools/img): Standalone, daemon-less, unprivileged Dockerfile and OCI compatible container image builder.||
|coredns|`docker pull d.xr.to/coredns`||[coredns](https://github.com/coredns/coredns): CoreDNS is a DNS server that chains plugins (pre-configured with unbound, and removed grpc, clouddns, kubernetes, azure and route53 support)||
|rtorrent|`docker pull d.xr.to/rtorrent`||rtorrent||
|xbps-builder|`docker pull d.xr.to/xbps-builder`||A container pre-configured for the `ethereal` build-style (debuted here!)||

# Todo

- Add -c flag to rebuild children of given images
