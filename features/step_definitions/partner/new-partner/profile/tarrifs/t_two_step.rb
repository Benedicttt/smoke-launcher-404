Given /^Select only tarrif CPA$/ do
  PartnersSmoke::Admin.authorize

  DRIVER.get CommonSetting[:url_adm_partner] + "/customers"
  wait_until(5, :css, "#dt_basic > thead > tr:nth-child(2) > th.sorting_asc")
  DRIVER.find_element(:css, '#dt_basic > thead > tr:nth-child(2) > th.sorting_asc').click
  sleep 1
  id = DRIVER.find_elements(:css, "td.sorting_1")[0].text

  DRIVER.get CommonSetting[:url_adm_partner] + "/customers/" + id.to_s + "/edit"
    sleep 1

    %w[ 0 200 400 600 800 1000 1200 ].each_with_index do |data, num|
      DRIVER.find_elements(:css, "input#customer_tariff_data_attributes_#{num}_deposit_from")[0].clear
      DRIVER.find_elements(:css, "input#customer_tariff_data_attributes_#{num}_deposit_from")[0].send_keys(data)
    end

    %w[ 50 300 500 700 900 1100 1300 ].each_with_index do |data, num|
      DRIVER.find_elements(:css, "input#customer_tariff_data_attributes_#{num}_deposit_to")[0].clear
      DRIVER.find_elements(:css, "input#customer_tariff_data_attributes_#{num}_deposit_to")[0].send_keys(data)
    end

    %w[ 50 100 150 200 250 300 350 ].each_with_index do |data, num|
      DRIVER.find_elements(:css, "input#customer_tariff_data_attributes_#{num}_profit")[0].clear
      DRIVER.find_elements(:css, "input#customer_tariff_data_attributes_#{num}_profit")[0].send_keys(data)
    end

    3.times do
      DRIVER.find_elements(:css, 'input#customer_tariff_active')[2].click ; sleep 0.5
      DRIVER.find_elements(:css, "button.btn.btn-primary")[7].click
    end
    sleep 1
end
