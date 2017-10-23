When /^Visit cashier CardPay$/ do
end

When /^Make deposit CardPay$/ do
  print_result = -> {puts_danger "CardPay not working!!!" }
  # retried_process(2, 2, print_result) do
    ENV['count_cashier'].to_i.times do |i|
      DRIVER.get(CommonSetting[:app_host] + CommonSetting[:locale] + "/cashier")
      sleep 5
      DRIVER.find_element(:css, "li.unit-payment-system.card").click
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
        wait_until(5, :id, "card-number")
         DRIVER.find_element(:id, "card-number").send_keys("4000 0000 0000 0002")
         DRIVER.find_element(:id, "card-holder").send_keys("Testing")
         DRIVER.find_element(:id, "cvc").send_keys("123")

         DRIVER.find_element(:id, "exp-month").click
         DRIVER.find_element(:css, "#exp-month > option:nth-child(7)").click
         DRIVER.find_element(:id, "exp-year").click
         DRIVER.find_element(:css, "#exp-year > option:nth-child(15)").click
         sleep 1
         DRIVER.find_element(:id, "btn-submit").click
         wait_until(8, :id, "success")
         DRIVER.find_element(:id, "success").click
         wait_until(8, :id, "formSubmit")

         id = User.where(stage_number: ENV['stage']).last.id
         que "update users set card_pay = '#{i + 1}', updated_at = '#{Time.now}' where id = '#{id}';"
         DRIVER.find_element(:id, "formSubmit").click
         sleep 4
         close_active_window
    end
  # end
end

Then /^Deposit CardPay created$/ do
  puts_success("Dep: " + "#{ENV['count_cashier_dep']}" + " #{ENV['cur']}")
end
