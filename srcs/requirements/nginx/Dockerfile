FROM    debian:buster

RUN     apt-get update && apt-get upgrade
RUN     apt-get install -y nginx openssl

EXPOSE  443

RUN     openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes \
        -out /etc/ssl/certs/nginx.certs
        -keyout /etc/ssl/private/nginx.keyout
        -subj "/C=FR/ST=Paris/L=Paris/O=wordpress/CN=mbaxmann/"

COPY    conf/nginx.conf /etc/nginx/conf.d/default.conf

ENTRYPOINT  ["nginx", "-g", "daemon off;"]