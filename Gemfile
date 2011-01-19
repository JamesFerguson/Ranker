source 'http://rubygems.org'

gem 'rails', '~> 3.0'

gem 'pg'

# Use unicorn as the web server
gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# Auth
gem 'devise'

# Form/View helpers
gem 'formtastic'

# Workaround Rack regex warnings - see config/initializers/rack_warning_fix.rb
gem 'escape_utils'

# Bundle gems for the local environment. Make sure to
# put test-only gems in this group so their generators
# and rake tasks are available in development mode:
group :development, :test, :cucumber do
  gem 'cucumber-rails'
  gem 'capybara', '~> 0.3.9'
  gem 'fuubar-cucumber'
  
  gem 'shoulda'
  gem 'rspec-rails', '~> 2.1'
  gem 'email_spec'
  
  gem 'ruby-debug19'
  
  gem 'factory_girl_rails'
  gem 'forgery'
  
  gem 'launchy'
  
  gem 'awesome_print'
  gem 'wirble'
  gem 'irb_hacks'
  gem 'ori'
end
