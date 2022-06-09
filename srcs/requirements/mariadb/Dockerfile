FROM    debian:buster

RUN     apt-get update && apt-get upgrade
RUN     apt-get -y install mariadb-server

RUN     mkdir -p /var/run/mysqld && mkdir -p /run/mysqld
RUN     chown -R mysql:root /run/mysqld && chown -R mysql:root /var/run/mysqld

COPY    tools/conf.sh /
COPY	tools/50-server.cnf	/etc/mysql/mariadb.conf.d/50-server.cnf

EXPOSE 3306

ENTRYPOINT  ["sh", "conf.sh"]
