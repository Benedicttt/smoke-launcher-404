Given(/^Template common \- bonus deposit$/) do
  DRIVER.get CommonSetting[:url_page_crm] + "/coupons/patterns/new?handler=bonus_deposit&scope=common"
  sleep 1

  $name_coupons = "Common-#{Time.now}"
  DRIVER.find_element(:id, "coupon_name").send_keys($name_coupons)
  DRIVER.find_element(:id, "coupon_lifetime").send_keys("000")
  DRIVER.find_element(:id, "coupon_activations").send_keys("000")

  DRIVER.find_element(:css, "#new_coupon > table:nth-child(11) > tfoot > tr > td:nth-child(2) > #amount").clear
  DRIVER.find_element(:css, "#new_coupon > table:nth-child(11) > tfoot > tr > td:nth-child(2) > #amount").send_keys("10")
  DRIVER.find_element(:css, "#new_coupon > table:nth-child(11) > tfoot > tr > td:nth-child(3) > #bonus").clear
  DRIVER.find_element(:css, "#new_coupon > table:nth-child(11) > tfoot > tr > td:nth-child(3) > #bonus").send_keys("10")
  DRIVER.find_element(:css, "#new_coupon > table:nth-child(11) > tfoot > tr > td:nth-child(4) > #leverage").clear
  DRIVER.find_element(:css, "#new_coupon > table:nth-child(11) > tfoot > tr > td:nth-child(4) > #leverage").send_keys("10")
  DRIVER.find_elements(:css, ".add-bonus-point")[0].click

  DRIVER.find_element(:css, "#new_coupon > table:nth-child(12) > tfoot > tr > td:nth-child(2) > #amount").clear
  DRIVER.find_element(:css, "#new_coupon > table:nth-child(12) > tfoot > tr > td:nth-child(2) > #amount").send_keys("10")
  DRIVER.find_element(:css, "#new_coupon > table:nth-child(12) > tfoot > tr > td:nth-child(3) > #bonus").clear
  DRIVER.find_element(:css, "#new_coupon > table:nth-child(12) > tfoot > tr > td:nth-child(3) > #bonus").send_keys("10")
  DRIVER.find_element(:css, "#new_coupon > table:nth-child(12) > tfoot > tr > td:nth-child(4) > #leverage").clear
  DRIVER.find_element(:css, "#new_coupon > table:nth-child(12) > tfoot > tr > td:nth-child(4) > #leverage").send_keys("10")
  DRIVER.find_elements(:css, ".add-bonus-point")[1].click

  DRIVER.find_element(:css, "#new_coupon > table:nth-child(13) > tfoot > tr > td:nth-child(2) > #amount").clear
  DRIVER.find_element(:css, "#new_coupon > table:nth-child(13) > tfoot > tr > td:nth-child(2) > #amount").send_keys("500")
  DRIVER.find_element(:css, "#new_coupon > table:nth-child(13) > tfoot > tr > td:nth-child(3) > #bonus").clear
  DRIVER.find_element(:css, "#new_coupon > table:nth-child(13) > tfoot > tr > td:nth-child(3) > #bonus").send_keys("10")
  DRIVER.find_element(:css, "#new_coupon > table:nth-child(13) > tfoot > tr > td:nth-child(4) > #leverage").clear
  DRIVER.find_element(:css, "#new_coupon > table:nth-child(13) > tfoot > tr > td:nth-child(4) > #leverage").send_keys("10")
  DRIVER.find_elements(:css, ".add-bonus-point")[2].click

  DRIVER.find_element(:css, "#new_coupon > table:nth-child(14) > tfoot > tr > td:nth-child(2) > #amount").clear
  DRIVER.find_element(:css, "#new_coupon > table:nth-child(14) > tfoot > tr > td:nth-child(2) > #amount").send_keys("1000")
  DRIVER.find_element(:css, "#new_coupon > table:nth-child(14) > tfoot > tr > td:nth-child(3) > #bonus").clear
  DRIVER.find_element(:css, "#new_coupon > table:nth-child(14) > tfoot > tr > td:nth-child(3) > #bonus").send_keys("10")
  DRIVER.find_element(:css, "#new_coupon > table:nth-child(14) > tfoot > tr > td:nth-child(4) > #leverage").clear
  DRIVER.find_element(:css, "#new_coupon > table:nth-child(14) > tfoot > tr > td:nth-child(4) > #leverage").send_keys("10")
  DRIVER.find_elements(:css, ".add-bonus-point")[3].click
  DRIVER.find_elements(:css, '.btn-primary')[1].click
  sleep 1
end
