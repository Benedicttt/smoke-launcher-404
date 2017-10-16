
Given /^Select only tarrif CPA \%$/ do
    PartnersSmoke::Admin.authorize

    DRIVER.get CommonSetting[:url_adm_partner] + "/customers"
    wait_until(5, :css, "#dt_basic > thead > tr:nth-child(2) > th.sorting_asc")
    DRIVER.find_element(:css, '#dt_basic > thead > tr:nth-child(2) > th.sorting_asc').click
    sleep 1
    id = DRIVER.find_elements(:css, "td.sorting_1")[0].text
    DRIVER.get CommonSetting[:url_adm_partner] + "/customers/" + id.to_s + "/edit"

    %w[ 0 50 100 150 200 250 300 ].each_with_index do |from, num|
      DRIVER.find_elements(:css, "input#customer_tariff_data_attributes_#{num}_deposit_from")[1].clear
      DRIVER.find_elements(:css, "input#customer_tariff_data_attributes_#{num}_deposit_from")[1].send_keys(from)
    end

    %w[ 50 100 150 200 250 300 350 ].each_with_index do |to, num|
      DRIVER.find_elements(:css, "input#customer_tariff_data_attributes_#{num}_deposit_to")[1].clear
      DRIVER.find_elements(:css, "input#customer_tariff_data_attributes_#{num}_deposit_to")[1].send_keys(to)
    end

    %w[ 5 10 15 20 30 40 50 ].each_with_index do |rate, num|
      DRIVER.find_elements(:css, "input#customer_tariff_data_attributes_#{num}_rate")[0].clear
      DRIVER.find_elements(:css, "input#customer_tariff_data_attributes_#{num}_rate")[0].send_keys(rate)
    end

    3.times do
      DRIVER.find_elements(:id, 'customer_tariff_active')[3].click ; sleep 0.5
      DRIVER.find_elements(:css, "button.btn.btn-primary")[8].click
    end
    sleep 1
end
