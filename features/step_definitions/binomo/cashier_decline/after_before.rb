Then /^Before balance$/ do
  DRIVER.get(CommonSetting[:app_host] + CommonSetting[:locale] + "/cashier")
  sleep 3
  wait_until(3, :css, "div.b-unit-dropdown-balance")

  if DRIVER.find_element(:css, "div.b-unit-dropdown-balance").displayed? == true
    sleep 2
    DRIVER.find_element(:css, "div.b-unit-dropdown-balance").click
    sleep 2
    DRIVER.find_elements(:css, ".i-unit-account-type")[0].click
    sleep 1
  end

  begin
    DRIVER.find_element(:css, ".w-unit-account-mode-changed > button.btn-primary").click
  rescue Selenium::WebDriver::Error::NoSuchElementError
    puts_info "No found modal #{Selenium::WebDriver::Error::NoSuchElementError}"
  end
  sleep 2
  current_currency =  DRIVER.find_elements(:css, '.currency-amount')[0].text
  puts_success "Current balance before #{DRIVER.find_elements(:css, '.currency-amount')[0].text}"
end

Then /^After balance$/ do
  DRIVER.get(CommonSetting[:app_host] + CommonSetting[:locale] + "/cashier")
  sleep 5

  if DRIVER.find_element(:css, "div.b-unit-dropdown-balance").displayed? == true
    sleep 2
    DRIVER.find_element(:css, "div.b-unit-dropdown-balance").click
    sleep 2
    DRIVER.find_elements(:css, ".i-unit-account-type")[0].click
    sleep 1
  end

  begin
    DRIVER.find_element(:css, ".w-unit-account-mode-changed > button.btn-primary").click
  rescue Selenium::WebDriver::Error::NoSuchElementError
    puts_info "No found modal"
  end
  sleep 2
  current_currency =  DRIVER.find_elements(:css, '.currency-amount')[0].text
  puts_success "Current balance after #{DRIVER.find_elements(:css, '.currency-amount')[0].text} == #{current_currency}"
  puts_success "#{DRIVER.find_elements(:css, '.currency-amount')[0].text == current_currency}"
end
