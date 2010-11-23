source 'http://rubygems.org'

gem 'rails', '~> 3.0.0'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

gem 'sqlite3-ruby', :require => 'sqlite3'

# Use unicorn as the web server
gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# Auth
gem 'devise'

# Bundle gems for the local environment. Make sure to
# put test-only gems in this group so their generators
# and rake tasks are available in development mode:
group :development, :test, :cucumber do
  gem 'cucumber-rails'
  gem 'capybara'
  
  gem 'shoulda'
  gem 'rspec-rails', '~> 2.1.0'
  
  gem 'ruby-debug19'
  
  gem 'factory_girl_rails'
  gem 'forgery'
  
  gem 'launchy'
end
