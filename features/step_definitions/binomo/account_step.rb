Given /^Visit to page \/account$/ do
  DRIVER.get CommonSetting[:app_host] + "/account"
  sleep 5
end

When /^input all data to page account$/ do
  DRIVER.execute_script("angular.element(document.querySelector('.first_name')).scope().vm.first_name = 'Selenium'")
  DRIVER.execute_script("angular.element(document.querySelector('.last_name')).scope().vm.last_name = 'Selenium'")
  DRIVER.execute_script("angular.element(document.querySelector('.nickname')).scope().vm.nickname = '#{SecureRandom.hex(5)}'")
  DRIVER.execute_script("angular.element(document.querySelector('.form-control')).scope().vm.phone = '79816548444'")
  DRIVER.execute_script("document.getElementById('receive_news').checked = true")
  DRIVER.execute_script("angular.element(document.querySelector('.last_name')).scope().vm.gender = 'female'")

  DRIVER.execute_script("angular.element(document.querySelectorAll('.ui-select-container')).scope().vm.day = '02'")
  DRIVER.execute_script("angular.element(document.querySelectorAll('.ui-select-container')).scope().vm.month = '02'")
  DRIVER.execute_script("angular.element(document.querySelectorAll('.ui-select-container')).scope().vm.year = '1986'")
  $nn = find_angular_text(DRIVER, ".nickname", "vm.nickname")
end

Then /^Update params to data page account$/ do
  sleep 2
  DRIVER.find_element(:css, "button[type=submit]").click
  sleep 5
end

Given /^Assert to change params in page account$/ do
  puts_info "Change first name --> #{find_angular_text(DRIVER, ".first_name", "vm.first_name") == "Selenium"},
            Change last name --> #{find_angular_text(DRIVER, ".last_name", "vm.last_name") == "Selenium"},
            Change nickname --> #{find_angular_text(DRIVER, ".nickname", "vm.nickname") == $nn},
            Email --> #{find_angular_text(DRIVER, ".email", "vm.email") == User.where(stage_number: ENV['stage']).last.email},
            Phone --> #{find_angular_text(DRIVER, "input", "vm.phone") == '79816548444'},
            Gender --> #{DRIVER.execute_script("return angular.element(document.querySelector('.last_name')).scope().vm.gender == 'female'")},
            Day --> #{find_angular_text(DRIVER, ".ui-select-container", "vm.day") == '02'},
            Month --> #{find_angular_text(DRIVER, ".ui-select-container", "vm.month") == '02'},
            Year --> #{find_angular_text(DRIVER, ".ui-select-container", "vm.year") == '1986'},
            Receive news --> #{DRIVER.execute_script("return document.getElementById('receive_news').checked")}"

  DRIVER.execute_script("angular.element(document.querySelector('.form-control')).scope().vm.phone = ''")
  DRIVER.execute_script("angular.element(document.querySelector('.last_name')).scope().vm.gender = 'male'")
end
