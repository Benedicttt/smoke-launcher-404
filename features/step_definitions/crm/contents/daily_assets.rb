Given /^Set daily asset ric GOL\/OTC, percents (\d+)$/ do |arg1|
  authorization_by_crm(DRIVER)
  DRIVER.get CommonSetting[:url_page_crm] + "/daily_assets"
  (0..6).each do |i|
    DRIVER.execute_script("$('#daily_assets_#{i}_random').prop('checked', true)")
    DRIVER.find_element(:id, "daily_assets_#{i}_percent").clear
    DRIVER.find_element(:id, "daily_assets_#{i}_percent").send_keys(arg1)
  end
  sleep 1
  DRIVER.find_elements(:css, ".btn-primary")[0].click
end
