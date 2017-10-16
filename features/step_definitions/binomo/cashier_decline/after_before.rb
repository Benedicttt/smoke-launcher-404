Then /^Before balance$/ do
  DRIVER.get(CommonSetting[:app_host] + CommonSetting[:locale] + "/cashier")
  sleep 3
  wait_until(3, :css, "span[ng-bind-html='vm.getBalance() | currencyUnit']" )

  if DRIVER.find_element(:css, "span[ng-bind-html='vm.getBalance() | currencyUnit']").displayed? == true
    sleep 2
    DRIVER.find_element(:css, "span[ng-bind-html='vm.getBalance() | currencyUnit']").click
    sleep 2
    DRIVER.find_element(:css, "a[ng-click=\"vm.activateReal()\"]").click
    sleep 1
  end

  begin
    DRIVER.find_element(:css, ".w-unit-account-mode-changed > button.btn-primary").click
  rescue Selenium::WebDriver::Error::NoSuchElementError
    puts_info "No found modal"
  end
  sleep 2
  current_currency =  DRIVER.find_elements(:css, '.currency-amount')[0].text
  puts_success "Current balance before #{DRIVER.find_elements(:css, '.currency-amount')[0].text}"
end

Then /^After balance$/ do
  DRIVER.get(CommonSetting[:app_host] + CommonSetting[:locale] + "/cashier")
  sleep 5

  if DRIVER.find_element(:css, "span[ng-bind-html='vm.getBalance() | currencyUnit']").displayed? == true
    DRIVER.find_element(:css, "span[ng-bind-html='vm.getBalance() | currencyUnit']").click
    sleep 2
    DRIVER.find_element(:css, "a[ng-click=\"vm.activateReal()\"]").click
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
