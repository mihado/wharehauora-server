# frozen_string_literal: true

source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 4.2.8'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# # bundle exec rake doc:rails generates the API under doc/api.
# gem 'sdoc', '~> 0.4.0', group: :doc

# Use Postgresql as the database for Active Record
gem 'pg'

# for logins
gem 'devise'

# roles and permissions
gem 'pundit'

# templating
gem 'haml-rails'

gem 'purecss-rails'

# icons
gem 'font-awesome-rails'

# for heroku
gem 'rails_12factor', group: :production
gem 'raygun4ruby', group: :production

# listens for incoming sensor readings on mqtt
gem 'mqtt'

gem 'will_paginate'

# pretty charts
gem 'chartkick'

# pagination
gem 'kaminari'

# email
gem 'sendgrid-ruby'

gem 'active_median'

gem 'momentjs-rails'

# Rest/http library
gem 'faraday'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'

  # code style
  gem 'haml_lint', '0.25.1', require: false
  gem 'rubocop', '0.49.1', require: false
  gem 'scss_lint', require: false

  # pulls in config from environment variables
  gem 'dotenv-rails'

  # test runner
  gem 'rspec-rails'

  # content generators
  gem 'factory_girl_rails'
  gem 'faker'

  # Code coverage analysis
  gem 'codeclimate-test-reporter', require: false
  gem 'coveralls', require: false

  gem 'capybara'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'

  gem 'bullet'
end
