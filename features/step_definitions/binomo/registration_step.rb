Given /^Preparation of static data and visit homepage$/ do
end

When /^Registration traider$/ do
  DRIVER.get(CommonSetting[:app_host] + CommonSetting[:locale])
  sleep 1
  DRIVER.manage.delete_cookie("geo");
  DRIVER.manage.add_cookie(name: "geo", value: "#{ENV['geo']}")
  DRIVER.navigate.refresh
  sleep 3

  wait_until(5, :class, "btn-primary")
  DRIVER.find_element(:class, "btn-primary").click
  sleep 1
  DRIVER.find_element(:css, "input[type=email]").send_keys(EMAIL)
  DRIVER.find_element(:css, "input[type=password]").send_keys(CommonSetting[:user_test]['pass_platform'])
  # DRIVER.find_element(:css, "span[ng-bind='::vm.title']").click if ENV['geo'] != "RU"
  sleep 0.5
  # 1.times { DRIVER.find_element(:css, "span[ng-bind='::vm.title']").click; sleep 0.5 }
  sleep 1
  DRIVER.execute_script(CommonSetting[:currency][0])
  sleep 4
  DRIVER.find_element(:class, "btn-primary").click
  # Runner.call_crm("User.last.update(agreed: true)")

  sleep 1
end

Then /^Email, locale, id, currency$/ do
  ApiResponse.run
end
