FROM ruby:2.4.0

RUN mkdir -pv /opt/app

WORKDIR /opt/app

COPY Gemfile* /opt/app/

RUN apt update

RUN apt install -y net-tools lsof vim 

RUN apt install -y nodejs 

RUN apt install -y postgresql-9.6

# RUN service postgresql restart

# RUN su - postgres -c 'createuser binomo; create database launcher_binomo_db'

RUN bundle install

COPY . /opt/app/


CMD ["raisl", "s"]
