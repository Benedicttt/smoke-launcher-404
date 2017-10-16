When /^Select type tournament deposit$/ do
 DRIVER.execute_script("$(\"span:contains('activate')\").click()")
 DRIVER.find_element(:id, 'tournament_configuration_deposits_amount_USD').send_keys('100')
 DRIVER.find_element(:id, 'tournament_configuration_deposits_amount_EUR').send_keys('100')
 DRIVER.find_element(:id, 'tournament_configuration_deposits_amount_RUB').send_keys('1000')
 DRIVER.find_element(:id, 'tournament_configuration_deposits_amount_CNY').send_keys('2000')
 DRIVER.find_element(:id, 'tournament_configuration_deposits_amount_TRY').send_keys('2000')
 DRIVER.find_element(:id, 'tournament_configuration_deposits_amount_UAH').send_keys('3000')
 DRIVER.find_element(:id, 'tournament_configuration_deposits_amount_INR').send_keys('3000')
 DRIVER.find_element(:id, 'tournament_configuration_deposits_amount_ZAR').send_keys('3000')
end
