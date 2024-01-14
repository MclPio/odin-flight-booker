# Project: Flight Booker

- [Project Link](https://www.theodinproject.com/lessons/ruby-on-rails-flight-booker)
- [Live App](https://mclpio-flight-booker.fly.dev/)

The goal of this project is to work with advanced forms, by building three steps of an airline's checkout process.

1. Selecting dates and airports to search
2. Choosing a flight
3. Entering passenger information

## Set up

- $ ```git clone git@github.com:MclPio/odin-flight-booker.git```
- $ ```bundle install```
- $ ```./bin/rails css:install:bulma```
- $ ```bundle exec figaro install```
- Set up gmail user and password in ```config/application.yml``` generated by figaro (optional), can use letter_opener instead if you do not want email integration.
  - ```gmail_username: "<gmail username>"```
  - ```gmail_password: "<app password>"```
- start app with $ ```./bin/dev```

## Technologies

- [Bulma](https://bulma.io/) to style
- [Stimulus](https://stimulus.hotwired.dev/) for javascript sprinkles: Adding and removing passengers
- [Action Mailer](https://guides.rubyonrails.org/action_mailer_basics.html) to send flight confirmation emails
- [Figaro](https://github.com/laserlemon/figaro) to store gmail info
- [cssbundling-rails](https://github.com/rails/cssbundling-rails) for Bulma
