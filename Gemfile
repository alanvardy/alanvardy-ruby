source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.3'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5'
# Use postgresql as the database for Active Record
gem 'pg'
# Use Puma as the app server
gem 'puma'
# Use SCSS for stylesheets
gem 'sassc'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'mini_racer', platforms: :ruby

# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use ActiveModel has_secure_password
gem 'bcrypt'

# Use ActiveStorage variant
# gem 'mini_magick', '~> 4.8'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', require: false

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'listen'
  gem 'web-console'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen'
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara'
  gem 'selenium-webdriver'
  # Easy installation and use of chromedriver to run system tests with Chrome
  gem 'guard'
  gem 'guard-minitest'
  gem 'webdrivers'
  gem 'effective_test_bot'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

# Pretty UI things
gem 'bootstrap'
gem 'bootstrap-will_paginate'
gem 'font-awesome-sass'
gem 'jquery-rails'
gem 'redcarpet'
gem 'rouge'
gem 'simple_form'
gem 'will_paginate'

# APIs
gem 'mailgun-ruby'

# Tools
gem 'annotate', group: :development
gem 'brakeman', group: :development
gem 'bullet', groups: %i[development test]
gem 'debride', group: :development
gem 'dokku-cli', group: :development
gem 'dotenv-rails', groups: %i[development test]
gem 'fasterer', group: :development
gem 'reek', group: :development
gem 'rubocop', groups: %i[development test]
gem 'rubocop-performance', groups: %i[development test]
gem 'rubocop-rails', groups: %i[development test]
gem 'rubycritic', group: :development
gem 'solargraph', group: :development
gem 'sorbet', group: :development
gem 'sorbet-rails'
gem 'sorbet-runtime'
