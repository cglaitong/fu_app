FROM ruby:2.5.1
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN mkdir /fu-app

WORKDIR /fu-app

COPY Gemfile /fu-app/Gemfile
COPY Gemfile.lock /fu-app/Gemfile.lock
RUN gem install bundler && bundle install
#RUN bundle update 
COPY . /fu-app

EXPOSE 3000
