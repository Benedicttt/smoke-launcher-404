Given(/^Template common \- bonus deposit$/) do
  DRIVER.get CommonSetting[:url_page_crm] + "/coupons/patterns/new?handler=bonus_deposit&scope=common"
  sleep 1

  $name_coupons = "Common-#{Time.now}"
  DRIVER.find_element(:id, "coupon_name").send_keys($name_coupons)
  DRIVER.find_element(:id, "coupon_lifetime").clear
  DRIVER.find_element(:id, "coupon_activations").send_keys("100")
  DRIVER.find_element(:id, "coupon_lifetime").clear
  DRIVER.find_element(:id, "coupon_activations").send_keys("100")


  9.times do |i, num|
    i +=11
    DRIVER.find_element(:css, "#new_coupon > table:nth-child(#{i}) > tfoot > tr > td:nth-child(2) > #amount").clear
    DRIVER.find_element(:css, "#new_coupon > table:nth-child(#{i}) > tfoot > tr > td:nth-child(2) > #amount").send_keys("50")
    DRIVER.find_element(:css, "#new_coupon > table:nth-child(#{i}) > tfoot > tr > td:nth-child(3) > #bonus").clear
    DRIVER.find_element(:css, "#new_coupon > table:nth-child(#{i}) > tfoot > tr > td:nth-child(3) > #bonus").send_keys("10")
    DRIVER.find_element(:css, "#new_coupon > table:nth-child(#{i}) > tfoot > tr > td:nth-child(4) > #leverage").clear
    DRIVER.find_element(:css, "#new_coupon > table:nth-child(#{i}) > tfoot > tr > td:nth-child(4) > #leverage").send_keys("10")
    DRIVER.find_elements(:css, ".add-bonus-point")[i - 11].click
  end
  DRIVER.find_elements(:css, '.btn-primary')[1].click
  sleep 1
end
