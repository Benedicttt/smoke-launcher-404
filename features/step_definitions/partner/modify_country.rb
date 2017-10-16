Given /^Open page modify country$/ do
  PartnersSmoke::Admin.authorize

  DRIVER.get CommonSetting[:url_adm_partner] + "/country_profit_reduce_rates/edit"
end
When /^Set modify country null$/ do
  DRIVER.find_element(:id, "country_profit_reduce_rates_rates_attributes_177_value").send_keys("0")
  DRIVER.find_element(:css, ".btn-primary").click
end

When /^Set modify country 1.0$/ do
  DRIVER.find_element(:id, "country_profit_reduce_rates_rates_attributes_177_value").send_keys("1.0")
  DRIVER.find_element(:css, ".btn-primary").click
end
