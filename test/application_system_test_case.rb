require 'test_helper'

WINDOWS_HOST = `cat /etc/resolv.conf | grep nameserver | awk '{ print $2 }'`.strip
CHROMEDRIVER_URL = "http://#{WINDOWS_HOST}:9515/".freeze

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  driven_by :selenium_remote_chrome

  Capybara.register_driver :selenium_remote_chrome do |app|
    chrome_options = Selenium::WebDriver::Chrome::Options.new
    chrome_options.add_argument('--start-maximized')

    Capybara::Selenium::Driver.new(
      app,
      browser: :remote,
      url: CHROMEDRIVER_URL,
      options: chrome_options
    )
  end

  Capybara.configure do |config|
    config.server_host = 'localhost'
    config.server_port = '3000'
  end
end
