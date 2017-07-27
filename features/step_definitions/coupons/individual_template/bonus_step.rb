Given(/^Template Bonus$/) do
  DRIVER.get CommonSetting[:url_page_crm] + "/coupons/patterns/new?handler=bonus&scope=individual"
  sleep 1

  DRIVER.find_element(:id, "coupon_name").clear
  DRIVER.find_element(:id, "coupon_name").send_keys("#{Time.now}")

  DRIVER.find_element(:id, "coupon_lifetime").clear
  DRIVER.find_element(:id, "coupon_lifetime").send_keys('1')
  DRIVER.find_elements(:css, "button.btn.dropdown-toggle.selectpicker.btn-default")[0].click
  DRIVER.find_elements(:css, "span.text")[0].click

  DRIVER.find_element(:id, "coupon_data_currencies_USD_amount").clear
  DRIVER.find_element(:id, "coupon_data_currencies_USD_amount").send_keys("10")
  DRIVER.find_element(:id, "coupon_data_currencies_USD_leverage").clear
  DRIVER.find_element(:id, "coupon_data_currencies_USD_leverage").send_keys("10")

  DRIVER.find_element(:id, "coupon_data_currencies_EUR_amount").clear
  DRIVER.find_element(:id, "coupon_data_currencies_EUR_amount").send_keys("10")
  DRIVER.find_element(:id, "coupon_data_currencies_EUR_leverage").clear
  DRIVER.find_element(:id, "coupon_data_currencies_EUR_leverage").send_keys("10")

  DRIVER.find_element(:id, "coupon_data_currencies_RUB_amount").clear
  DRIVER.find_element(:id, "coupon_data_currencies_RUB_amount").send_keys("1000")
  DRIVER.find_element(:id, "coupon_data_currencies_RUB_leverage").clear
  DRIVER.find_element(:id, "coupon_data_currencies_RUB_leverage").send_keys("10")

  DRIVER.find_element(:id, "coupon_data_currencies_KZT_amount").clear
  DRIVER.find_element(:id, "coupon_data_currencies_KZT_amount").send_keys("10000")
  DRIVER.find_element(:id, "coupon_data_currencies_KZT_leverage").clear
  DRIVER.find_element(:id, "coupon_data_currencies_KZT_leverage").send_keys("10")

  DRIVER.find_elements(:css, '.btn-primary')[1].click
  sleep 1
  $id_bonus = URI(DRIVER.current_url).path.gsub(/\/coupons\/patterns\//, '').gsub(/\/edit/, '')

  DRIVER.find_element(:id, "coupon_name").clear
  DRIVER.find_element(:id, "coupon_name").send_keys("#{$id_bonus}")
  DRIVER.find_elements(:css, '.btn-primary')[1].click
  sleep 1
end
