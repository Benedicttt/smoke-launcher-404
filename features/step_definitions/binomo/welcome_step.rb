Given /^Visit page Welcome$/ do
end

When /^Fill \/welcome$/ do
    DRIVER.navigate.refresh
    wait_until(10, :css, "ui-input[ng-model='vm.first_name'] > div > input[ng-attr-name='{{vm.name}}']")
    DRIVER.find_element(:css, "ui-input[ng-model='vm.first_name'] > div > input[ng-attr-name='{{vm.name}}']").send_keys("stage selenium")
    sleep 0.5
    DRIVER.find_element(:css, "ui-input[ng-model='vm.last_name'] > div > input[ng-attr-name='{{vm.name}}']").send_keys("stage selenium")
    sleep 0.5
    DRIVER.execute_script("$('button.btn.btn-secondary.btn-lg.stretch').click()")
    sleep 0.5
end

Then /^Redirect pages tutorial and agree risk$/ do
    DRIVER.get(CommonSetting[:app_host] + CommonSetting[:locale] + "/tutorial")
    sleep 2
    wait_until(5, :class, "step-nav")
    DRIVER.execute_script("$('.step-nav')[0].click()")
    DRIVER.execute_script("$('.step-nav')[1].click()")
    DRIVER.execute_script("$('.step-nav')[3].click()")
    DRIVER.execute_script("$('.step-nav')[2].click()")
    DRIVER.execute_script("$('.btn').scope().vm.goAhead()")

    wait_until(5, :class, "modal-content")
    sleep 1
    DRIVER.execute_script("$('body > div.modal.modal-lg.modal-no-offsets.modal-theme-dark.fade.ng-scope.ng-isolate-scope.in > div > div > div > div > p.confirmation > label > input').click().trigger('change')")
    sleep 0.5
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
