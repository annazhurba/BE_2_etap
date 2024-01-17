#!/bin/bash

MYSQL_HOST=db
MYSQL_USER=root
MYSQL_PASSWORD=student
DB_NAME=BE_186249
DB_CONTAINER=3fba02312d95

docker exec -i "$DB_CONTAINER" mysql -u"$MYSQL_USER" -p"$MYSQL_PASSWORD" -h"$MYSQL_HOST" -e "use $DB_NAME;" 2>/dev/null 

echo 'przed ifem'
docker exec -i "$DB_CONTAINER" mysql -u"$MYSQL_USER" -p"$MYSQL_PASSWORD" -h"$MYSQL_HOST" -D "$DB_NAME" < "mysql.sql"
echo 'po ifie'

docker stack deploy -c docker-compose.yml BE_186249 --with-registry-auth

