Given /^Visit page auth_platform$/ do
  DRIVER.get CommonSetting[:app_host] + CommonSetting[:locale]
  DRIVER.manage.delete_all_cookies
  DRIVER.manage.add_cookie(name: "agreed", value: "1")
  DRIVER.manage.add_cookie(name: "agreedBeforeReg", value: "true")

  DRIVER.get CommonSetting[:app_host] + CommonSetting[:locale]
  sleep 5

  email = User.where(stage_number: ENV['stage']).last.email
  id = User.where(stage_number: ENV['stage']).last.id

  DRIVER.find_element(:css, "button[ui-sidebar-control=\"sign-in\"]").click
  sleep 3
  DRIVER.find_element(:css, "form > div:nth-child(1) > ui-input > div > input").send_keys(email)
  DRIVER.find_element(:css, "form > div:nth-child(2) > ui-input > div > input").send_keys(CommonSetting[:user_test]["pass_platform"])
  DRIVER.find_element(:css, "form > div:nth-child(5) > input").click
  sleep 3
  puts_success "<br><br>#{link_report_id("#{CommonSetting[:url_user_crm]}/#{id}", " Authorized success, Email: #{email}<br><br>")}"
end
