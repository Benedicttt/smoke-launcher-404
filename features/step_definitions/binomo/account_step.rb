Given /^Visit to page \/account$/ do
  DRIVER.get CommonSetting[:app_host] + "/account"
  sleep 1
end

When /^input all data to page account$/ do
  DRIVER.execute_script("angular.element(document.querySelector('.first_name')).scope().vm.first_name = 'Selenium'")
  DRIVER.execute_script("angular.element(document.querySelector('.last_name')).scope().vm.last_name = 'Selenium'")
  DRIVER.execute_script("angular.element(document.querySelector('.nickname')).scope().vm.nickname = 'Selenium_#{SecureRandom.hex(12)}'")
  DRIVER.execute_script("angular.element(document.querySelector('.form-control')).scope().vm.phone = '+79816548448'")
  DRIVER.execute_script("document.getElementById('receive_news').checked = true")
  sleep 2

end

Then /^Update params to data page account$/ do
  DRIVER.find_element(:css, "button[type=submit]").click
  sleep 5
end

Given /^Assert to change params in page account$/ do
  puts_info "Set first name == #{find_angular_text(DRIVER, ".first_name", "vm.first_name" )}"
  puts_info "Set last name == #{find_angular_text(DRIVER, ".last_name", "vm.last_name" )}"
  puts_info "Set nickname == #{find_angular_text(DRIVER, ".nickname", "vm.nickname" )}"
  puts_info "Email #{find_angular_text(DRIVER, ".email", "vm.email")}"
  puts_info "Phone #{find_angular_text(DRIVER, ".email", "vm.phone")}"
  puts_info "Receive news #{DRIVER.execute_script("return document.getElementById('receive_news').checked")}"
end
