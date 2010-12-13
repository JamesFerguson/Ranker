module NavigationHelpers
  # Maps a name to a path. Used by the
  #
  #   When /^I go to (.+)$/ do |page_name|
  #
  # step definition in web_steps.rb
  #
  def path_to(page_name)
    case page_name
    
    when /the home\s?page/
      '/'
    when /the new user registration page/
      new_user_registration_path
    when /the login user page/
      new_user_session_path
    when /the edit user password page/
      edit_user_password_path
    when /the (edit user|user edit) page for "(?<email>[^"]*)"/
      Regexp.last_match[:email].should_not be_nil
      User.find_by_email(Regexp.last_match[:email]).should_not be_nil
      edit_user_path(User.find_by_email(Regexp.last_match[:email]))
    when /my (edit user|user edit) page/
      @user.should_not be_nil
      edit_user_path(@user)
    when /the (edit user|user edit) registration page/
      edit_user_registration_path
    when /the (show user|user show) page for the user with the email "(?<email>[^"]*)"/
      Regexp.last_match[:email].should_not be_nil
      User.find_by_email(Regexp.last_match[:email]).should_not be_nil
      user_path(User.find_by_email(Regexp.last_match[:email]))
    when /my (show user|user show) page/
      @user.should_not be_nil
      user_path(@user)
      

    # Add more mappings here.
    # Here is an example that pulls values out of the Regexp:
    #
    #   when /^(.*)'s profile page$/i
    #     user_profile_path(User.find_by_login($1))

    else
      begin
        page_name =~ /the (.*) page/
        path_components = $1.split(/\s+/)
        self.send(path_components.push('path').join('_').to_sym)
      rescue Object => e
        raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
          "Now, go and add a mapping in #{__FILE__}"
      end
    end
  end
end

World(NavigationHelpers)
