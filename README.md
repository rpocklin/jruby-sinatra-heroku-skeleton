# JRuby with Sinatra on Heroku Skeleton
=========

This is a bare bones sinatra app skeleton which will enable you to deploy JRuby apps using sinatra to Heroku.  
Heroku has supported Java for a little while now but documentation and how-to's are scant about deployment.

### Notes
I've personally tested this in September 2012 with JRuby 1.6.7.2 and it works fine.

I've included .rvmrc and selected trinidad as the application server.

## Instructions

1.  Install and configure RVM with jruby-1.6.7.
2.  Check this code out from github.

        $ git clone git://github.com/rpocklin/jruby-sinatra-heroku-skeleton.git

3.  Run a script (for the lazy) which will do all the following for you.

        $ provision.sh



If you want to do it manually (or find out what it does...)

1.  Go into the project directory and run:

        $ jruby -S gem install bundler heroku

2.  Edit your Gemfile to update whatever you want in there.

3.  Generate your Gemfile.lock and load dependencies:

        $ jruby -S bundle install

4.  Duplicate the Gemfile to Jemfile so that heroku knows its a JRuby app.

        $ cp Gemfile Jemfile
        $ cp Gemfile.lock Jemfile.lock

5.  Initialise GIT

        $ git init
        $ git add .
        $ git commit -m "Initial commit of repository"

6.  Initialise and push to Heroku (with cedar stack for java) this will give you the application URL (can be renamed by logging in to heroku.com)

        $ heroku create --stack cedar --buildpack http://github.com/heroku/heroku-buildpack-java.git
        $ git push heroku master

Once deployed...

View the install logs

    $ heroku logs

or to tail the logs in production:

    $ heroku logs --tail

Test it responds correctly:

    $ curl http://your_app.heroku.com/

You should get 'Waiting for an awesome API to be written... please come back later'
and your done!

Note:  The example.rb file should be renamed/replaced with your own specific application code, and use server.rb
for your sinatra routes.
