Given /^Update one user admin$/ do
  authorization_by_crm(DRIVER)
  DRIVER.get CommonSetting[:url_page_crm] + "/admin_users"
  sleep 1
  DRIVER.find_element(:css, "#tab-content-active > table > tbody > tr:nth-child(2) > td:nth-child(1) > a").click
  sleep 1
  DRIVER.find_elements(:css, ".btn-primary")[0].click
  sleep 1
  DRIVER.find_elements(:css, ".btn-primary")[0].click
end
