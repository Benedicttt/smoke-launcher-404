When /^Visit cashier CreditCard$/ do

end

When /^Make deposit CreditCard$/ do
  print_result = -> {puts_danger "CreditCard not working!!!" }
  retried_process(2, 1, print_result) do
    ENV['count_cashier'].to_i.times do |i|
      DRIVER.get(CommonSetting[:app_host] + CommonSetting[:locale] + "/cashier")
      sleep 2
      DRIVER.find_element(:css, "li.card").click
      sleep 0.5
      DRIVER.execute_script("angular.element(document.querySelectorAll('.form-control'))[0].value = #{ENV['count_cashier_dep']}")
      DRIVER.execute_script("document.querySelectorAll('.form-control')[0].dispatchEvent(new Event('change'))")
      sleep 0.5
      DRIVER.execute_script("angular.element(document.querySelectorAll('.accept-bonus')[0].click())[0] = false") if ENV["bonus_dep"].to_s == "true"
      sleep 1
      DRIVER.find_element(:css, "div.payment-wrapper.card > form > div.final-actions > div > div:nth-child(1) > div > input").click

      wait_until(10, :id, "iframe")
      frame = DRIVER.find_element(:id, 'iframe')
      DRIVER.switch_to.frame frame
      wait_until(5, :id, "card_number")
        12.times{ DRIVER.find_element(:id, "card_number").send_keys("5")}
        4.times{ DRIVER.find_element(:id, "card_number").send_keys("4")}
        DRIVER.find_element(:id, "month").send_keys("12");
        DRIVER.find_element(:id, "year").send_keys("21");
        DRIVER.find_element(:id, "cardholder").send_keys("TESTING");
        DRIVER.find_element(:id, "cvv").send_keys("123");
        DRIVER.find_element(:css, "input[type=submit]").click;
        sleep 2

        id = User.where(stage_number: ENV['stage']).last.id
        que "update users set ecommpay = '#{i + 1}', updated_at = '#{Time.now}' where id = '#{id}';"
    end
  end
end

Then /^Deposit CreditCard created$/ do
  puts_success("Dep: " + "#{ENV['count_cashier_dep']}" + " #{ENV['cur']}")
end
