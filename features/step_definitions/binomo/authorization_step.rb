Given /^Visit page auth_platform$/ do
  DRIVER.get CommonSetting[:app_host] + CommonSetting[:locale]
  sleep 1
  DRIVER.manage.delete_all_cookies
  DRIVER.manage.delete_cookie("agreed");
  DRIVER.manage.add_cookie(name: "agreedBeforeReg", value: "true")

  DRIVER.get CommonSetting[:app_host] + CommonSetting[:locale]
  sleep 5

  email = User.where(stage_number: ENV['stage']).last.email
  id = User.where(stage_number: ENV['stage']).last.id

  DRIVER.find_element(:css, "button[ui-sidebar-control=\"sign-in\"]").click
  sleep 3
  DRIVER.find_elements(:css, "input[name='email']")[1].send_keys(email)
  DRIVER.find_elements(:css, "input[name='password']")[1].send_keys(CommonSetting[:user_test]["pass_platform"])

  begin
    DRIVER.find_element(:css, "form > div:nth-child(5) > input").click
  rescue
    DRIVER.find_element(:css, "form > div:nth-child(5) > button").click
  end
  sleep 3
  puts_success "<br><br>#{link_report_id("#{CommonSetting[:url_user_crm]}/#{id}", " Authorized success, Email: #{email}<br><br>")}"

end
