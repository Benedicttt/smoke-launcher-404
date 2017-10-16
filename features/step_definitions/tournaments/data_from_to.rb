Given /^Data from$/ do
  DRIVER.find_element(:id, 'tournament_date_from').clear
  sleep 0.5
  DRIVER.find_element(:id, 'tournament_date_from').send_keys(ENV['data_from'])
end

Given /^Data to$/ do
  DRIVER.find_element(:id, 'tournament_date_to').clear
  sleep 0.5
  DRIVER.find_element(:id, 'tournament_date_to').send_keys(ENV['data_to'])
end
