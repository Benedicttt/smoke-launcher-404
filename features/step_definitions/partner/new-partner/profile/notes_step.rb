When /^Notes$/ do
  %w[ notes1  notes2 ].each do |i|
    DRIVER.find_element(:id, "customer_notes").clear
    DRIVER.find_element(:id, "customer_notes").send_keys(i.to_s)
    DRIVER.find_elements(:css, '.btn-primary')[4].click
    sleep 1
  end
end
