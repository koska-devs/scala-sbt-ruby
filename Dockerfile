FROM hseeberger/scala-sbt:8u222_1.3.2_2.12.10
USER root

ENV PGSSLMODE=disable\
    DOCKERIZE_VERSION=v0.6.1

RUN bash -c 'echo "deb http://apt.postgresql.org/pub/repos/apt/ xenial-pgdg main" > /etc/apt/sources.list.d/pgdg.list'  &&\
    apt-get update && apt-get upgrade -y --allow-unauthenticated &&\
    apt-get install wget ca-certificates software-properties-common -y &&\
    add-apt-repository "deb http://security.ubuntu.com/ubuntu xenial-security main" &&\
    wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add - &&\
    apt-get update && apt-get upgrade -y --allow-unauthenticated &&\
    apt-get install libicu55 libpq-dev postgresql-10 git gcc make rbenv ruby-build -y  --allow-unauthenticated &&\
    echo 'eval "$(rbenv init -)"' >> ~/.bashrc &&\
    bash -c 'source ~/.bashrc' &&\
    rbenv install 2.4.0 &&\
    rbenv global 2.4.0 &&\
    rbenv exec gem install bundler &&\
    wget https://github.com/jwilder/dockerize/releases/download/$DOCKERIZE_VERSION/dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz &&\
    tar -C /usr/local/bin -xzvf dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz &&\
    rm -rf dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz /var/lib/apt/lists/*
