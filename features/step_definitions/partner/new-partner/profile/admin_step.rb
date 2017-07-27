When /^Administration$/ do
  [9, 10].each do |i|
    DRIVER.find_element(:id, "customer_deal_rate").clear
    DRIVER.find_element(:id, "customer_deal_rate").send_keys(i.to_s)
    sleep 0.3
    DRIVER.find_elements(:css, '.btn-primary')[3].click
    sleep 1
  end
end
