FROM    debian:buster

RUN     apt-get update && apt-get upgrade
RUN     apt-get -y install mariadb-server mariadb-client

RUN     mkdir -p /var/run/mysql && mkdir -p /run/mysql
RUN     chown -R mysql:root /run/mysql && chown -R mysql:root /var/run/mysql

COPY    tools/mariadb_setup.sh /root/conf/mariadb_setup.sh
COPY	tools/50-server.cnf	/etc/mysql/mariadb.conf.d/50-server.cnf

EXPOSE 3306

ENTRYPOINT  ["bash", "/root/conf/mariadb_setup.sh"]
