Given /^Select only tarrif first$/ do
  PartnersSmoke::Admin.authorize

  DRIVER.get CommonSetting[:url_adm_partner] + "/customers"
  wait_until(5, :css, "#dt_basic > thead > tr:nth-child(2) > th.sorting_asc")
  DRIVER.find_element(:css, '#dt_basic > thead > tr:nth-child(2) > th.sorting_asc').click
  sleep 1
  id = DRIVER.find_elements(:css, "td.sorting_1")[0].text
  DRIVER.get CommonSetting[:url_adm_partner] + "/customers/" + id.to_s + "/edit"
  sleep 1

  DRIVER.execute_script("$('option[value]').selected()")
  sleep 3

  DRIVER.find_elements(:id, "customer_tariff_data_attributes_profit_reduce_rates_attributes_0_value")[0].send_keys("0.5")
  2.times do
    sleep 1
    DRIVER.find_elements(:id, 'customer_tariff_active')[0].click ; sleep 0.5
    DRIVER.find_elements(:css, "button.btn.btn-primary")[5].click
  end
  DRIVER.save_screenshot "part.png"
end
