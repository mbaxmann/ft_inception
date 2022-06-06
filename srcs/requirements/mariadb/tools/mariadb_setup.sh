#!/bin/sh

service mysql start

mysql -u root -e "CREATE DATABASE ${MARIADB_DATABASE};"
mysql -u root -e "CREATE USER '${MARIADB_USER}'@'%' IDENTIFIED BY '${MARIADB_PASSWORD}';"
mysql -u root -e "GRANT PRIVILEGES ALL ON ${MARIADB_DATA_BASE}.* TO '${MARIADB_USER}'@'%';"
mysql -u root -e "FLUSH PRIVILEGES;"

service mysql stop
