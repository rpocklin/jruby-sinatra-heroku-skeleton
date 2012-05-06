#!/bin/sh
jruby -S gem install bundler heroku
jruby -S bundle install
cp Gemfile Jemfile
cp Jemfile.lock Jemfile.lock
git init
git add .
git commit -m "Initial commit of repository"
heroku create --stack cedar
git push heroku master
heroku logs
