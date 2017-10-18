When /^Visit cashier WireCapital$/ do

end

When /^Make deposit WireCapital$/ do
  print_result = -> { puts_danger "Wire Capital not working!!!" }
  retried_process(1, 1) do
   ENV['count_cashier'].to_i.times do |i|

     DRIVER.get(CommonSetting[:app_host] + CommonSetting[:locale] + "/cashier")
     sleep 3
     DRIVER.find_element(:css, "li.unit-payment-system.card").click
     sleep 0.5

     DRIVER.execute_script("angular.element(document.querySelector(\".checkbox.checkbox-secondary\").click())") if ENV["bonus_dep"].to_s == "true"

     DRIVER.execute_script("angular.element(document.querySelectorAll('.form-control'))[0].value = #{ENV['count_cashier_dep']}")
     sleep 1
     DRIVER.execute_script("document.querySelectorAll('.form-control')[0].dispatchEvent(new Event('change'))")

    #  sleep 1
    #  DRIVER.execute_script("angular.element(document.querySelectorAll('.accept-bonus')[0].click())[0] = false") if ENV["bonus_dep"].to_s == "true"
     sleep 1
     DRIVER.find_element(:css, "div.payment-wrapper.card > form > div.final-actions > div > div:nth-child(1) > div > input").click

     wait_until(15, :id, "iframe")
     frame = DRIVER.find_element(:id, 'iframe')

     DRIVER.switch_to.frame frame
     wait_until(5, :id, "cardNumber")
       DRIVER.find_element(:id, "cardNumber").send_keys("4223450000000026")
       DRIVER.find_element(:id, "cardHolderName").send_keys("TESTING")
       DRIVER.find_element(:id, "cvvNumber").send_keys("123")

       selector_year = DRIVER.find_element(:id, "expirationDate")
       selector_year.find_elements( :tag_name => "option" ).each do |option|
         option.click if option.text == "06 (Jun)"
       end

      selector_year = DRIVER.find_element(:id, "year")
      selector_year.find_elements( :tag_name => "option" ).each do |option|
        option.click if option.text == "2030"
      end

       DRIVER.find_element(:css, '.btn.paymentBtn').click
       sleep 2
       begin
         wait_until(10, :id, "password")
         DRIVER.find_element(:id, "password").send_keys("123456")
         DRIVER.find_element(:class_name, "button-submit").click
         sleep 2
       rescue
         puts_info "Not need input pass 3D-S"
       end

     id = User.where(stage_number: ENV['stage']).last.id
     que "update users set wire_capital = '#{i + 1}', updated_at = '#{Time.now}' where id = '#{id}';"

   end
  end
  puts_success("Dep: " + "#{ENV['count_cashier_dep']}" + " #{ENV['cur']}")
end

Then /^Deposit WireCapital created$/ do
end
