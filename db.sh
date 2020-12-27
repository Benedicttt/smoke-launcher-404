docker exec -ti postgresql1 psql -U postgres -c 'create user binomo;'
docker exec -ti postgresql1 psql -U postgres -c "alter user binomo with encrypted password 'binomo';"
docker exec -ti postgresql1 psql -U postgres -c "grant all privileges on database binomo to binomo ;"
docker exec -ti postgresql1 psql -U postgres -c 'create database binomo;'
