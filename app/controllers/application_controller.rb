class ApplicationController < ActionController::Base
  protect_from_forgery
  
  # Customise Devise routing
  def after_sign_in_path_for(resource_or_scope)
    scope = Devise::Mapping.find_scope!(resource_or_scope)
    edit_reg_path = :"edit_#{scope}_registration_path"
    send(edit_reg_path)
  end
  
  def after_sign_out_path_for(resource_or_scope)
    new_user_session_path
  end
  
end
