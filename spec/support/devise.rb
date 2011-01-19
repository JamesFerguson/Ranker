require "devise/test_helpers" 

RSpec.configure do |config|
  # For Devise
  config.include Devise::TestHelpers, :type => :controller
end
