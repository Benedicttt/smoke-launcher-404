Given /^Update page privacy$/ do
  authorization_by_crm(DRIVER)

  DRIVER.get CommonSetting[:url_page_crm] + "/static_pages"
  sleep 1
  DRIVER.find_element(:xpath, "//*[@class='table payment-group-table']//tbody/tr/td[text() = 'Privacy statement']//../td[4]/a").click
  sleep 1
  DRIVER.find_element(:id, "static_page_url").clear
  DRIVER.find_element(:id, "static_page_url").send_keys("privacy")
  DRIVER.find_element(:id, "static_page_title").clear
  DRIVER.find_element(:id, "static_page_title").send_keys("Privacy statement")
  DRIVER.find_elements(:css, ".btn-primary")[0].click
end

Given /^Update page agreement$/ do
  DRIVER.get CommonSetting[:url_page_crm] + "/static_pages"
  sleep 1
  DRIVER.find_element(:xpath, "//*[@class='table payment-group-table']//tbody/tr/td[text() = 'Client Agreement']//../td[4]/a").click
  sleep 1
  DRIVER.find_element(:id, "static_page_url").clear
  DRIVER.find_element(:id, "static_page_url").send_keys("agreement")
  DRIVER.find_element(:id, "static_page_title").clear
  DRIVER.find_element(:id, "static_page_title").send_keys("Client Agreement")

  DRIVER.find_elements(:css, ".btn-primary")[0].click
  sleep 1
end
