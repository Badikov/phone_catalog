source 'http://rubygems.org'

gem 'rails', '3.2.2'

# Bundle edge Rails instead:
# gem 'rails',     :git => 'git://github.com/rails/rails.git'

gem 'pg'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'therubyracer', :platforms => :ruby
  gem 'uglifier', '>= 1.0.3'
  gem 'bootstrap-sass', '~> 2.0.3'
  gem 'haml_coffee_assets'
end

gem 'jquery-rails'

gem "haml-rails"

# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'ruby-debug19', :require => 'ruby-debug'

gem "backbone-on-rails"

gem "i18n-js", "~> 2.1.2"

group :test, :development do
  gem "rspec-rails", "~> 2.10.1"
  gem "factory_girl_rails", "~> 3.2.0"
  gem "spork-rails", "~> 3.2.0"
  gem "guard-rspec", "~> 0.7.0"
  gem "guard-spork"
end

group :test do
  gem "faker", "~> 1.0.1"
  gem "capybara", "~> 1.1.2"
  gem "database_cleaner", "~> 0.7.2"
  gem "launchy", "~> 2.1.0"
  gem "shoulda-matchers"
end
