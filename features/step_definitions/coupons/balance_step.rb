Given /^Testing balance$/ do
  id = User.where(stage_number: ENV['stage']).last.id
  sleep 2
  DRIVER.get(CommonSetting[:url_user_crm] + "/#{id}" + "/balance")
  sleep 1
  balance_amount = "100"
  balance_comment = "Testing bonuses"

  DRIVER.find_element(:id, "user_amount").clear
  DRIVER.find_element(:id, "user_amount").send_keys(balance_amount)
  DRIVER.find_element(:id, "user_comment").send_keys(balance_comment)

  sleep 0.5
  DRIVER.find_elements(:css, "input.btn")[0].click

  sleep 3
  id =  "ID: #{DRIVER.find_element(:css, '#main-content > div > div:nth-child(5) > table > tbody > tr:nth-child(1) > td:nth-child(1)').text}"
  action =  "Action: #{DRIVER.find_element(:css, '#main-content > div > div:nth-child(5) > table > tbody > tr:nth-child(1) > td:nth-child(2)').text}"
  sum =  "Count sum: #{DRIVER.find_element(:css, '#main-content > div > div:nth-child(5) > table > tbody > tr:nth-child(1) > td:nth-child(3)').text}"
  balance =  "Balanse: #{DRIVER.find_element(:css, '#main-content > div > div:nth-child(5) > table > tbody > tr:nth-child(1) > td:nth-child(3)').text}"
  puts_warning "#{link_report_id(DRIVER.current_url.to_s, DRIVER.current_url.to_s)} #{id} #{action} #{sum} #{balance}"
end
