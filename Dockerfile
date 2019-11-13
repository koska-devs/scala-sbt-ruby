FROM hseeberger/scala-sbt:8u222_1.3.2_2.12.10
USER root

ENV PGSSLMODE disable

RUN bash -c 'echo "deb http://apt.postgresql.org/pub/repos/apt/ xenial-pgdg main" > /etc/apt/sources.list.d/pgdg.list'
RUN apt-get update && apt-get upgrade -y --allow-unauthenticated
RUN apt-get install wget ca-certificates software-properties-common -y
RUN add-apt-repository "deb http://security.ubuntu.com/ubuntu xenial-security main"
RUN wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add -
RUN apt-get update && apt-get upgrade -y --allow-unauthenticated
RUN apt-get install libicu55 libpq-dev postgresql-10 git gcc make rbenv ruby-build -y  --allow-unauthenticated
RUN echo 'eval "$(rbenv init -)"' >> ~/.bashrc
RUN bash -c 'source ~/.bashrc'
RUN rbenv install 2.4.0
RUN rbenv global 2.4.0
RUN rbenv exec gem install bundler
ENV DOCKERIZE_VERSION v0.6.1
RUN wget https://github.com/jwilder/dockerize/releases/download/$DOCKERIZE_VERSION/dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
    && tar -C /usr/local/bin -xzvf dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
    && rm dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz
