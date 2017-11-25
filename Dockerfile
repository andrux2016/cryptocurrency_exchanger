FROM ruby:2.4.2

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN mkdir /cryptocurrency_exchanger
WORKDIR /cryptocurrency_exchanger
COPY Gemfile /cryptocurrency_exchanger/Gemfile
COPY Gemfile.lock /cryptocurrency_exchanger/Gemfile.lock
RUN bundle install -j4
COPY . /cryptocurrency_exchanger
