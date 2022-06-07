FROM    debian:buster

RUN     apt-get update && apt-get upgrade
RUN     apt-get -y install mariadb-server mariadb-client

RUN     mkdir -p /var/run/mysql && mkdir -p /run/mysql
RUN     chown -R mysql:root /run/mysql && chown -R mysql:root /var/run/mysql

COPY    tools/db.sql /
COPY	tools/50-server.cnf	/etc/mysql/mariadb.conf.d/50-server.cnf

EXPOSE 3306

ARG DB_USER
ARG DB_PASS
ARG DB_DB

RUN sed -i "s/DB_USER/$DB_USER/g" /db.sql
RUN sed -i "s/DB_PASS/$DB_PASS/g" /db.sql
RUN sed -i "s/DB_DB/$DB_DB/g" /db.sql

RUN service mysql start && mysql < db.sql
RUN rm -f db.sql

ENTRYPOINT  ["mysql"]
