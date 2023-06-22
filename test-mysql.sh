docker-compose exec testdb bash -c "chmod 777 docker-entrypoint-initdb.d/test-database.sh"
docker-compose exec testdb bash -c "./docker-entrypoint-initdb.d/test-database.sh"
