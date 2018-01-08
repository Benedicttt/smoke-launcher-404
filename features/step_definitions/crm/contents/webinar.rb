
Given /^Set Server webinar time$/ do
  authorization_by_crm(DRIVER)
  DRIVER.get CommonSetting[:url_page_crm] + "/settings"
  date_now = Time.now
  date_to = Time.now.strftime("#{date_now.day + 1}.%m.%Y %H:%M:%S")
  DRIVER.find_element(:id, "settings_webinar_time").send_keys(date_to)
end

Given /^Set URL webinar$/ do
  DRIVER.find_element(:id, "settings_webinar_url").send_keys("https://youtu.be/jNMJQ5RqMQ8")
  sleep 1
  DRIVER.find_elements(:css, ".btn-primary")[0].click
end
