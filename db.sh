docker exec -ti postgresql su - postgres  -c "psql -c 'create user binomo;'" && \
docker exec -ti postgresql su - postgres  -c "psql -c \"alter user binomo with encrypted password 'binomo';\"" && \
docker exec -ti postgresql su - postgres  -c "psql -c 'create database binomo;'" 
docker exec -ti binomo rake db:migrate