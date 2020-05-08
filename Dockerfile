FROM ruby:2.6-alpine3.11

WORKDIR /hello-docker-app

COPY . ./

RUN gem update --system && gem install bundler && bundle install 

ENTRYPOINT bin/hello-docker

