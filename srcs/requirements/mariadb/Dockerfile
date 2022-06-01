FROM    debian:buster

RUN     apt-get update && apt-get upgrade
RUN     apt-get install mariadb && apt-get install mariadb-client

RUN     mkdir -p /run/mysql && mkdir -p /var/lib/mysql
RUN     chown -R mysql:mysql /run/mysql && chown mysql:mysql /var/lib/mysql
RUN     mariadb-install-db --user=mysql --datadir='/var/lib/mysql'

COPY    tools/mariadb_setup.sh /tmp/mariadb_setup.sh

EXPOSE 3306

ENTRYPOINT  ["sh", "mariadb_setup.sh"]