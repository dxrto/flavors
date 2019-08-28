FROM d.xr.to/base
RUN xbps-remote slapd && mkdir /run/openldap
EXPOSE 389
CMD ["slapd", "-d", "0"]
