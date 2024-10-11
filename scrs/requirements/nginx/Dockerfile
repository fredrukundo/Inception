FROM	debian:bullseye

#install all the program
RUN		apt-get update
RUN		apt-get install -y nginx \
                openssl

# nginx SSL
RUN mkdir /etc/nginx/ssl
RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes \
       -out /etc/nginx/ssl/frukundo.crt \
       -keyout /etc/nginx/ssl/frukundo.key \
       -subj "/C=MA/ST=Béni Mellal-Khénifra/L=Khouribga/O=42 School/OU=42/CN=frukundo/"

COPY ./conf/nginx.conf /etc/nginx/conf.d

# nginx config
RUN mkdir -p /run/nginx

#the only port allowed
EXPOSE	443

# Start nginx
CMD ["nginx", "-g", "daemon off;"]