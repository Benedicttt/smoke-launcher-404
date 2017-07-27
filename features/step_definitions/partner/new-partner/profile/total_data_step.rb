
When /^Total information$/ do
  @ref_code_bonus = self.class.class_variable_defined?(:@@ref_code_bonus) ? @@ref_code_bonus : ""

  @@email_partner = DRIVER.find_element(:id, 'customer_email').attribute('value')
  @refcode = DRIVER.find_element(:id, 'customer_refcode').attribute('value')

  DRIVER.find_element(:id, "customer_skype").clear
  DRIVER.find_element(:id, "customer_skype").send_keys("Testing")

  DRIVER.find_element(:id, "customer_phone").clear
  DRIVER.find_element(:id, "customer_phone").send_keys("+79817657676")

  @nick = SecureRandom.hex(4)
  DRIVER.find_element(:id, "customer_nickname").clear
  DRIVER.find_element(:id, "customer_nickname").send_keys("Aff#{@nick}")
  DRIVER.find_elements(:css, '.btn-primary')[0].click

  DRIVER.execute_script("$('#new_customer > fieldset:nth-child(5) > div > div:nth-child(10) > label > input[name=\"customer[traffic_sources][other][active]\"]').click().trigger('change')")
  DRIVER.find_element(:id, "customer_traffic_sources_other_list").clear
  DRIVER.find_element(:id, "customer_traffic_sources_other_list").send_keys("#{CommonSetting[:url_adm_partner]}")

  @card = '%010d' % rand(10 ** 12)
  DRIVER.find_element(:id, "customer_wmz").send_keys("Z#{@card}")

  DRIVER.find_elements(:css, '.btn-primary')[1].click
  sleep 1



  DRIVER.find_element(:id, "customer_skype").clear
  DRIVER.find_element(:id, "customer_skype").send_keys("Testing2")
  @skype = DRIVER.find_element(:id, "customer_skype").attribute('value')

  DRIVER.find_element(:id, "customer_phone").clear
  DRIVER.find_element(:id, "customer_phone").send_keys("+79817657678")
  @phone = DRIVER.find_element(:id, "customer_phone").attribute('value')

  DRIVER.find_element(:id, "customer_nickname").clear
  DRIVER.find_element(:id, "customer_nickname").send_keys("Af#{@nick}")
  @nickname = DRIVER.find_element(:id, "customer_nickname").attribute('value')
  DRIVER.find_elements(:css, '.btn-primary')[0].click

  DRIVER.execute_script("$('#new_customer > fieldset:nth-child(5) > div > div:nth-child(10) > label > input[name=\"customer[traffic_sources][other][active]\"]').click().trigger('change')")
  DRIVER.find_element(:id, "customer_traffic_sources_other_list").clear
  DRIVER.find_element(:id, "customer_traffic_sources_other_list").send_keys("#{CommonSetting[:url_adm_partner]}")

  @card = '%010d' % rand(10 ** 12)
  DRIVER.find_element(:id, "customer_wmz").clear
  DRIVER.find_element(:id, "customer_wmz").send_keys("Z#{@card}")
  @card = DRIVER.find_element(:id, "customer_wmz").attribute('value')

  DRIVER.find_elements(:css, '.btn-primary')[1].click
  sleep 1
  DRIVER.execute_script("$('#customer_payment_type_wmz').click()")
  DRIVER.find_elements(:css, '.btn-primary')[1].click

  sleep 1
end
