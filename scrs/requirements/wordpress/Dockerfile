FROM debian:bullseye

# Install PHP, MariaDB client, and other required packages
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

# Expose PHP-FPM on port 9000 for web server communication
EXPOSE 9000

# Copy PHP-FPM configuration and entrypoint scripts
COPY ./conf/www.conf /etc/php/7.4/fpm/pool.d/
COPY ./tools /var/www/


RUN chmod +x /var/www/wordpress_start.sh

# Entry point for WordPress setup
ENTRYPOINT [ "/var/www/wordpress_start.sh" ]

# Run PHP-FPM in non-daemon mode
CMD ["/usr/sbin/php-fpm7.4", "--nodaemonize"]
