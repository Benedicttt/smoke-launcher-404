Given /^Add and update new link$/ do
  authorization_by_crm(DRIVER)
  DRIVER.get CommonSetting[:url_page_crm] + ""
  sleep 1
  
  DRIVER.find_elements(:css, ".btn-primary")[0].click
end
