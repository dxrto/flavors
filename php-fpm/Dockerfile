FROM d.xr.to/php
RUN xbps-install -Sy php-fpm
RUN useradd -rU www -u 444
RUN sed 's:\(user\|group\)\s*=\s*http:\1 = www:'
EXPOSE 9000/tcp
CMD ["/usr/bin/php-fpm", "--nodaemonize"]
