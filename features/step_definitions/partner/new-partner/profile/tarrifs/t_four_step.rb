Given /^Select only tarrif CPL SOI$/ do
  PartnersSmoke::Admin.authorize

  DRIVER.get CommonSetting[:url_adm_partner] + "/customers"
  wait_until(5, :css, "#dt_basic > thead > tr:nth-child(2) > th.sorting_asc")
  DRIVER.find_element(:css, '#dt_basic > thead > tr:nth-child(2) > th.sorting_asc').click
  sleep 1
  
  id = DRIVER.find_elements(:css, "td.sorting_1")[0].text
  DRIVER.get CommonSetting[:url_adm_partner] + "/customers/" + id.to_s + "/edit"

  DRIVER.find_elements(:css, "input#customer_tariff_data_attributes_0_profit")[1].clear
  DRIVER.find_elements(:css, "input#customer_tariff_data_attributes_0_profit")[1].send_keys('400')
  DRIVER.find_elements(:css, "input#customer_tariff_data_attributes_1_profit")[1].clear
  DRIVER.find_elements(:css, "input#customer_tariff_data_attributes_1_profit")[1].send_keys('1000')
  DRIVER.find_elements(:css, "option[value=RU]")[1].click

  3.times do
    DRIVER.find_elements(:id, 'customer_tariff_active')[4].click ; sleep 0.5
    DRIVER.find_elements(:css, "button.btn.btn-primary")[9].click
  end

end
