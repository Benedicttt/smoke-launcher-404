Given /^Preparation of static data and visit homepage$/ do
end

When /^Registration traider$/ do
  DRIVER.get(CommonSetting[:app_host] + CommonSetting[:locale])
  sleep 1
  DRIVER.manage.delete_cookie("geo");
  DRIVER.manage.add_cookie(name: "geo", value: "#{ENV['geo']}")
  DRIVER.navigate.refresh
  sleep 1

  wait_until(5, :class, "btn-primary")
  DRIVER.find_element(:class, "btn-primary").click
  sleep 1
  DRIVER.find_element(:css, "input[name=email]").send_keys(EMAIL)
  DRIVER.find_element(:css, "input[name=password]").send_keys(CommonSetting[:user_test]['pass_platform'])
  2.times { DRIVER.find_element(:css, "ui-checker[name=i_agree]").click; sleep 0.5 }
  2.times { DRIVER.execute_script(CommonSetting[:currency][0]); sleep 0.3 }
  DRIVER.find_element(:css, "fieldset > div:nth-child(6) > button").click
  sleep 1
end

Then /^Email, locale, id, currency$/ do
  ApiResponse.run
end
