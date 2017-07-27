Given /^Select only tarrif CPA$/ do
  PartnersSmoke::Admin.authorize

  DRIVER.get CommonSetting[:url_adm_partner] + "/customers"
  wait_until(5, :css, "#dt_basic > thead > tr:nth-child(2) > th.sorting_asc")
  DRIVER.find_element(:css, '#dt_basic > thead > tr:nth-child(2) > th.sorting_asc').click
  sleep 1
  id = DRIVER.find_elements(:css, "td.sorting_1")[0].text
  DRIVER.get CommonSetting[:url_adm_partner] + "/customers/" + id.to_s + "/edit"

    DRIVER.find_elements(:css, 'input#customer_tariff_data__deposit_from')[0].clear
    DRIVER.find_elements(:css, 'input#customer_tariff_data__deposit_from')[0].send_keys('0')
    DRIVER.find_elements(:css, 'input#customer_tariff_data__deposit_from')[1].clear
    DRIVER.find_elements(:css, 'input#customer_tariff_data__deposit_from')[1].send_keys('200')
    DRIVER.find_elements(:css, 'input#customer_tariff_data__deposit_from')[2].clear
    DRIVER.find_elements(:css, 'input#customer_tariff_data__deposit_from')[2].send_keys('400')
    DRIVER.find_elements(:css, 'input#customer_tariff_data__deposit_from')[3].clear
    DRIVER.find_elements(:css, 'input#customer_tariff_data__deposit_from')[3].send_keys('600')
    DRIVER.find_elements(:css, 'input#customer_tariff_data__deposit_from')[4].clear
    DRIVER.find_elements(:css, 'input#customer_tariff_data__deposit_from')[4].send_keys('800')
    DRIVER.find_elements(:css, 'input#customer_tariff_data__deposit_from')[5].clear
    DRIVER.find_elements(:css, 'input#customer_tariff_data__deposit_from')[5].send_keys('1000')
    DRIVER.find_elements(:css, 'input#customer_tariff_data__deposit_from')[6].clear
    DRIVER.find_elements(:css, 'input#customer_tariff_data__deposit_from')[6].send_keys('1200')

    DRIVER.find_elements(:css, 'input#customer_tariff_data__deposit_to')[0].clear
    DRIVER.find_elements(:css, 'input#customer_tariff_data__deposit_to')[0].send_keys('100')
    DRIVER.find_elements(:css, 'input#customer_tariff_data__deposit_to')[1].clear
    DRIVER.find_elements(:css, 'input#customer_tariff_data__deposit_to')[1].send_keys('300')
    DRIVER.find_elements(:css, 'input#customer_tariff_data__deposit_to')[2].clear
    DRIVER.find_elements(:css, 'input#customer_tariff_data__deposit_to')[2].send_keys('500')
    DRIVER.find_elements(:css, 'input#customer_tariff_data__deposit_to')[3].clear
    DRIVER.find_elements(:css, 'input#customer_tariff_data__deposit_to')[3].send_keys('700')
    DRIVER.find_elements(:css, 'input#customer_tariff_data__deposit_to')[4].clear
    DRIVER.find_elements(:css, 'input#customer_tariff_data__deposit_to')[4].send_keys('900')
    DRIVER.find_elements(:css, 'input#customer_tariff_data__deposit_to')[5].clear
    DRIVER.find_elements(:css, 'input#customer_tariff_data__deposit_to')[5].send_keys('1100')
    DRIVER.find_elements(:css, 'input#customer_tariff_data__deposit_to')[6].clear
    DRIVER.find_elements(:css, 'input#customer_tariff_data__deposit_to')[6].send_keys('1300')

    DRIVER.find_elements(:css, 'input#customer_tariff_data__profit')[0].clear
    DRIVER.find_elements(:css, 'input#customer_tariff_data__profit')[0].send_keys('51')
    DRIVER.find_elements(:css, 'input#customer_tariff_data__profit')[1].clear
    DRIVER.find_elements(:css, 'input#customer_tariff_data__profit')[1].send_keys('101')
    DRIVER.find_elements(:css, 'input#customer_tariff_data__profit')[2].clear
    DRIVER.find_elements(:css, 'input#customer_tariff_data__profit')[2].send_keys('151')
    DRIVER.find_elements(:css, 'input#customer_tariff_data__profit')[3].clear
    DRIVER.find_elements(:css, 'input#customer_tariff_data__profit')[3].send_keys('201')
    DRIVER.find_elements(:css, 'input#customer_tariff_data__profit')[4].clear
    DRIVER.find_elements(:css, 'input#customer_tariff_data__profit')[4].send_keys('251')
    DRIVER.find_elements(:css, 'input#customer_tariff_data__profit')[5].clear
    DRIVER.find_elements(:css, 'input#customer_tariff_data__profit')[5].send_keys('300')
    DRIVER.find_elements(:css, 'input#customer_tariff_data__profit')[6].clear
    DRIVER.find_elements(:css, 'input#customer_tariff_data__profit')[6].send_keys('350')

    3.times do
      DRIVER.find_elements(:css, 'input#customer_tariff_active')[2].click ; sleep 0.5
      DRIVER.find_elements(:css, "button.btn.btn-primary")[7].click
    end
    sleep 1
end
