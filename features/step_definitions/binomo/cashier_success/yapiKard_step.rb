When(/^Visit cashier Tukish$/) do

end
When(/^Make (\d+) deposits YapiKard billing$/) do |count|
  print_result = -> {puts_danger "CardPay not working!!!" }
  retried_process(1, 1, print_result) do
    count.to_i.times do |i|
      DRIVER.get(CommonSetting[:app_host] + CommonSetting[:locale] + "/cashier")
      sleep 3
      DRIVER.find_element(:css, "li.unit-payment-system.turkish").click
      sleep 0.5
      DRIVER.execute_script("$('.form-control').val('#{ENV['count_cashier_dep']}').trigger('change').scope().vm.amount")
      sleep 0.5
      DRIVER.find_element(:css, ".custom-checkbox.custom-checkbox-lg").click if ENV["bonus_dep"].to_s == "true"
      sleep 0.5
      DRIVER.find_element(:css, "div.payment-wrapper.turkish > form > div.final-actions > div > div:nth-child(1) > div > input").click
      sleep
    end
  end
end
Then(/^Deposit YapiKard created$/) do
end


When(/^Make (\d+) deposits Garanti billing$/) do |arg1|
end
Then(/^Deposit Garanti created$/) do
end


When(/^success first ticket$/) do
end
When(/^success last ticket$/) do
end
Then(/^Check status two tickets$/) do
end
Then(/^Check two letter in email users$/) do
end
Then(/^Check one letter in email admin$/) do
end
