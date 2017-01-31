require 'capybara/cucumber'
require 'ecom_test'

Capybara.default_driver = :selenium
Capybara.app_host = 'http://web:3000'

include EcomTest

Before do
  clear_db
end