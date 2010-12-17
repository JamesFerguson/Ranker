Then /^the page I'm on should match (.*)?$/ do |page_name|
  actual_page_source = page.source
  When "I go to #{page_name}"
  expected_page_source = page.source
  actual_page_source.should match(expected_page_source)
end

When /^I restart my browser$/ do
  browser = BrowserFactory.find_browser
  browser.restart
end

# Trying it this way instead of monkey patching - revisit
class BrowserFactory
  def self.find_browser
    driver = Capybara.current_session.driver
    driver_klass_name = driver.class.name.sub!(driver.class.parent_name + '::', '')
    browser = (driver_klass_name + "Browser").constantize.new(driver)
    return browser
  rescue NameError => e
    puts "Getting browser cookies not implemented for #{driver.class.name}"
    raise
  end
end

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