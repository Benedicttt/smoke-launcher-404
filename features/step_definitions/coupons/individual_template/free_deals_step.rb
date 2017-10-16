Given(/^Template Free Deals$/) do
  DRIVER.get CommonSetting[:url_page_crm] + "/coupons/patterns/new?handler=free_deals&scope=individual"
  sleep 1

  DRIVER.find_element(:id, "coupon_name").clear
  DRIVER.find_element(:id, "coupon_name").send_keys("#{Time.now}")

  DRIVER.find_element(:id, "coupon_lifetime").clear
  DRIVER.find_element(:id, "coupon_lifetime").send_keys('1')
  DRIVER.find_elements(:css, "button.btn.dropdown-toggle.selectpicker.btn-default")[0].click
  DRIVER.find_elements(:css, "span.text")[0].click


  %w[USD EUR].each do |name|
    DRIVER.find_element(:id, "coupon_data_currencies_#{name}_amount").clear
    DRIVER.find_element(:id, "coupon_data_currencies_#{name}_amount").send_keys("10")
    DRIVER.find_element(:id, "coupon_data_currencies_#{name}_limit").clear
    DRIVER.find_element(:id, "coupon_data_currencies_#{name}_limit").send_keys("10")
  end

  %w[RUB KZT CNY TRY UAH INR ZAR].each do |name|
    DRIVER.find_element(:id, "coupon_data_currencies_#{name}_amount").clear
    DRIVER.find_element(:id, "coupon_data_currencies_#{name}_amount").send_keys("1000")
    DRIVER.find_element(:id, "coupon_data_currencies_#{name}_limit").clear
    DRIVER.find_element(:id, "coupon_data_currencies_#{name}_limit").send_keys("10")
  end

  DRIVER.find_elements(:css, '.btn-primary')[1].click
  sleep 1
  $id_free_deals = URI(DRIVER.current_url).path.gsub(/\/coupons\/patterns\//, '').gsub(/\/edit/, '')

  DRIVER.find_element(:id, "coupon_name").clear
  DRIVER.find_element(:id, "coupon_name").send_keys("#{$id_free_deals}")
  DRIVER.find_elements(:css, '.btn-primary')[1].click
  sleep 1
end
