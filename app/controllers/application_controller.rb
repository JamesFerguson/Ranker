class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :authenticate_user!
  
  # Customise Devise routing
  def after_sign_in_path_for(resource_or_scope)
    scope = Devise::Mapping.find_scope!(resource_or_scope)
    show_path = :"#{scope}_path"
    send(show_path, resource_or_scope)
  end
  
  def after_sign_out_path_for(resource_or_scope)
    new_user_session_path
  end
  
end
