When /^Created Tournament 'max demo balance'$/ do
  DRIVER.execute_script("$(\"span:contains('max_demo_balance')\").click()")
  DRIVER.find_element(:id, 'tournament_configuration_deposits_amount_USD').clear
  DRIVER.find_element(:id, 'tournament_configuration_deposits_amount_EUR').clear
  DRIVER.find_element(:id, 'tournament_configuration_deposits_amount_RUB').clear
  DRIVER.find_element(:id, 'tournament_configuration_deposits_amount_CNY').clear
  DRIVER.find_element(:id, 'tournament_configuration_deposits_amount_TRY').clear
  DRIVER.find_element(:id, 'tournament_configuration_deposits_amount_INR').clear
  DRIVER.find_element(:id, 'tournament_configuration_deposits_amount_UAH').clear
end
