def authorization_by_crm(driver)
  driver.get(CommonSetting[:url_page_crm])
  sleep 3
  if driver.current_url === CommonSetting[:url_page_crm] + "login"
    retried_process(3, 3) do
      driver.find_element(:id, "email").send_keys(CommonSetting[:user_crm]['login'])
      driver.find_element(:id, "password").send_keys(CommonSetting[:user_crm]['password'])
      driver.find_element(:css, 'input[value="Sign in"]').click
    end
  end
end
