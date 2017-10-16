When /^Add data input and submit registration$/ do
  reg = DRIVER.find_element(:id, 'reg')
  DRIVER.switch_to.frame reg
    DRIVER.find_element(:css, "input[name=email]").send_keys(CommonSetting[:email_name] + "#{SecureRandom.hex(8)}@yopmail.com")
    DRIVER.find_element(:css, "input[name=password]").send_keys(CommonSetting[:user_test]['pass_platform'])
    DRIVER.find_element(:css, '.checkbox').click
    sleep 1

  DRIVER.switch_to.window(DRIVER.window_handles[0])
end

When /^Add data input and submit registration new$/ do
  reg_new = DRIVER.find_element(:id, 'reg-new')
  DRIVER.switch_to.frame reg_new

    DRIVER.find_element(:css, "input[name=email]").send_keys(CommonSetting[:email_name] + "#{SecureRandom.hex(8)}@yopmail.com")
    DRIVER.find_element(:css, "input[name=password]").send_keys(CommonSetting[:user_test]['pass_platform'])
    DRIVER.find_element(:css, '.checkbox').click
    sleep 1

  DRIVER.switch_to.window(DRIVER.window_handles[0])
end
