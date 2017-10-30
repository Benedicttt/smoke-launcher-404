Then /^Assert registartion$/ do
  DRIVER.switch_to.window(DRIVER.window_handles[0])
  reg = DRIVER.find_element(:id, 'reg')
  sleep 1
  DRIVER.switch_to.frame reg
    DRIVER.find_element(:css, ".sign-up-btn").click
    sleep 1
    DRIVER.get CommonSetting[:app_host]
    sleep 1

    puts_info "Redirect page /trading #{DRIVER.current_url == CommonSetting[:app_host] + CommonSetting[:locale] + "/trading"}"
end

Then /^Assert registartion new$/ do
  DRIVER.switch_to.window(DRIVER.window_handles[0])
  sleep 1
  reg_new = DRIVER.find_element(:id, 'reg-new')
  DRIVER.switch_to.frame reg_new
    DRIVER.find_element(:css, ".sign-up-btn").click
    sleep 1
    DRIVER.get CommonSetting[:app_host]
    sleep 1
    puts_info "Redirect page /trading #{DRIVER.current_url == CommonSetting[:app_host] + CommonSetting[:locale] + "/trading"}"
  end
