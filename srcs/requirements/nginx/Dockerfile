
# On indique la distribution (cat /etc/debian_version)
FROM    debian:buster

# On update les services concernes
RUN     apt-get update && apt-get upgrade && \
        apt-get install -y nginx openssl

RUN     mkdir -p /etc/nginx/ssl
# Creation d'un self certificate 
RUN     openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes \
        -out /etc/nginx/ssl/nginx.crt \
        -keyout /etc/nginx/ssl/nginx.key \
        -subj "/C=FR/ST=Paris/L=Paris/O=wordpress/CN=flmastor/"

# Copy de la bonne configuration dans nginx
COPY    conf/nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE 443

# Important lors de l'usage d'un supervisor (.yml) il faut le mettre off avc docker-compose
# permet de le faire tourner en arriere plan 
CMD  ["nginx", "-g", "daemon off;"]

# https://stackoverflow.com/questions/50705838/docker-compose-with-nginx-keeps-displaying-welcome-page
# https://www.nginx.com/blog/deploying-nginx-nginx-plus-docker/
# https://itecnote.com/tecnote/docker-the-difference-between-nginx-daemon-on-off-option/