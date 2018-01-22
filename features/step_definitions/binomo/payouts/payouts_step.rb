Given /^Visit payouts$/ do
end

Then /^Applications created (.*?)$/ do |pay|
end

class Payouts
  def include(type, number_small, number_full)
    driver = Driver::Set.session(type)
    driver.get(CommonSetting[:app_host] + "/en/payouts")
    driver.manage.timeouts.implicit_wait = 30

    sleep 1
    add_cookies_to_page(driver)
    driver.manage.delete_cookie("agreed");

    driver.get(CommonSetting[:app_host] + "/en/payouts")
    sleep 1
    driver.manage.window.resize_to(1600, 700)
    sleep 2

    ENV['count_payouts'].to_i.times do |i|
      sleep 2
      driver.find_element(:css, "i.caret").click
      sleep 2

      begin
        (0..2).map do |elem|
          purse = driver.find_elements(:css, '.ui-select-option > .unit')[elem]
          purse.click if purse.text == number_small
        end

      rescue
        puts_danger "No find type card #{number_full}" if i == 0
        driver.quit
      end


      begin
        if i == 0 
          sleep 1
          ENV['count_payouts_sum'].to_i.times { driver.find_elements(:css, 'button.btn-control.btn-control-sm')[0].click }
          sleep 0.7
          driver.find_element(:css, 'input[name="purse.card_holder"]').send_keys("Test IVANOV")
          driver.find_element(:css, 'input[name="purse.card_expire"]').send_keys("06/30") if type != :bank_card
          driver.find_element(:css, 'input[name="purse.card_number"]').send_keys("#{number_full}") if type != :bank_card
          sleep 1
          driver.find_element(:css, '.btn-lg.btn-primary').click
          sleep 1
          driver.get(CommonSetting[:app_host] + CommonSetting[:locale] + "/payouts")
          sleep 2
        end

          driver.find_element(:css, 'input[name=amount]').clear
          sleep 0.7
          driver.find_element(:css, 'input[name=amount]').send_keys(ENV['count_payouts_sum'])
          sleep 1
          driver.find_element(:css, '.btn-lg.btn-primary').click
          sleep 0.7
      rescue
        puts_danger "No find card #{number_small}"
        driver.quit
      end

    end

    # driver.quit
    puts_info " Created: #{ENV['count_payouts'].to_s} ticket(s) CreditCard"
  end
end
