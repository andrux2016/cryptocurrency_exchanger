FROM ruby:2.4.2

ENV APP_ROOT /cryptocurrency_exchanger

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN mkdir $APP_ROOT
WORKDIR $APP_ROOT

ADD Gemfile /cryptocurrency_exchanger/Gemfile
ADD Gemfile.lock /cryptocurrency_exchanger/Gemfile.lock
RUN bundle install -j4

ADD . /cryptocurrency_exchanger
