FROM ruby:2.4.0


WORKDIR /app

COPY Gemfile* /opt/app/

RUN apt update

RUN apt install -y net-tools lsof vim libpq-dev 

RUN apt install -y nodejs 
RUN apt update

RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - ok    
RUN apt update
RUN sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'

RUN apt install -y xvfb
RUN Xvfb :99 -ac &
RUN export DISPLAY=:99

COPY . /app

RUN bundle install


# RUN rake db:migrate
RUN apt install -y postgresql  postgresql-contrib 
ENV LC_ALL="en_US.UTF-8"
RUN dpkg-reconfigure locales
RUN systemctl enable postgresql 
RUN /etc/init.d/postgresql start

# RUN su - postgres  -c "psql -c 'create user binomo;'" && \
#     su - postgres  -c "psql -c \"alter user binomo with encrypted password 'binomo';\"" && \
#     su - postgres  -c "psql -c 'create database binomo;'" 
# Chrome
# https://discuss.circleci.com/t/installing-chrome-inside-of-your-docker-container/9067
CMD ["rails", "s", "-p", "3001"]
