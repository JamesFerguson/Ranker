require 'spec_helper'

describe User do
  before(:all) do
    @user = Factory(:user) # some matchers expect to find a user in the db
  end

  # provided by Devise
  it "validates email" do
    should validate_uniqueness_of(:email)
    should validate_presence_of(:email).with_message(/can't be blank/)
    
    should allow_value("john+1@example.com").for(:email)
    should allow_value("james.ferguson@bit.ly").for(:email)
    should_not allow_value(nil).for(:email)
    should_not allow_value(" ").for(:email)
    should_not allow_value("invalid").for(:email)
    should_not allow_value("a@b").for(:email)
    should_not allow_value("john@.com").for(:email)
    should_not allow_value("john@example com").for(:email)
  end
  
  it "validates password" do
    should validate_presence_of(:password).with_message(/can't be blank/)
    
    should allow_value("1234567890").for(:password)
    should_not allow_value(nil).for(:password)
    should_not allow_value("          ").for(:password)
    should_not allow_value("123456789").for(:password)
  end
end
