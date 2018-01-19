Given /^Visit to page \/account$/ do
  DRIVER.get CommonSetting[:app_host] + "/account"
  sleep 5
end

When /^input all data to page account$/ do
    DRIVER.execute_script("angular.element(document.querySelector('input[name=first_name]')).scope().vm.model = 'Selenium'")
    DRIVER.execute_script("angular.element(document.querySelector('input[name=last_name]')).scope().vm.model = 'Selenium'")
    DRIVER.execute_script("angular.element(document.querySelector('input[name=nickname]')).scope().vm.model = '#{(0..10).map { ('a'..'z').to_a[rand(26)] }.join}'")
    DRIVER.execute_script("document.getElementById('receive_news').checked = true")
    DRIVER.execute_script("angular.element(document.querySelectorAll('.item')).scope().vm.onChange = 'Female'")

    DRIVER.execute_script("angular.element(document.querySelectorAll('ui-n-select')).scope().vm.day = '02'")
    DRIVER.execute_script("angular.element(document.querySelectorAll('ui-n-select')).scope().vm.month = '02'")
    DRIVER.execute_script("angular.element(document.querySelectorAll('ui-n-select')).scope().vm.year = '1986'")
    $nn = find_angular_text(DRIVER, "input[name=nickname]", "vm.model")
end

Then /^Update params to data page account$/ do
  sleep 3
  2.times { DRIVER.find_element(:css, "button[type=submit]").click }
  sleep 1
end

Given /^Assert to change params in page account$/ do
  puts_info "Change first name --> #{find_angular_text(DRIVER, "input[name=first_name]", "vm.model") == "Selenium"},
             Change last name --> #{find_angular_text(DRIVER, "input[name=last_name]", "vm.model") == "Selenium"},
             Change nickname --> #{find_angular_text(DRIVER, "input[name=nickname]", "vm.model") == $nn},
             Email --> #{find_angular_text(DRIVER, "input[name=email]", "vm.model") == User.where(stage_number: ENV['stage']).last.email},
             Phone --> #{find_angular_text(DRIVER, "input[name=phone]", "vm.model") == '79816548444'},
             Gender --> #{DRIVER.execute_script("return angular.element(document.querySelectorAll('.item')).scope().vm.onChange == 'Female'")},

             Day --> #{find_angular_text(DRIVER, "ui-n-select", "vm.day") == '02'}
             Month --> #{find_angular_text(DRIVER, "ui-n-select", "vm.month") == '02'},
             Year --> #{find_angular_text(DRIVER, "ui-n-select", "vm.year") == '1986'},
             Receive news --> #{DRIVER.execute_script("return document.getElementById('receive_news').checked")}"

  sleep 1
  DRIVER.execute_script("angular.element(document.querySelector('input[name=phone]')).scope().vm.model = ''")
  DRIVER.execute_script("angular.element(document.querySelectorAll('.item')).scope().vm.onChange = 'Male'")
  DRIVER.find_element(:css, "button[type=submit]").click
  sleep 2
  first_last_name
end
