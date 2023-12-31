# frozen_string_literal: true

source 'https://rubygems.org'

ruby '3.2.2'

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem 'rails', '~> 7.1.2'

# The original asset pipeline for Rails [https://github.com/rails/sprockets-rails]
gem 'sprockets-rails'

# Use postgresql as the database for Active Record
gem 'pg', '~> 1.1'

# Use the Puma web server [https://github.com/puma/puma]
gem 'puma', '>= 5.0'

# Bundle and transpile JavaScript [https://github.com/rails/jsbundling-rails]
gem 'jsbundling-rails'

# Hotwire's SPA-like page accelerator [https://turbo.hotwired.dev]
gem 'turbo-rails'

# Hotwire's modest JavaScript framework [https://stimulus.hotwired.dev]
gem 'stimulus-rails'

# Bundle and process CSS [https://github.com/rails/cssbundling-rails]
gem 'cssbundling-rails'

# Use Redis adapter to run Action Cable in production
gem 'redis', '>= 4.0.1'

# Use Kredis to get higher-level data types in Redis [https://github.com/rails/kredis]
# gem "kredis"

# Use Active Model has_secure_password [https://guides.rubyonrails.org/active_model_basics.html#securepassword]
# gem "bcrypt", "~> 3.1.7"

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[windows jruby]

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', require: false

# Mark Weaver - 2023-12-22
# for user creation and login/logout
gem 'devise', '~> 4.9', '>= 4.9.3'

# Mark Weaver - 2023-12-22
# Easy styling and UI widgets
gem 'bootstrap', '~> 5.3', '>= 5.3.2'

# Mark Weaver - 2023-12-22
# Seed data for testing / sampling
gem 'faker', '~> 3.2'

# Mark Weaver - 2023-12-22
# Basic Sass processing
gem 'sassc-rails', '~> 2.1', '>= 2.1.2'

# Mark Weaver - 2023-12-23
# email validator
gem 'email_validator', '~> 2.2', '>= 2.2.4'

# Mark Weaver - 2023-12-24
# email validator
gem 'bootstrap-will_paginate', '~> 1.0'
gem 'will_paginate', '~> 4.0'

# Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
# gem "image_processing", "~> 1.2"

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem 'debug', platforms: %i[mri windows]
end

group :development do
  # Use console on exceptions pages [https://github.com/rails/web-console]
  gem 'web-console'

  # Add speed badges [https://github.com/MiniProfiler/rack-1-profiler]
  # gem "rack-mini-profiler"

  # Speed up commands on slow machines / big apps [https://github.com/rails/spring]
  # gem "spring"

  # Mark Weaver - Security Tools
  gem 'brakeman'
  gem 'bundler-audit'
  gem 'ruby_audit'
  # Mark Weaver - Linting Tools
  gem 'rubocop'
  gem 'rubocop-rails'
end

group :test do
  # Use system testing [https://guides.rubyonrails.org/testing.html#system-testing]
  gem 'capybara'
  gem 'selenium-webdriver'

  # Mark Weaver - 2023-12-23
  # Testing
  gem 'factory_bot_rails', '~> 6.2'
  gem 'rails-controller-testing', '~> 1.0', '>= 1.0.5'
  gem 'rspec-rails', '~> 6.1'
  gem 'simplecov', '~> 0.22.0'
end
