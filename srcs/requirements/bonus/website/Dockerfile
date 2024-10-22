FROM	debian:bullseye

RUN		apt-get update
RUN		apt-get install -y nginx


COPY ./conf/nginx.conf /etc/nginx/conf.d
COPY ./sample-website /var/www/html

RUN rm /etc/nginx/sites-enabled/default

EXPOSE	3000

CMD ["nginx", "-g", "daemon off;"]