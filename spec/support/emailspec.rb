require 'email_spec'

RSpec.configure do |config|
  # Email spec
  config.include EmailSpec::Helpers
  config.include EmailSpec::Matchers
end
