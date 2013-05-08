source 'https://rubygems.org'

gem 'rails', '3.2.8'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

#gem 'sqlite3'
gem 'sqlite3', :group => [:development, :test]
group :production do
  gem 'pg'
end

group :development, :test do
  # for test
  gem "rspec"
  gem "rspec-rails"
  # to make test faster
  gem "spork"
  # to watch test
  gem "guard"
  gem "guard-rspec"
  gem "guard-spork"
  gem 'rb-fsevent', :require => false
  # instead of fixture
  gem 'factory_girl_rails', '3.4.0'
  gem 'database_cleaner', '0.8.0'
end

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'
end

# for pagination
gem 'kaminari'

gem 'jquery-rails'

# To use ActiveModel has_secure_password
gem 'bcrypt-ruby', '~> 3.0.0'

# To make web server faster and lighter instead of WEBrick
gem 'thin'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'debugger'
