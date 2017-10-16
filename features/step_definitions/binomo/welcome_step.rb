Given /^Visit page Welcome$/ do
end

When /^Fill \/welcome$/ do
    # DRIVER.navigate.refresh
    # wait_until(10, :css, "ui-input[ng-model='vm.first_name'] > div > input[ng-attr-name='{{vm.name}}']")
    # sleep 1
    # DRIVER.find_element(:css, "ui-input[ng-model='vm.first_name'] > div > input[ng-attr-name='{{vm.name}}']").send_keys("stage selenium") if ENV['geo'] != "CN"
    # DRIVER.find_element(:css, "ui-input[ng-model='vm.first_name'] > div > input[ng-attr-name='{{vm.name}}']").send_keys("stage") if ENV['geo'] == "CN"
    # sleep 0.5
    # DRIVER.find_element(:css, "ui-input[ng-model='vm.last_name'] > div > input[ng-attr-name='{{vm.name}}']").send_keys("stage selenium") if ENV['geo'] != "CN"
    # DRIVER.find_element(:css, "ui-input[ng-model='vm.last_name'] > div > input[ng-attr-name='{{vm.name}}']").send_keys("stage") if ENV['geo'] == "CN"
    # sleep 0.5
    # DRIVER.execute_script("$('button.btn.btn-secondary.btn-lg.stretch').click()")
    # sleep 0.5
end

Then /^Redirect pages tutorial and agree risk$/ do
    DRIVER.get(CommonSetting[:app_host] + CommonSetting[:locale] + "/tutorial")
    sleep 2
    wait_until(5, :class, "step-nav")
    DRIVER.execute_script("angular.element(document.querySelectorAll('.step-nav'))[0].click()")
    DRIVER.execute_script("angular.element(document.querySelectorAll('.step-nav'))[1].click()")
    DRIVER.execute_script("angular.element(document.querySelectorAll('.step-nav'))[3].click()")
    DRIVER.execute_script("angular.element(document.querySelectorAll('.step-nav'))[2].click()")
    DRIVER.execute_script("angular.element(document.querySelectorAll('.btn')).scope().vm.goAhead()")

    wait_until(5, :class, "modal-content")
    sleep 2
    # DRIVER.execute_script("$(\"input[name=i_agree]\").trigger('change').prop('checked', true)")
    DRIVER.find_elements(:css, ".title")[1].click
    # DRIVER.find_element(:css, "input[ng-model=\"confirm\"]").click
    sleep 2
    DRIVER.find_element(:css, ".btn-primary").click
    sleep 1
end

Then /^Profile last and first name$/ do
  id = User.where(stage_number: ENV['stage']).last.id
  DRIVER.execute_script("localStorage.setItem(\"#{id}.real.welcome_bonus\", \"1\")" )
  DRIVER.execute_script("localStorage.setItem(\"#{id}.demo.welcome_bonus\", \"1\")")
  first_last_name
  sleep 1
end
