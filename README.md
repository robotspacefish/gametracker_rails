# GameTracker (Rails)

An app to add games you own on the platforms you own them on to your personal game library. GameTracker was built with Rails, Active Record, and Bootstrap.

## Installation

Clone and run:

```
bundle install

# setup the db
rails db:create db:migrate

# if you want to add sample data
rails db:seed

# start the server
rails s
```

## Usage

This project utilizes Google Oauth2. You can follow these instructions to set it up:
[Google Authentication Strategy for Rails 5 Application](https://medium.com/swlh/google-authentication-strategy-for-rails-5-application-cd37947d2b1b)

If you don't already have [Postgres](https://www.postgresql.org/) you will need to install it or adjust the config > database.yml file.

Go to `127.0.0.1:3000` in your browser and enjoy!

## Contributor's Guide

This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](https://www.contributor-covenant.org/) code of conduct.

## License

This project is licensed under the MIT License - see the LICENSE.md for details
