FROM ruby:2.4.0
ENV LC_ALL="1"

WORKDIR /app

COPY Gemfile* /opt/app/

RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -
RUN echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list
RUN apt update
RUN apt install -y net-tools lsof vim libpq-dev google-chrome-stable xvfb nodejs

COPY . /app

RUN bundle install

RUN Xvfb :99 -ac &
RUN export DISPLAY=:99

CMD ["tail", "-f", "/dev/null"]
