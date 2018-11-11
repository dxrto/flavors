FROM d.xr.to/base
RUN xbps-install -Sy nginx
RUN useradd -rU www -u 444
RUN install -d -o www -g www /sites
RUN chown -R www:www /var/tmp/nginx
COPY files/nginx.conf /etc/nginx/nginx.conf
COPY --chown=444:444 files/default /sites/default
COPY files/dhparam.pem /etc/nginx/dhparam.pem
EXPOSE 80/tcp 443/tcp
CMD ["nginx", "-g", "daemon off;"]
