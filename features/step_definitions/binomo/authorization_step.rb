Given /^Visit page auth_platform$/ do
  DRIVER.get CommonSetting[:app_host] + CommonSetting[:locale]
  DRIVER.manage.delete_all_cookies
  DRIVER.get CommonSetting[:app_host] + CommonSetting[:locale]
  sleep 1

  email = User.where(stage_number: ENV['stage']).last.email
  id = User.where(stage_number: ENV['stage']).last.id
  DRIVER.find_element(:css, "div:nth-child(2) > div > button").click
  sleep 1
  DRIVER.find_element(:css, "form > div:nth-child(1) > ui-input > div > input").send_keys(email)
  DRIVER.find_element(:css, "form > div:nth-child(2) > ui-input > div > input").send_keys(CommonSetting[:user_test]["pass_platform"])
  DRIVER.find_element(:css, "form > div:nth-child(5) > input").click
  sleep 1

  puts_success "<br><br>#{link_report_id("#{CommonSetting[:url_user_crm]}/#{id}", " Authorized success, Email: #{email}<br><br>")}"
end
