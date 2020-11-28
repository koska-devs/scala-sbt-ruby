FROM hseeberger/scala-sbt:8u265_1.4.3_2.13.3
USER root
ENV PGSSLMODE=disable

RUN bash -c 'echo "deb http://apt.postgresql.org/pub/repos/apt/ xenial-pgdg main" > /etc/apt/sources.list.d/pgdg.list' &&\
      apt-get install wget ca-certificates software-properties-common -y &&\
      add-apt-repository "deb http://security.ubuntu.com/ubuntu xenial-security main" &&\
      wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add - &&\
      apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 40976EAF437D05B5 &&\
      apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 3B4FE6ACC0B21F32 &&\
      apt-get update &&\
      apt-get upgrade -y --allow-unauthenticated &&\
      apt-get install libicu55 libpq-dev postgresql-10 git gcc make rbenv ruby-build -y  --allow-unauthenticated &&\
      echo 'eval "$(rbenv init -)"' >> ~/.bashrc &&\
      bash -c 'source ~/.bashrc' &&\
      rbenv install 2.4.0 &&\
      rbenv global 2.4.0 &&\
      rbenv exec gem install bundler

