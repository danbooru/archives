FROM ruby:2.4.2-slim-stretch

RUN echo "deb [trusted=yes] http://archive.debian.org/debian stretch main non-free contrib" > /etc/apt/sources.list
RUN echo "deb-src [trusted=yes] http://archive.debian.org/debian stretch main non-free contrib" >> /etc/apt/sources.list
RUN echo "deb [trusted=yes] http://archive.debian.org/debian-security stretch/updates main non-free contrib" >> /etc/apt/sources.list

LABEL archives=true
ENV RAILS_ENV=production

RUN apt-get update
RUN apt-get -y install apt-utils build-essential automake libssl-dev libxml2-dev libxslt-dev sudo libreadline-dev memcached libmemcached-dev postgresql-client libpq-dev

RUN useradd -ms /bin/bash danbooru -u 1000
RUN mkdir /app

COPY . /app

RUN chown -R danbooru:danbooru /app
RUN mkdir /var/run/danboorus /var/log/archives
RUN chown danbooru:danbooru /var/run/danboorus /var/log/archives

USER danbooru

RUN echo 'gem: --no-document' > ~/.gemrc
RUN gem install bundler -v 2.3.27

WORKDIR /app

RUN bundle install
