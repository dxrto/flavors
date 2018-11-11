# `d.xr.to/nginx`

```bash
docker pull d.xr.to/nginx
```

A nginx container, contains safe defaults for SSL and pre-generated 4096-bits DH parameters.

# Important paths

| | |
|---|---|
|`/sites/default`|Default root directory|
|[`/etc/nginx/nginx.conf`](files/nginx.conf)|Default nginx config|
|`/etc/nginx/sites`|Default include path of other config files|
|[`/etc/nginx/dhparam.pem`](files/dhparam.pem)|Default pre-generated DH parameters|
