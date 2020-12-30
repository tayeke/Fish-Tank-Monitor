== README

You can run this rails app without setting up a ruby environment by running docker:

You don't have to do this every time, but at least once you have to build the image
`docker-compose build`

Then every time you come back to work on the app you run this and it will enter your rails app environment:
`docker-compose up app`

Here are some helpful rails commands, notice the syntax of how you can run any rails commands in the docker app.
These first two you have to run to get your local app working the first time around.
`docker-compose run app bundle exec rake db:create` - create database (running local postgres)
`docker-compose run app bundle exec rake db:migrate` - migrates database
`docker-compose run app bundle install` - if you want to update gems .. like composer
`docker-compose run app yarn install` - you could use yarn/npm too