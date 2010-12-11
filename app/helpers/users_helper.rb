module UsersHelper
  SHOW_ATTRIBUTES = [ 
    { :attribute_name => :email }, 
    { :attribute_name => :current_sign_in_at, :attribute_header => "Login Time" }
  ]
  
  def attributes
    SHOW_ATTRIBUTES
  end
  
  def pretty_attribute(attribute_name)
    res = @user.send(attribute_name)
    
    return case res
      when Time
        distance_of_time_in_words(Time.now, res) + " ago <span class=\"note\">(#{res})</span class=\"note\">"
      else
        res
      end
  end
end
