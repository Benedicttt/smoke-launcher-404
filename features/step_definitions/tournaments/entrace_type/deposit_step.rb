When /^Select type tournament deposit$/ do
 DRIVER.execute_script("$(\"span:contains('deposit')\").click()")
 DRIVER.find_element(:id, 'tournament_configuration_deposits_amount_USD').send_keys('100')
 DRIVER.find_element(:id, 'tournament_configuration_deposits_amount_EUR').send_keys('109')
 DRIVER.find_element(:id, 'tournament_configuration_deposits_amount_RUB').send_keys('5000')
end
