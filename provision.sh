#!/bin/sh
jruby -S gem install bundler heroku
jruby -S bundle install
git init
git add .
git commit -m "Initial commit of repository"
heroku create --stack cedar
cp Gemfile Jemfile
cp Jemfile.lock Jemfile.lock
heroku create --stack cedar --buildpack http://github.com/heroku/heroku-buildpack-java
git push heroku master
heroku logs
