Given(/^Template Bonus$/) do
  DRIVER.get CommonSetting[:url_page_crm] + "/coupons/patterns/new?handler=bonus&scope=individual"
  sleep 1

  DRIVER.find_element(:id, "coupon_name").clear
  DRIVER.find_element(:id, "coupon_name").send_keys("#{Time.now}")

  DRIVER.find_element(:id, "coupon_lifetime").clear
  DRIVER.find_element(:id, "coupon_lifetime").send_keys('100')
  DRIVER.find_elements(:css, "button.btn.dropdown-toggle.selectpicker.btn-default")[0].click
  DRIVER.find_elements(:css, "span.text")[0].click

  list_currency = []

  DRIVER.find_elements(:css, 'strong').each do |text|
    list_currency << text.text
  end

  list_currency.each do |name|
    begin
      DRIVER.find_element(:id, "coupon_data_currencies_#{name}_amount").clear
      DRIVER.find_element(:id, "coupon_data_currencies_#{name}_amount").send_keys("1000")
      DRIVER.find_element(:id, "coupon_data_currencies_#{name}_leverage").clear
      DRIVER.find_element(:id, "coupon_data_currencies_#{name}_leverage").send_keys("10")
    rescue
    end
  end

  DRIVER.find_elements(:css, '.btn-primary')[1].click
  sleep 1
  $id_bonus = URI(DRIVER.current_url).path.gsub(/\/coupons\/patterns\//, '').gsub(/\/edit/, '')

  DRIVER.find_element(:id, "coupon_name").clear
  DRIVER.find_element(:id, "coupon_name").send_keys("#{$id_bonus}")
  DRIVER.find_elements(:css, '.btn-primary')[1].click
  sleep 1
end
