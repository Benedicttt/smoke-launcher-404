Given(/^Template Free Deals$/) do
  DRIVER.get CommonSetting[:url_page_crm] + "/coupons/patterns/new?handler=free_deals&scope=individual"
  sleep 1

  DRIVER.find_element(:id, "coupon_name").clear
  DRIVER.find_element(:id, "coupon_name").send_keys("#{Time.now}")

  DRIVER.find_element(:id, "coupon_lifetime").clear
  DRIVER.find_element(:id, "coupon_lifetime").send_keys('1')
  DRIVER.find_elements(:css, "button.btn.dropdown-toggle.selectpicker.btn-default")[0].click
  DRIVER.find_elements(:css, "span.text")[0].click

  DRIVER.find_element(:id, "coupon_data_currencies_USD_amount").clear
  DRIVER.find_element(:id, "coupon_data_currencies_USD_amount").send_keys("10")
  DRIVER.find_element(:id, "coupon_data_currencies_USD_limit").clear
  DRIVER.find_element(:id, "coupon_data_currencies_USD_limit").send_keys("10")

  DRIVER.find_element(:id, "coupon_data_currencies_EUR_amount").clear
  DRIVER.find_element(:id, "coupon_data_currencies_EUR_amount").send_keys("10")
  DRIVER.find_element(:id, "coupon_data_currencies_EUR_limit").clear
  DRIVER.find_element(:id, "coupon_data_currencies_EUR_limit").send_keys("10")

  DRIVER.find_element(:id, "coupon_data_currencies_RUB_amount").clear
  DRIVER.find_element(:id, "coupon_data_currencies_RUB_amount").send_keys("1000")
  DRIVER.find_element(:id, "coupon_data_currencies_RUB_limit").clear
  DRIVER.find_element(:id, "coupon_data_currencies_RUB_limit").send_keys("10")

  DRIVER.find_element(:id, "coupon_data_currencies_KZT_amount").clear
  DRIVER.find_element(:id, "coupon_data_currencies_KZT_amount").send_keys("10000")
  DRIVER.find_element(:id, "coupon_data_currencies_KZT_limit").clear
  DRIVER.find_element(:id, "coupon_data_currencies_KZT_limit").send_keys("10")

  DRIVER.find_elements(:css, '.btn-primary')[1].click
  sleep 1
  $id_free_deals = URI(DRIVER.current_url).path.gsub(/\/coupons\/patterns\//, '').gsub(/\/edit/, '')

  DRIVER.find_element(:id, "coupon_name").clear
  DRIVER.find_element(:id, "coupon_name").send_keys("#{$id_free_deals}")
  DRIVER.find_elements(:css, '.btn-primary')[1].click
  sleep 1
end
