FROM debian:bullseye

RUN apt-get update && \
    apt-get install -y \
    php7.4 \
    php-cgi \
    php-mysql \
    php-fpm \
    wget \
    redis \
	php-redis \
    mariadb-client

EXPOSE 9000

COPY ./conf/www.conf /etc/php/7.4/fpm/pool.d/
COPY ./tools /var/www/


RUN chmod +x /var/www/wordpress_start.sh

ENTRYPOINT [ "/var/www/wordpress_start.sh" ]

CMD ["/usr/sbin/php-fpm7.4", "--nodaemonize"]
