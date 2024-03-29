Given(/^Template Bonus Deposit$/) do
  DRIVER.get CommonSetting[:url_page_crm] + "/coupons/patterns/new?handler=bonus&scope=individual"

  sleep 1
  list_currency = []

  DRIVER.find_elements(:css, 'strong').each do |text|
    list_currency << text.text
  end

  DRIVER.get CommonSetting[:url_page_crm] + "/coupons/patterns/new?handler=bonus_deposit&scope=individual"
  DRIVER.find_element(:id, "coupon_name").clear
  DRIVER.find_element(:id, "coupon_name").send_keys("#{Time.now}")

  DRIVER.find_element(:id, "coupon_lifetime").clear
  DRIVER.find_element(:id, "coupon_lifetime").send_keys('1')

  DRIVER.find_element(:id, "coupon_activations").clear
  DRIVER.find_element(:id, "coupon_activations").send_keys('1')

  DRIVER.find_elements(:css, "button.btn.dropdown-toggle.selectpicker.btn-default")[0].click
  DRIVER.find_elements(:css, "span.text")[0].click

  count = list_currency.size - 1
  (0..count).each do |i|
    begin
      DRIVER.find_elements(:id, "amount")[i].clear
      DRIVER.find_elements(:id, "bonus")[i].clear
      DRIVER.find_elements(:id, "leverage")[i].clear

      DRIVER.find_elements(:id, "amount")[i].send_keys("10")
      DRIVER.find_elements(:id, "bonus")[i].send_keys("10")
      DRIVER.find_elements(:id, "leverage")[i].send_keys("10")
      sleep 0.2
      DRIVER.find_elements(:css, '.btn-success')[i].click
    rescue
    end
  end

  DRIVER.find_elements(:css, '.btn-primary')[1].click
  sleep 1

  $id_bonus_deposit = URI(DRIVER.current_url).path.gsub(/\/coupons\/patterns\//, '').gsub(/\/edit/, '')

  DRIVER.find_element(:id, "coupon_name").clear
  DRIVER.find_element(:id, "coupon_name").send_keys("#{$id_bonus_deposit}")
  DRIVER.find_elements(:css, '.btn-primary')[1].click
  sleep 1
end
