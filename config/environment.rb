# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Ranker::Application.initialize!

Dir[Rails.root + 'lib/monkey_patches/**/*.rb'].each { |file| require file }