# On indique la distribution (cat /etc/debian_version)
FROM debian:buster

# On update les services concernes
RUN	apt-get update -y && \
	apt-get install -y  \
	curl mariadb-client \
	php \
	php7.3 \
	php7.3-fpm \
	php7.3-mysql \
	php-common \
	php7.3-cli \
	php7.3-common \
	php7.3-json \
	php7.3-opcache \
	php7.3-readline \
	php-curl \
	php-gd \
	php-intl \
	php-mbstring \
	php-soap \
	php-xml \
	php-xmlrpc \
	php-zip

# Creation du dossier
RUN 	mkdir -p /var/run/ ; mkdir -p /run/php/

# Copie des outils pour telecharger wordpr
COPY 	./tools/launch.sh  /etc/
COPY 	./tools/www.conf /etc/php/7.3/fpm/pool.d

# Lancement du script
RUN 	curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
		chmod +x wp-cli.phar && \
		mv wp-cli.phar /usr/local/bin/wp

# Choix du bon port
EXPOSE	9000

ENTRYPOINT [ "bash", "/etc/launch.sh" ]
