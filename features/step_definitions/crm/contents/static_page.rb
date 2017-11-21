Given /^Update page privacy$/ do
  authorization_by_crm(DRIVER)

  begin
    DRIVER.get CommonSetting[:url_page_crm] + "/static_pages"
    sleep 1
    DRIVER.find_element(:xpath, "//*[@class='table payment-group-table']//tbody/tr/td[text() = 'privacy']//../td[4]/a").click
    sleep 1
    DRIVER.find_element(:id, "static_page_url").clear
    DRIVER.find_element(:id, "static_page_url").send_keys("privacy")
    DRIVER.find_element(:id, "static_page_title").clear
    DRIVER.find_element(:id, "static_page_title").send_keys("Privacy statement")
    DRIVER.find_elements(:css, ".btn-primary")[0].click
  rescue
    DRIVER.get CommonSetting[:url_page_crm] + "/static_pages/new"
    sleep 1
    DRIVER.find_element(:id, "static_page_url").clear
    DRIVER.find_element(:id, "static_page_url").send_keys("privacy")
    DRIVER.find_element(:id, "static_page_title").clear
    DRIVER.find_element(:id, "static_page_title").send_keys("Privacy statement")
    DRIVER.find_elements(:css, ".btn-primary")[0].click
  end
end

Given /^Update page agreement$/ do
  begin
    DRIVER.get CommonSetting[:url_page_crm] + "/static_pages"
    sleep 1
    DRIVER.find_element(:xpath, "//*[@class='table payment-group-table']//tbody/tr/td[text() = 'agreement']//../td[4]/a").click
    sleep 1
    DRIVER.find_element(:id, "static_page_url").clear
    DRIVER.find_element(:id, "static_page_url").send_keys("agreement")
    DRIVER.find_element(:id, "static_page_title").clear
    DRIVER.find_element(:id, "static_page_title").send_keys("Client Agreement")
    DRIVER.find_elements(:css, ".btn-primary")[0].click

  rescue
    DRIVER.get CommonSetting[:url_page_crm] + "/static_pages/new"
    sleep 1
    DRIVER.find_element(:id, "static_page_url").clear
    DRIVER.find_element(:id, "static_page_url").send_keys("agreement")
    DRIVER.find_element(:id, "static_page_title").clear
    DRIVER.find_element(:id, "static_page_title").send_keys("Client Agreement")
    DRIVER.find_elements(:css, ".btn-primary")[0].click
  end
  sleep 1
end
