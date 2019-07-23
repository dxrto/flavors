FROM d.xr.to/php
RUN xbps-remote php-fpm
RUN useradd -rU www -u 444
RUN mkdir /var/log
RUN sed -i 's:\(user\|group\)\s*=\s*http:\1 = www:;s:127\.0\.0\.1\:9000:9000:;s:\;error_log\s*=.+:error_log = /dev/stderr:;' /etc/php/php-fpm.conf /etc/php/php-fpm.d/www.conf
EXPOSE 9000/tcp
CMD ["/usr/bin/php-fpm", "--nodaemonize"]
