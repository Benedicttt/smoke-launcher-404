When /^Security$/ do
  2.times do
    DRIVER.find_element(:id, "customer_password").send_keys(CommonSetting[:user_test]['pass_partner'])
    DRIVER.find_element(:id, "customer_password_confirmation").send_keys(CommonSetting[:user_test]['pass_partner'])
    DRIVER.find_elements(:css, '.btn-primary')[2].click
    sleep 1
  end
end
