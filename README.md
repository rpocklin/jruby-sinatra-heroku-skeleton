# JRuby with Sinatra on Heroku Skeleton
=========

This is a bare bones sinatra app skeleton which will enable you to deploy
JRuby apps using sinatra to heroku.  Heroku has supported Java for a little
while now but documentation and how-to's are scant about deployment.

I've personally tested this in March 2012 with JRuby 1.6.7 and it works
fine.

I've included .rvmrc and selected trinidad as the application server.

## Instructions

Install and configure RVM to have jruby-1.6.7.
Check this code out from github.
$ git clone git://github.com/rpocklin/

Run a script (for the lazy) which will do all the following for you.
$ provision.sh

Go into the project directory and run:
$ jruby -S gem install bundler heroku

Edit your Gemfile to update whatever you want in there.

Generate your Gemfile.lock and load dependencies:
$ jruby -S bundle install

Initialise GIT
$ git init
$ git add .
$ git commit -m "Initial commit of repository"

Initialise Heroku (with cedar stack for java) this will give you the application URL (can be renamed by logging in to heroku.com)
$ heroku create --stack cedar

Duplicate the Gemfile to Jemfile so that heroku knows its a JRuby app.
$ cp Gemfile Gemfile.lock
$ cp Gemfile.lock Jemfile.lock
$ heroku create --stack cedar --buildpack http://github.com/heroku/heroku-buildpack-java
$ git push heroku master

View the install logs
$ heroku logs

or to tail the logs in production:
$ heroku logs --tail

Test it responds correctly:
$ curl http://your_app.heroku.com/..../

and your done!

Note:  You should include your library / app files in config.ru (eg. require 'zing' which is the bootstrap for sinatra.
