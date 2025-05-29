FROM ruby:3.4.4-slim

LABEL archives=true
ENV RAILS_ENV=production

RUN apt update
RUN apt install -y build-essential libssl-dev libxml2-dev libxslt-dev sudo libreadline-dev \
                   memcached libmemcached-dev libyaml-dev libpq-dev libsodium-dev libglib2.0-dev

RUN useradd -ms /bin/bash danbooru -u 1000
RUN mkdir /app

COPY . /app

RUN chown -R danbooru:danbooru /app
RUN mkdir /var/run/danboorus /var/log/archives
RUN chown danbooru:danbooru /var/run/danboorus /var/log/archives

USER danbooru

RUN echo 'gem: --no-document' > ~/.gemrc
RUN gem install bundler:2.6.9

WORKDIR /app

RUN bundle install
