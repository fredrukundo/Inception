FROM alpine:3.19.0

# install prerequisites
RUN apk update && \
    apk add --no-cache \
    curl \
    mariadb-client \
    php81 \
    php81-fpm \
    php81-session \
    php81-json \
    php81-mysqli \
    php81-pdo \
    php81-pdo_mysql

# Download Adminer and configure PHP-FPM
RUN \
	curl -L -O https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1.php && \
	mkdir -p /var/www/html && \
	mv ./adminer-4.8.1.php /var/www/html/index.php && \
	adduser -u 82 -D -S -G www-data www-data

COPY /conf/www.conf /etc/php81/php-fpm.d/www.conf

EXPOSE 9000
STOPSIGNAL SIGQUIT

CMD ["php-fpm81", "--nodaemonize"]
