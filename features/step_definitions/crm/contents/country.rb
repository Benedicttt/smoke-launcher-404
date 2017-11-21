Given /^Set country RU curency USD, EUR, RUB \- default RUB$/ do
  authorization_by_crm(DRIVER)
  DRIVER.get CommonSetting[:url_page_crm] + "/countries/177/edit"
  sleep 1

  %i[USD EUR RUB].each do |i|
    DRIVER.execute_script("$('#country_available_currencies_#{i.downcase}').prop('checked', true)")
  end
  DRIVER.execute_script("$('#country_default_currency_rub').prop('checked', true)")
  sleep 1
  DRIVER.find_elements(:css, ".btn-primary")[0].click
end
