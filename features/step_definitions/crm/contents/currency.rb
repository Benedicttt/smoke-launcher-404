Given /^Set USD currency defaults params$/ do
  authorization_by_crm(DRIVER)
  DRIVER.get CommonSetting[:url_page_crm] + "/currencies"
  sleep 1
  DRIVER.find_element(:xpath, "//*[@class='success']//td[text() = 'USD']//../td[14]/a").click
  sleep 1
  DRIVER.execute_script("$('#currency_active').prop('checked', true)")
  DRIVER.find_element(:id, "currency_unit").clear
  DRIVER.find_element(:id, "currency_unit").send_keys("$")
  DRIVER.find_element(:id, "currency_min_deal").clear
  DRIVER.find_element(:id, "currency_min_deal").send_keys("1")
  DRIVER.find_element(:id, "currency_max_deal").clear
  DRIVER.find_element(:id, "currency_max_deal").send_keys("1000")
  DRIVER.find_element(:id, "currency_demo_balance").clear
  DRIVER.find_element(:id, "currency_demo_balance").send_keys("1000")
  DRIVER.find_element(:id, "currency_before_deposit_limit").clear
  DRIVER.find_element(:id, "currency_before_deposit_limit").send_keys("50")
  DRIVER.find_element(:id, "currency_pricing_vip").clear
  DRIVER.find_element(:id, "currency_pricing_vip").send_keys("1000")
  DRIVER.find_element(:id, "currency_pricing_gold").clear
  DRIVER.find_element(:id, "currency_pricing_gold").send_keys("500")
  DRIVER.find_element(:id, "currency_pricing_standard").clear
  DRIVER.find_element(:id, "currency_pricing_standard").send_keys("10")
  DRIVER.find_element(:id, "currency_cfd_min_deal").clear
  DRIVER.find_element(:id, "currency_cfd_min_deal").send_keys("1")
  DRIVER.find_element(:id, "currency_cfd_max_deal").clear
  DRIVER.find_element(:id, "currency_cfd_max_deal").send_keys("1000")

  add_deal_cfd = DRIVER.find_elements(:css, ".add-deal-sum")[2]
  add_deal_widget = DRIVER.find_elements(:css, ".add-deal-sum")[1]
  add_deal_deal = DRIVER.find_elements(:css, ".add-deal-sum")[0]

  7.times do
    add_deal_deal.click
    add_deal_cfd.click
    add_deal_widget.click
  end

  %w[5 10 50 500 1000].each_with_index do |sum, num|
    DRIVER.find_elements(:css, "input[name='currency[cfd_deal_sums][]']")[num].clear
    sleep 0.2
    DRIVER.find_elements(:css, "input[name='currency[cfd_deal_sums][]']")[num].send_keys("#{sum}")
  end

  %w[1 10 20 50 100 200 1000].each_with_index do |sum, num|
      DRIVER.find_elements(:css, "input[name='currency[deal_sums][]']")[num].clear
      sleep 0.2
      DRIVER.find_elements(:css, "input[name='currency[deal_sums][]']")[num].send_keys("#{sum}")
  end

  %w[100 200 1000].each_with_index do |sum, num|
      DRIVER.find_elements(:css, "input[name='currency[dummy_deal_sums][]']")[num].clear
      sleep 0.2
      DRIVER.find_elements(:css, "input[name='currency[dummy_deal_sums][]']")[num].send_keys("#{sum}")
  end

  14.times do |num|
    begin
      DRIVER.find_element(:xpath, "//input[@value='0']//../a").click
    rescue
    end
  end

  DRIVER.find_elements(:css, ".btn-success")[0].click
  sleep 1
end
