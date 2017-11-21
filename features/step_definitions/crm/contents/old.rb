



Given /^Update all advises$/ do
  authorization_by_crm(DRIVER)
  DRIVER.get CommonSetting[:url_page_crm] + ""
  sleep 1
  DRIVER.find_elements(:css, ".btn-primary")[0].click

end

Given /^Update first group$/ do
  authorization_by_crm(DRIVER)
  DRIVER.get CommonSetting[:url_page_crm] + ""
  sleep 1
  DRIVER.find_elements(:css, ".btn-primary")[0].click

end

Given /^Update and set first group by question$/ do
  authorization_by_crm(DRIVER)
  DRIVER.get CommonSetting[:url_page_crm] + ""
  sleep 1
  DRIVER.find_elements(:css, ".btn-primary")[0].click

end

Given /^Create new mailer$/ do
  authorization_by_crm(DRIVER)
  DRIVER.get CommonSetting[:url_page_crm] + ""
  sleep 1
  DRIVER.find_elements(:css, ".btn-primary")[0].click

end

Given /^Create new static$/ do
  authorization_by_crm(DRIVER)
  DRIVER.get CommonSetting[:url_page_crm] + ""
  sleep 1
  DRIVER.find_elements(:css, ".btn-primary")[0].click

end
