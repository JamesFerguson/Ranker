class RackTestBrowser
  def initialize(driver)
    @driver = driver
  end
  
  def restart
    self.cookies.reject! do |cookie|
      cookie.expired? != false
    end
  end
  
  def cookies
    @cookies ||= self.cookie_jar.instance_variable_get(:@cookies)
  end
  
  def cookie_jar
    @cookie_jar ||= self.browser.cookie_jar
  end
  
  def browser
    @browser ||= self.session.instance_variable_get(:@rack_mock_session)
  end
  
  def session
    @session ||= @driver.current_session
  end
end
