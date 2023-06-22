docker-compose exec db bash -c "chmod 777 docker-entrypoint-initdb.d/init-database.sh"
docker-compose exec db bash -c "./docker-entrypoint-initdb.d/init-database.sh"
