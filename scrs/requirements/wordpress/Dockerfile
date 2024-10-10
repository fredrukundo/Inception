FROM debian:buster

# Install PHP, MariaDB client, and other required packages
RUN apt-get update && \
    apt-get install -y \
    php7.3 \
    php-mysql \
    php-fpm \
    wget \
    sendmail \
    mariadb-client

# Expose PHP-FPM on port 9000 for web server communication
EXPOSE 9000

# Copy PHP-FPM configuration and entrypoint scripts
COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d/
COPY ./tools /var/www/

# Make sure the startup script is executable
RUN chmod +x /var/www/wordpress_start.sh

# Entry point for WordPress setup
ENTRYPOINT [ "/var/www/wordpress_start.sh" ]

# Run PHP-FPM in non-daemon mode
CMD ["/usr/sbin/php-fpm7.3", "--nodaemonize"]
