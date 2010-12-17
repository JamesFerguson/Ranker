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