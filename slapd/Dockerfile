FROM d.xr.to/base
RUN xbps-remote openldap && mkdir /run/openldap
EXPOSE 389
CMD ["slapd", "-d", "0"]
