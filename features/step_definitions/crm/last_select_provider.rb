Given /^Last select provider to crm(Eccompay)$/ do
  DRIVER.get(CommonSetting[:url_page_crm])
  sleep 3
  if DRIVER.current_url === CommonSetting[:url_page_crm] + "login"
    retried_process(3, 3) do
      DRIVER.find_element(:id, "email").send_keys(CommonSetting[:user_crm]['login'])
      DRIVER.find_element(:id, "password").send_keys(CommonSetting[:user_crm]['password'])
      DRIVER.find_element(:css, 'input[value="Sign in"]').click
    end
  end

  sleep 2
  DRIVER.get(CommonSetting[:url_page_crm] + "payment_groups")
  sleep 1
  DRIVER.get(CommonSetting[:url_page_crm] + "payment_groups")
  sleep 2

  sleep 3
  DRIVER.find_elements(:css, 'a.btn')[1].click

  sleep 5
  DRIVER.find_elements(:css, 'a.btn')[0].click
  sleep 1

  DRIVER.execute_script("$(\"span:contains('Ecommpay')\").click()")
  sleep 0.5
  DRIVER.find_element(:css, '.button.btn.btn-primary').send_keys:return
  sleep 1
  puts_warning("include #{DRIVER.find_element(:css, '#main-content > div > form.form > table > tbody > tr:nth-child(1) > td:nth-child(3)').text}")
end
