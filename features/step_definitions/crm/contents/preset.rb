Given /^Create one preset$/ do
  authorization_by_crm(DRIVER)
  DRIVER.get CommonSetting[:url_page_crm] + "/presets/new"
  sleep 5
  refcode = Partner.last.refcode

  DRIVER.find_element(:id, "preset_title").send_keys(SecureRandom.hex(4).to_s)
  DRIVER.find_element(:id, "preset_refcodes").send_keys(refcode.to_s)
  DRIVER.find_elements(:css, ".btn-primary")[0].click
  sleep 1
  DRIVER.find_element(:xpath, "//*[@id='main-content']/div/table/tbody/tr[2]/td[1]") == refcode.to_s
end
