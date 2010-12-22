require 'spec_helper'

describe Devise::SessionsController do
  before(:each) do
    request.env['devise.mapping'] = Devise.mappings[:user]
  end
  
  describe "POST create" do
    it "sets an HttpOnly remember me cookie when the user checks 'Remember Me'" do
      @mock_user = mock_model(User, :valid_for_authentication? => true, :to_int => 1001).as_null_object
      User.stub(:find).and_return(@mock_user)
      
      post :create, :user => { :email => "x@y.com", :password => "1234567890", :remember_me => "1" }
      assert_match /remember_user_token[^\n]*HttpOnly/, response.headers["Set-Cookie"]
    end
  end
end