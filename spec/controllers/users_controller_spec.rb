require 'spec_helper'

describe UsersController do

  def mock_user(stubs={})
    (@mock_user ||= mock_model(User).as_null_object).tap do |user|
      user.stub(stubs) unless stubs.empty?
    end
  end

  describe "GET index" do
    it "assigns all users as @users" do
      User.stub(:all) { [mock_user] }
      get :index
      assigns(:users).should eq([mock_user])
    end
  end

  describe "GET show" do
    it "assigns the requested user as @user" do
      User.stub(:find).with("37") { mock_user }
      get :show, :id => "37"
      assigns(:user).should be(mock_user)
    end
  end

  describe "GET edit" do
    it "assigns the requested user as @user" do
      User.stub(:find).with("37") { mock_user }
      get :edit, :id => "37"
      assigns(:user).should be(mock_user)
    end
  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested user" do
        User.should_receive(:find).with("37") { mock_user }
        mock_user.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :user => {'these' => 'params'}
      end

      it "assigns the requested user as @user" do
        User.stub(:find) { mock_user(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:user).should be(mock_user)
      end

      it "redirects to the user" do
        User.stub(:find) { mock_user(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(user_url(mock_user))
      end
    end

    describe "with invalid params" do
      it "assigns the user as @user" do
        User.stub(:find) { mock_user(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:user).should be(mock_user)
      end

      it "re-renders the 'edit' template" do
        User.stub(:find) { mock_user(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end

  end

end
