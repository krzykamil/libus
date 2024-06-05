# Libus

# Development
Procfile.dev defines the development environment. Use foreman or overmind to run it.
ruby 3.2.2
nodejs 21.6.2


You will also need an .env file in root folder. 

run:

`yarn install`
`bundle install`
`createdb libus_dev`
`bundle exec rake db:setup`
`bundle exec rake db:migrate`
