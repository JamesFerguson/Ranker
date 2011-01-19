require 'spec_helper'

describe UsersController do

  def mock_user(stubs={})
    @mock_user ||= mock_model(User, stubs).as_null_object
  end

  let(:user) { Factory(:user) }

  before(:each) do
    sign_in user
  end

  describe "GET index" do
    it "assigns all users as @users" do
      User.stub(:all) { [mock_user] }
      
      get :index
      
      should respond_with(:success)
      should assign_to(:users).with([mock_user])
      should render_template(:index)
    end
  end

  describe "GET show" do
    it "assigns the requested user as @user" do
      User.should_receive(:find).with(:first, :conditions => {:id => user.id}).and_return(user)
      User.should_receive(:find).with("37").and_return(mock_user)
      
      get :show, :id => "37"
      
      should respond_with(:success)
      should assign_to(:user).with(mock_user)
      should render_template(:show)
    end
  end

  describe "GET edit" do
    it "assigns the requested user as @user" do
      User.should_receive(:find).with(:first, :conditions => {:id => user.id}).and_return(user)
      User.stub(:find).with("37").and_return(mock_user)
      
      get :edit, :id => "37"
      
      should respond_with(:success)
      should assign_to(:user).with(mock_user)
      should render_template(:edit)
    end
  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested user" do
        User.should_receive(:find).with(:first, :conditions => {:id => user.id}).and_return(user)
        User.should_receive(:find).with("37").and_return(mock_user)
        user_attrs = Factory.attributes_for(:user).with_indifferent_access
        mock_user.should_receive(:update_attributes).with(user_attrs).and_return(true)
        
        put :update, :id => "37", :user => user_attrs
        
        should assign_to(:user).with(mock_user)
        should set_the_flash.to("Your details were successfully updated.")
        response.should redirect_to(user_url(mock_user))
      end
    end

    describe "with invalid params" do
      it "assigns the user as @user" do
        User.stub(:find) { mock_user(:update_attributes => false) }
        
        put :update, :id => "1"
        
        should assign_to(:user).with(mock_user)
        should render_template(:edit)
      end
    end

  end

end
