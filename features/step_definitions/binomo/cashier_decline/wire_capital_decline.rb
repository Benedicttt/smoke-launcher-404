When /^Make deposit WireCapital decline$/ do
  print_result = -> {puts_danger "Wire Capital not working!!!" }
  retried_process(1, 1) do
   ENV['count_cashier'].to_i.times do |i|
     DRIVER.get(CommonSetting[:app_host] + CommonSetting[:locale] + "/cashier")
     sleep 3

     DRIVER.find_element(:css, "li.card").click
     sleep 3
     
     begin
       DRIVER.execute_script("document.querySelector('input[name=useNew]').click()")
     rescue
       puts_danger "Not found checkbox \"NEW\""
     end
     sleep 3

     sleep 0.5
     DRIVER.execute_script("angular.element(document.querySelectorAll('.form-control'))[0].value = #{ENV['count_cashier_dep']}")
     sleep 0.5
     DRIVER.execute_script("angular.element(document.querySelectorAll('.accept-bonus')[0].click())[0] = false") if ENV["bonus_dep"].to_s == "true"
     sleep 1

     DRIVER.find_element(:css, "div.payment-wrapper.card > form > div.final-actions > div > div:nth-child(1) > div > input").click

     wait_until(15, :id, "iframe")
     frame = DRIVER.find_element(:id, 'iframe')
     DRIVER.switch_to.frame frame

     wait_until(5, :id, "cardNumber")
       DRIVER.find_element(:id, "cardNumber").send_keys("4223450000000018")
       DRIVER.find_element(:id, "cardHolderName").send_keys("TESTING")
       DRIVER.find_element(:id, "cvvNumber").send_keys("123")

       selector_month = DRIVER.find_element(:id, "expirationDate")
       selector_year = DRIVER.find_element(:id, "year")

       selector_month.find_elements( :tag_name => "option" ).each do |option|
         option.click if option.text == "07 (Jul)"
       end

       selector_year.find_elements( :tag_name => "option" ).each do |option|
         option.click if option.text == "2030"
       end
       DRIVER.find_element(:css, '.btn.paymentBtn').click
     end
   end
end

When /^Check status 'Reject' in payment Wire Capital$/ do
  DRIVER.get(CommonSetting[:url_page_crm])
  sleep 3

  if DRIVER.current_url === CommonSetting[:url_page_crm] + "login"
    retried_process(3, 3) do
      DRIVER.find_element(:id, "email").send_keys(CommonSetting[:user_crm]['login'])
      DRIVER.find_element(:id, "password").send_keys(CommonSetting[:user_crm]['password'])
      DRIVER.find_element(:css, 'input[value="Sign in"]').click
    end
  end

  id = User.where(stage_number: ENV['stage']).last.id
  DRIVER.get(CommonSetting[:url_user_crm] + "/#{id}" + "/orders")
  sleep 2
    puts_success "WireCapital status = #{DRIVER.find_element(:xpath, "//td[text()='WireCapital']/..//span[@class='label label-warning' and text() = 'Rejected']").text}"
end
