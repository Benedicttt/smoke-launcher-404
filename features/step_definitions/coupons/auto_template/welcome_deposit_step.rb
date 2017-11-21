Given(/^Template Welcome Bonus Deposit$/) do
  DRIVER.get CommonSetting[:url_page_crm] + "/coupons/auto?handler=welcome_bonus_deposit"
  sleep 1

  DRIVER.find_element(:id, "coupon_name").clear
  DRIVER.find_element(:id, "coupon_name").send_keys("Template Welcome Bonus Deposit Change to #{Time.now}")
  DRIVER.find_element(:css, "button.btn.dropdown-toggle.selectpicker.btn-default").click
  DRIVER.find_elements(:css, "span.text")[0].click
  DRIVER.find_elements(:css, '.btn-primary')[1].click
  sleep 1
end
