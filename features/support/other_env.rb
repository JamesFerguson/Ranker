# env.rb says not to edit it, so additional bits go here.

# use email spec
require 'email_spec'
require 'email_spec/cucumber'

# require 'facebooker/rails/cucumber' if ARGV.include?("facebook")

# Get support helpers
# Dir[Rails.root + "spec/support/factories/*.rb"].each {|f| require f}

# def puts str
#   super caller.first #if caller.first.index("shoulda.rb") == -1
#   super str
# end
# 
# def p obj
#   puts caller.first
#   super obj
# end
