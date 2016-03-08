source "https://rubygems.org"

ruby "2.3.0"

gem "rails", "4.2.6"                     # Bundle edge Rails instead: gem "rails", github: "rails/rails"
gem "mysql2"                             # Use MySQL as the database for ActiveRecord
gem "devise"                             # Devise for authentication
gem "haml-rails"                         # HAML generators
gem "sass-rails"                         # Use SCSS for stylesheets
gem "bootstrap-sass"                     # Bootstrap 3 for pretty things
gem "uglifier"                           # Use Uglifier as compressor for JavaScript assets
gem "jquery-rails"                       # Use jquery as the JavaScript library
gem "jbuilder"                           # Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem "unicorn"                            # Use unicorn as the app server
gem "newrelic_rpm"                       # Track issues
gem "kaminari"                           # Model pagination
gem "formtastic"                         # Make forms eas(ier)
gem "transloadit-rails"                  # Upload files to S3 without hitting dynos
gem "carmen-rails"                       # Addresses
gem "gon"                                # Send data from controller to JS
gem "figaro"                             # Env variables
gem "underscore-rails"                   # Underscore JS
gem "snail"                              # Format addresses


group :development do
  gem "awesome_print" # Prettier things
  gem "quiet_assets"  # Unicorns are loud
  gem "faker"         # Fake data
end

group :production do
  gem "rails_12factor" # Heroku requirements
end

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem "sdoc", require: false
end

# Use Capistrano for deployment
# gem "capistrano", group: :development

# Use debugger
# gem "debugger", group: [:development, :test]
