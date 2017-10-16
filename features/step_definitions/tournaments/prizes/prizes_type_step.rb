Given /^Fixed$/ do
  DRIVER.execute_script("$(\"span:contains('Fixed')\").click()")
  # usd eur kzt cny inr try rub uah
  %w[7000 7000 8850000 7000 7000 7000 420000 7000].each_with_index do |value, index|
    DRIVER.find_element(:id, "tournament_prize_fund_attributes_#{index}_value").send_keys(value)
  end
end

Given /^Percentage$/ do
  DRIVER.execute_script("$(\"span:contains('Percentage')\").click()")
  #index usd eur kzt cny inr try rub uah
  %w[7000 7000 8850000 7000 7000 7000 420000 7000].each_with_index do |value, index|
    DRIVER.find_element(:id, "tournament_prize_fund_attributes_#{index}_value").send_keys(value)
  end
end
