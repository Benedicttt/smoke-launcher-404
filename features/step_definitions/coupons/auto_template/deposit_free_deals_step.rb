Given(/^Template Deposit Free Deals$/) do
  DRIVER.get CommonSetting[:url_page_crm] + "/coupons/auto/edit?handler=deposit_free_deals"
  sleep 3

  DRIVER.find_element(:id, "coupon_name").clear
  DRIVER.find_element(:id, "coupon_name").send_keys("Template Deposit Free Deals Change to #{Time.now}")
  DRIVER.find_elements(:css, "button.btn.dropdown-toggle.selectpicker.btn-default")[0].click
  DRIVER.find_elements(:css, "span.text")[0].click

  DRIVER.find_element(:id, "coupon_active_from").clear
  DRIVER.find_element(:id, "coupon_active_from").send_keys(Time.now.strftime("#{Time.now.day - 2}.%m.%Y %H:%M:%S"))
  DRIVER.find_element(:id, "coupon_active_to").clear
  DRIVER.find_element(:id, "coupon_active_to").send_keys(Time.now.strftime("#{Time.now.day - 1}.%m.%Y %H:%M:%S"))
  # DRIVER.find_elements(:css, "button.btn.dropdown-toggle.selectpicker.btn-default")[1].click
  DRIVER.find_elements(:css, '.btn-primary')[1].click
  sleep 1
end
