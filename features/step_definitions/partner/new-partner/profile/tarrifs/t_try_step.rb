
Given /^Select only tarrif CPA \%$/ do
    PartnersSmoke::Admin.authorize

    DRIVER.get CommonSetting[:url_adm_partner] + "/customers"
    wait_until(5, :css, "#dt_basic > thead > tr:nth-child(2) > th.sorting_asc")
    DRIVER.find_element(:css, '#dt_basic > thead > tr:nth-child(2) > th.sorting_asc').click
    sleep 1
    id = DRIVER.find_elements(:css, "td.sorting_1")[0].text
    DRIVER.get CommonSetting[:url_adm_partner] + "/customers/" + id.to_s + "/edit"
    #
    DRIVER.find_elements(:css, "input#customer_tariff_data__deposit_from")[7].clear
    DRIVER.find_elements(:css, "input#customer_tariff_data__deposit_from")[7].send_keys('0')
    DRIVER.find_elements(:css, "input#customer_tariff_data__deposit_from")[8].clear
    DRIVER.find_elements(:css, "input#customer_tariff_data__deposit_from")[8].send_keys('101')
    DRIVER.find_elements(:css, "input#customer_tariff_data__deposit_from")[9].clear
    DRIVER.find_elements(:css, "input#customer_tariff_data__deposit_from")[9].send_keys('151')
    DRIVER.find_elements(:css, "input#customer_tariff_data__deposit_from")[10].clear
    DRIVER.find_elements(:css, "input#customer_tariff_data__deposit_from")[10].send_keys('201')
    DRIVER.find_elements(:css, "input#customer_tariff_data__deposit_from")[11].clear
    DRIVER.find_elements(:css, "input#customer_tariff_data__deposit_from")[11].send_keys('251')
    DRIVER.find_elements(:css, "input#customer_tariff_data__deposit_from")[12].clear
    DRIVER.find_elements(:css, "input#customer_tariff_data__deposit_from")[12].send_keys('300')
    DRIVER.find_elements(:css, "input#customer_tariff_data__deposit_from")[13].clear
    DRIVER.find_elements(:css, "input#customer_tariff_data__deposit_from")[13].send_keys('350')

    DRIVER.find_elements(:css, "input#customer_tariff_data__deposit_to")[7].clear
    DRIVER.find_elements(:css, "input#customer_tariff_data__deposit_to")[7].send_keys('100')
    DRIVER.find_elements(:css, "input#customer_tariff_data__deposit_to")[8].clear
    DRIVER.find_elements(:css, "input#customer_tariff_data__deposit_to")[8].send_keys('150')
    DRIVER.find_elements(:css, "input#customer_tariff_data__deposit_to")[9].clear
    DRIVER.find_elements(:css, "input#customer_tariff_data__deposit_to")[9].send_keys('200')
    DRIVER.find_elements(:css, "input#customer_tariff_data__deposit_to")[10].clear
    DRIVER.find_elements(:css, "input#customer_tariff_data__deposit_to")[10].send_keys('250')
    DRIVER.find_elements(:css, "input#customer_tariff_data__deposit_to")[11].clear
    DRIVER.find_elements(:css, "input#customer_tariff_data__deposit_to")[11].send_keys('300')
    DRIVER.find_elements(:css, "input#customer_tariff_data__deposit_to")[12].clear
    DRIVER.find_elements(:css, "input#customer_tariff_data__deposit_to")[12].send_keys('350')
    DRIVER.find_elements(:css, "input#customer_tariff_data__deposit_to")[13].clear
    DRIVER.find_elements(:css, "input#customer_tariff_data__deposit_to")[13].send_keys('1300')

    DRIVER.find_elements(:css, "input#customer_tariff_data__rate")[0].clear
    DRIVER.find_elements(:css, "input#customer_tariff_data__rate")[0].send_keys('1')
    DRIVER.find_elements(:css, "input#customer_tariff_data__rate")[1].clear
    DRIVER.find_elements(:css, "input#customer_tariff_data__rate")[1].send_keys('5')
    DRIVER.find_elements(:css, "input#customer_tariff_data__rate")[2].clear
    DRIVER.find_elements(:css, "input#customer_tariff_data__rate")[2].send_keys('10')
    DRIVER.find_elements(:css, "input#customer_tariff_data__rate")[3].clear
    DRIVER.find_elements(:css, "input#customer_tariff_data__rate")[3].send_keys('15')
    DRIVER.find_elements(:css, "input#customer_tariff_data__rate")[4].clear
    DRIVER.find_elements(:css, "input#customer_tariff_data__rate")[4].send_keys('20')
    DRIVER.find_elements(:css, "input#customer_tariff_data__rate")[5].clear
    DRIVER.find_elements(:css, "input#customer_tariff_data__rate")[5].send_keys('30')
    DRIVER.find_elements(:css, "input#customer_tariff_data__rate")[6].clear
    DRIVER.find_elements(:css, "input#customer_tariff_data__rate")[6].send_keys('40')

    3.times do
      DRIVER.find_elements(:id, 'customer_tariff_active')[3].click ; sleep 0.5
      DRIVER.find_elements(:css, "button.btn.btn-primary")[8].click
    end
    sleep 1
end
