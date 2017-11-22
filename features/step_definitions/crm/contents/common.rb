Given /^Set sales manage all$/ do
  authorization_by_crm(DRIVER)
  DRIVER.get CommonSetting[:url_page_crm] + "/settings"
  sleep 1
  DRIVER.find_element(:id, "settings_n_user").click
  DRIVER.find_elements(:css, ".btn-primary")[0].click
end

Given /^Set Assets: break: true, dynamic: \-(\d+), win rate: (\d+)$/ do |arg1, arg2|
  DRIVER.execute_script("$('#settings_break_enabled').prop('checked', true)")
  sleep 0.2
  DRIVER.find_element(:id, "settings_break_dynamic").clear
  sleep 1
  DRIVER.find_element(:id, "settings_break_win_rate").clear
  sleep 1
  DRIVER.find_element(:id, "settings_break_dynamic").send_keys("-300")
  sleep 0.5
  DRIVER.find_element(:id, "settings_break_win_rate").send_keys(arg2)
end

Given /^Set SMTP server default$/ do
  DRIVER.execute_script("$(\"span.text:contains('default')\")[0].click()")
end

Given /^Set Mail provider SendGrid$/ do
  DRIVER.execute_script("$(\"span.text:contains('send_grid')\")[0].click()")
end

Given /^Set Captcha sign_in false$/ do
  DRIVER.execute_script("$('#settings_sign_in_captcha_enabled').prop('checked', false)")
end

Given /^Set Captcha sign_up false$/ do
  DRIVER.execute_script("$('#settings_sign_up_captcha_enabled').prop('checked', false)")
end

Given /^Set Tutorial false$/ do
  DRIVER.execute_script("$('#settings_tutorial_enabled').prop('checked', false)")
end

Given /^CFD enabled true$/ do
  DRIVER.execute_script("$('#settings_cfd_enabled').prop('checked', true)")
end
