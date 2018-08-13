psql -c 'create user binomo;'
psql -c \"alter user binomo with encrypted password 'binomo'
psql -c \"grant all privileges on database binomo to binomo ;\""
psql -c 'create database binomo
