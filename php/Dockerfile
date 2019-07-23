FROM d.xr.to/base
LABEL maintainer="=@eater.me"
RUN xbps-remote php php-mysql php-sqlite wget
RUN sed 's:^open_basedir:;open_basedir:;s:;extension=\(bz2\|curl\|gettext\|gmp\|openssl\|pdo_mysql\|pdo_sqlite\):extension=\1:;s:;extension=xsl:;extension=xsl\nextension=zip\nextension=phar:' -i /etc/php/php.ini
COPY composer-install.sh /bin/composer-install.sh
RUN bash /bin/composer-install.sh
RUN rm -f /bin/composer-install.sh

