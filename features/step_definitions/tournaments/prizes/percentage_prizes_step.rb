When /^Add prize real percantage$/ do
  sleep 0.3
  10.times { DRIVER.find_element(:css, ".add-prize").click }
  DRIVER.execute_script("$(\"span:contains('Real Money')\").click()")

  %w[35 20 14 12 5 4 3.5 3 2.5 1].each_with_index do |num, index|
    DRIVER.find_elements(:css, ".prize-percent")[index].send_keys(num)
  end

end

When /^Add prize bonus percantage$/ do
  sleep 0.3
  10.times { DRIVER.find_element(:css, ".add-prize").click }
  DRIVER.execute_script("$(\"span:contains('Bonus')\").click()")

#percent bonus
  %w[35 20 14 12 5 4 3.5 3 2.5 1].each_with_index do |num, index|
    DRIVER.find_elements(:css, ".prize-percent")[index].send_keys(num)
  end
#bonus
  %w[50 40 35 30 25 20 20 20 20 20].each_with_index do |num, index|
    DRIVER.find_elements(:css, ".prize-leverage")[index].send_keys(num)
  end
end
