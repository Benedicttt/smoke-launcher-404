
When /^Add prize free fixed$/ do
  sleep 0.3
  10.times { DRIVER.find_element(:css, ".add-prize").click }
  DRIVER.execute_script("$(\"span:contains('Free Deals')\").click()")

#KZT
  %w[7500000 450000 300000 180000 120000 90000 75000 60000 45000 30000].each_with_index do |num, index|
    DRIVER.find_elements(:css, ".prize-fund-item")[index * 8 + 2].send_keys(num.to_s)
  end

  %w[2500 1500 1000 600 400 300 250 200 150 100].each_with_index do |num, index|
    #USD
    DRIVER.find_elements(:css, ".prize-fund-item")[index * 8].send_keys(num.to_s)
    #EUR
    DRIVER.find_elements(:css, ".prize-fund-item")[index * 8 + 1].send_keys(num.to_s)
    #CNY
    DRIVER.find_elements(:css, ".prize-fund-item")[index * 8 + 3].send_keys(num.to_s)
    #INR
    DRIVER.find_elements(:css, ".prize-fund-item")[index * 8 + 4].send_keys(num.to_s)
    #TRY
    DRIVER.find_elements(:css, ".prize-fund-item")[index * 8 + 5].send_keys(num.to_s)
    #UAH
    DRIVER.find_elements(:css, ".prize-fund-item")[index * 8 + 7].send_keys(num.to_s)
  end

#RUB
  %w[150000 90000 60000 36000 24000 18000 15000 12000 9000 6000].each_with_index do |num, index|
    DRIVER.find_elements(:css, ".prize-fund-item")[index * 8 + 6].send_keys(num.to_s)
  end
#LIMIT
  10.times.each_with_index do |num, index|
    DRIVER.find_elements(:css, ".prize-limit")[index].send_keys("1")
  end
end

When /^Add prize real fixed$/ do
  sleep 0.3
  10.times { DRIVER.find_element(:css, ".add-prize").click }
  DRIVER.execute_script("$(\"span:contains('Real Money')\").click()")


#KZT
  %w[7500000 450000 300000 180000 120000 90000 75000 60000 45000 30000].each_with_index do |num, index|
    DRIVER.find_elements(:css, ".prize-fund-item")[index * 8 + 2].send_keys(num.to_s)
  end

  %w[2500 1500 1000 600 400 300 250 200 150 100].each_with_index do |num, index|
    #USD
    DRIVER.find_elements(:css, ".prize-fund-item")[index * 8].send_keys(num.to_s)
    #EUR
    DRIVER.find_elements(:css, ".prize-fund-item")[index * 8 + 1].send_keys(num.to_s)
    #CNY
    DRIVER.find_elements(:css, ".prize-fund-item")[index * 8 + 3].send_keys(num.to_s)
    #INR
    DRIVER.find_elements(:css, ".prize-fund-item")[index * 8 + 4].send_keys(num.to_s)
    #TRY
    DRIVER.find_elements(:css, ".prize-fund-item")[index * 8 + 5].send_keys(num.to_s)
    #UAH
    DRIVER.find_elements(:css, ".prize-fund-item")[index * 8 + 7].send_keys(num.to_s)
  end

#RUB
  %w[150000 90000 60000 36000 24000 18000 15000 12000 9000 6000].each_with_index do |num, index|
    DRIVER.find_elements(:css, ".prize-fund-item")[index * 8 + 6].send_keys(num.to_s)
  end
end

When /^Add prize bonus fixed$/ do
  sleep 0.3
  10.times { DRIVER.find_element(:css, ".add-prize").click }
  DRIVER.execute_script("$(\"span:contains('Bonus')\").click()")

#KZT
  %w[7500000 450000 300000 180000 120000 90000 75000 60000 45000 30000].each_with_index do |num, index|
    DRIVER.find_elements(:css, ".prize-fund-item")[index * 8 + 2].send_keys(num.to_s)
  end

  %w[2500 1500 1000 600 400 300 250 200 150 100].each_with_index do |num, index|
    #USD
    DRIVER.find_elements(:css, ".prize-fund-item")[index * 8].send_keys(num.to_s)
    #EUR
    DRIVER.find_elements(:css, ".prize-fund-item")[index * 8 + 1].send_keys(num.to_s)
    #CNY
    DRIVER.find_elements(:css, ".prize-fund-item")[index * 8 + 3].send_keys(num.to_s)
    #INR
    DRIVER.find_elements(:css, ".prize-fund-item")[index * 8 + 4].send_keys(num.to_s)
    #TRY
    DRIVER.find_elements(:css, ".prize-fund-item")[index * 8 + 5].send_keys(num.to_s)
    #UAH
    DRIVER.find_elements(:css, ".prize-fund-item")[index * 8 + 7].send_keys(num.to_s)
  end

#RUB
  %w[150000 90000 60000 36000 24000 18000 15000 12000 9000 6000].each_with_index do |num, index|
    DRIVER.find_elements(:css, ".prize-fund-item")[index * 8 + 6].send_keys(num.to_s)
  end

#LIMIT
  %w[70 65 60 55 50 45 40 35 30 25].each_with_index do |num, index|
    DRIVER.find_elements(:css, ".prize-leverage")[index].send_keys(num)
  end
end
