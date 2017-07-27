Given /^Connect to the CRM provider "(.*?)"$/ do |provider|
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
  DRIVER.get(CommonSetting[:url_page_crm] + "/payment_groups")
  DRIVER.get(CommonSetting[:url_page_crm] + "/payment_groups")
  sleep 2

  sleep 1
  DRIVER.find_elements(:css, 'a.btn')[1].click

  sleep 3
  DRIVER.find_elements(:css, 'a.btn')[0].click
  sleep 1

    if provider == "Credit card"
      DRIVER.execute_script("$(\"span:contains('Ecommpay')\").click()")
    end

    if provider == "Card Pay"
      DRIVER.execute_script("$(\"span:contains('Cardpay')\").click()")
    end

    if provider == "WireCapital"
      DRIVER.execute_script("$(\"span:contains('WireCapital')\").click()")
    end
  sleep 0.5
  DRIVER.find_element(:css, '.btn-primary').click
  sleep 1
  puts_info("include #{DRIVER.find_element(:css, '#main-content > div > form.form > table > tbody > tr:nth-child(1) > td:nth-child(3)').text}")
end
