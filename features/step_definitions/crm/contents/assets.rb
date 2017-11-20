Given /^Set percet rate and time$/ do
  authorization_by_crm(DRIVER)
  DRIVER.get CommonSetting[:url_page_crm] + "/stock_assets"
  sleep 1
  DRIVER.find_element(:id, "assets_reduce_rates_time_from").send_keys("11:00")
  DRIVER.find_element(:id, "assets_reduce_rates_time_to").send_keys("11:15")
  DRIVER.find_element(:id, "assets_reduce_rates_value").clear
  DRIVER.find_element(:id, "assets_reduce_rates_value").send_keys("15")

  DRIVER.find_elements(:css, ".btn-small")[0].click
end


#######
Given /^Set ric GOL\/OTC all defaults params$/ do
  authorization_by_crm(DRIVER)
  DRIVER.get CommonSetting[:url_page_crm] + "/stock_assets"
  sleep 1
  begin
    DRIVER.find_element(:xpath, '//*[@class="sortable-row"]//td[text() = "GOL ЗА-РОСТ"]//../td[10]').click
  rescue Selenium::WebDriver::Error::NoSuchElementError
    DRIVER.find_element(:xpath, '//*[@class="sortable-row"]//td[text() = "FOR/HEIGHT"]//../td[10]').click
  end

  sleep 1
  DRIVER.find_element(:id, "asset_name").clear
  DRIVER.find_element(:id, "asset_name").send_keys("FOR/HEIGHT")
  DRIVER.find_element(:id, "asset_payment_rate_turbo").clear
  DRIVER.find_element(:id, "asset_payment_rate_turbo").send_keys("83")
  DRIVER.find_element(:id, "asset_payment_rate_binary").clear
  DRIVER.find_element(:id, "asset_payment_rate_binary").send_keys("84")
  DRIVER.execute_script("$('span.text:contains(\"On\")').click()")
  DRIVER.execute_script("$('#On').prop('checked', false)")
  DRIVER.execute_script("$('#asset_test').prop('checked', false)")
  DRIVER.execute_script("$('#asset_enabled_for_option').prop('checked', true)")
  DRIVER.execute_script("$('#asset_enabled_for_cfd').prop('checked', false)")
  DRIVER.execute_script("$('#asset_enabled_for_demo').prop('checked', true)")
  DRIVER.execute_script("$('#asset_enabled_for_demo_cfd').prop('checked', false)")
  (1..12).each do |i|
    DRIVER.execute_script("$('asset_statuses_#{i}_active').prop('checked', true)")
    DRIVER.find_element(:id, "asset_statuses_#{i}_payment_rate_increment").clear
    DRIVER.find_element(:id, "asset_statuses_#{i}_payment_rate_increment").send_keys("#{i}")
  end

  days = []
  DRIVER.find_elements(:css, '.span3 > label').each { |day| days << day.text.downcase }

  days.each do |day|
    DRIVER.find_element(:id, "asset_schedule_#{day}_0").clear
    DRIVER.find_element(:id, "asset_schedule_#{day}_0").send_keys("00:00")
    DRIVER.find_element(:id, "asset_schedule_#{day}_1").clear
    DRIVER.find_element(:id, "asset_schedule_#{day}_1").send_keys("23:59")
    DRIVER.execute_script("$('#asset_daily_asset_schedule[#{day}]').prop('checked', true)")

    DRIVER.find_element(:id, "asset_schedule_cfd_#{day}_0").clear
    DRIVER.find_element(:id, "asset_schedule_cfd_#{day}_0").send_keys("00:00")
    DRIVER.find_element(:id, "asset_schedule_cfd_#{day}_1").clear
    DRIVER.find_element(:id, "asset_schedule_cfd_#{day}_1").send_keys("23:59")
  end

  asset = File.absolute_path('./app/assets/images/asset.jpg')
  DRIVER.find_element(:id, "asset_pic").send_keys(asset)
  sleep 1

  DRIVER.find_elements(:css, ".btn-primary")[2].click
  sleep 1
end
