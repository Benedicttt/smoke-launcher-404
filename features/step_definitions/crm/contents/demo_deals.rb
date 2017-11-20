Given /^Set max demo deals at once (\d+)$/ do |arg1|
  authorization_by_crm(DRIVER)
  DRIVER.get CommonSetting[:url_page_crm] + "/settings"
  DRIVER.find_element(:id, "settings_max_demo_deals_at_once").clear
  DRIVER.find_element(:id, "settings_max_demo_deals_at_once").send_keys(arg1)
  sleep 1
  DRIVER.find_elements(:css, ".btn-primary")[0].click
end
