FROM ruby:2.4.0
ENV LC_ALL="1"

WORKDIR /app

COPY Gemfile* /opt/app/
RUN apt update
RUN apt install -y net-tools lsof vim libpq-dev

RUN apt install -y nodejs 
RUN apt update

RUN apt install -y xvfb
RUN Xvfb :99 -ac &
RUN export DISPLAY=:99

COPY . /app

RUN bundle install

RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - ok
RUN apt update
RUN sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'

CMD ["tail", "-f", "/dev/null"]
