## countries
Given /^Set country RU curency USD, EUR, RUB \- default RUB$/ do
  authorization_by_crm(DRIVER)
  DRIVER.get CommonSetting[:url_page_crm] + "/countries/177/edit"
  sleep 1

  %i[USD EUR RUB].each do |i|
    DRIVER.execute_script("$('#country_available_currencies_#{i.downcase}').prop('checked', true)")
  end
  DRIVER.execute_script("$('#country_default_currency_rub').prop('checked', true)")
  sleep 1
  DRIVER.find_elements(:css, ".btn-primary")[0].click
end

## common
Given /^Set sales manage all$/ do
  authorization_by_crm(DRIVER)
  DRIVER.get CommonSetting[:url_page_crm] + "/settings"
  sleep 1
  DRIVER.find_element(:id, "settings_n_user").click
  DRIVER.find_elements(:css, ".btn-primary")[0].click
end

Given /^Set Assets: break: true, dynamic: \-(\d+), win rate: (\d+)$/ do |arg1, arg2|
  DRIVER.execute_script("$('#settings_break_enabled').prop('checked', true)")
  DRIVER.find_element(:id, "settings_break_dynamic").clear
  DRIVER.find_element(:id, "settings_break_win_rate").clear
  DRIVER.find_element(:id, "settings_break_dynamic").send_keys(arg1)
  DRIVER.find_element(:id, "settings_break_win_rate").send_keys(arg2)
end

Given /^Set SMTP server default$/ do
  DRIVER.execute_script("$(\"span.text:contains('default')\")[0].click()")
end

Given /^Set Mail provider SendGrid$/ do
  DRIVER.execute_script("$(\"span.text:contains('send_grid')\")[0].click()")
end

Given /^Set Captcha sign_in false$/ do
  DRIVER.execute_script("$('#settings_sign_in_captcha_enabled').prop('checked', false)")
end

Given /^Set Captcha sign_up false$/ do
  DRIVER.execute_script("$('#settings_sign_up_captcha_enabled').prop('checked', false)")
end

Given /^Set Tutorial false$/ do
  DRIVER.execute_script("$('#settings_tutorial_enabled').prop('checked', false)")
end

Given /^CFD enabled true$/ do
  DRIVER.execute_script("$('#settings_cfd_enabled').prop('checked', true)")
end

Given /^Set max demo deals at once (\d+)$/ do |arg1|
  DRIVER.get CommonSetting[:url_page_crm] + "/settings"
  DRIVER.find_element(:id, "settings_max_demo_deals_at_once").clear
  DRIVER.find_element(:id, "settings_max_demo_deals_at_once").send_keys(arg1)
  sleep 1
  DRIVER.find_elements(:css, ".btn-primary")[0].click
end

Given /^Set Server webinar time$/ do
  authorization_by_crm(DRIVER)
  DRIVER.get CommonSetting[:url_page_crm] + "/settings"
  date_now = Time.now
  date_to = Time.now.strftime("#{date_now.day + 1}.%m.%Y %H:%M:%S")
  DRIVER.find_element(:id, "settings_webinar_time").send_keys(date_to)
end

Given /^Set URL webinar$/ do
  DRIVER.find_element(:id, "settings_webinar_url").send_keys("https://youtu.be/jNMJQ5RqMQ8")
  sleep 1
  DRIVER.find_elements(:css, ".btn-primary")[0].click
end

Given /^Set daily asset ric GOL\/OTC, percents (\d+)$/ do |arg1|
  authorization_by_crm(DRIVER)
  DRIVER.get CommonSetting[:url_page_crm] + "/daily_assets"
  (0..6).each do |i|
    DRIVER.execute_script("$('#daily_assets_#{i}_random').prop('checked', true)")
    DRIVER.find_element(:id, "daily_assets_#{i}_percent").clear
    DRIVER.find_element(:id, "daily_assets_#{i}_percent").send_keys(arg1)
  end
  sleep 1
  DRIVER.find_elements(:css, ".btn-primary")[0].click
end

Given /^Update one user admin$/ do
  authorization_by_crm(DRIVER)
  DRIVER.get CommonSetting[:url_page_crm] + "/admin_users"
  sleep 1
  DRIVER.find_element(:css, "#tab-content-active > table > tbody > tr:nth-child(2) > td:nth-child(1) > a").click
  sleep 1
  DRIVER.find_elements(:css, ".btn-primary")[0].click
  sleep 1
  DRIVER.find_elements(:css, ".btn-primary")[0].click
end

Given /^Create one preset$/ do
  authorization_by_crm(DRIVER)
  DRIVER.get CommonSetting[:url_page_crm] + "/presets/new"
  sleep 5
  refcode = Partner.last.refcode

  DRIVER.find_element(:id, "preset_title").send_keys(SecureRandom.hex(4).to_s)
  DRIVER.find_element(:id, "preset_refcodes").send_keys(refcode.to_s)
  DRIVER.find_elements(:css, ".btn-primary")[0].click
  sleep 1
  DRIVER.find_element(:xpath, "//*[@id='main-content']/div/table/tbody/tr[2]/td[1]") == refcode.to_s
end

Given /^Set percet rate and time$/ do
  # authorization_by_crm(DRIVER)
  # DRIVER.get CommonSetting[:url_page_crm] + "/stock_assets"
  # sleep 1
  # DRIVER.find_element(:id, "assets_reduce_rates_time_from").send_keys("11:00")
  # DRIVER.find_element(:id, "assets_reduce_rates_time_to").send_keys("11:15")
  # DRIVER.find_element(:id, "assets_reduce_rates_value").clear
  # DRIVER.find_element(:id, "assets_reduce_rates_value").send_keys("15")
  #
  # DRIVER.find_elements(:css, ".btn-small")[0].click
end


#######
Given /^Set ric GOL\/OTC all defaults params$/ do
  authorization_by_crm(DRIVER)
  DRIVER.get CommonSetting[:url_page_crm] + "/stock_assets"
  sleep 1
  DRIVER.find_element(:xpath, '//*[@class="sortable-row"]//td[text() = "FOR/HEIGHT"]//../td[10]').click
  sleep 1
  DRIVER.find_element(:id, "asset_name").clear
  DRIVER.find_element(:id, "asset_name").send_keys("FOR/HEIGHT")
  DRIVER.find_element(:id, "asset_payment_rate_turbo").clear
  DRIVER.find_element(:id, "asset_payment_rate_turbo").send_keys("83")
  DRIVER.find_element(:id, "asset_payment_rate_binary").clear
  DRIVER.find_element(:id, "asset_payment_rate_binary").send_keys("84")
  DRIVER.execute_script("$('span.text:contains(\"On\")').click()")
  DRIVER.execute_script("$('#On').prop('checked', false)")
  DRIVER.execute_script("$('#asset_test').prop('checked', false)")
  DRIVER.execute_script("$('#asset_enabled_for_option').prop('checked', true)")
  DRIVER.execute_script("$('#asset_enabled_for_cfd').prop('checked', false)")
  DRIVER.execute_script("$('#asset_enabled_for_demo').prop('checked', true)")
  DRIVER.execute_script("$('#asset_enabled_for_demo_cfd').prop('checked', false)")
  (1..12).each do |i|
    DRIVER.execute_script("$('asset_statuses_#{i}_active').prop('checked', true)")
    DRIVER.find_element(:id, "asset_statuses_#{i}_payment_rate_increment").clear
    DRIVER.find_element(:id, "asset_statuses_#{i}_payment_rate_increment").send_keys("#{i}")
  end

  days = []
  DRIVER.find_elements(:css, '.span3 > label').each { |day| days << day.text.downcase }

  days.each do |day|
    DRIVER.find_element(:id, "asset_schedule_#{day}_0").clear
    DRIVER.find_element(:id, "asset_schedule_#{day}_0").send_keys("00:00")
    DRIVER.find_element(:id, "asset_schedule_#{day}_1").clear
    DRIVER.find_element(:id, "asset_schedule_#{day}_1").send_keys("23:59")
    DRIVER.execute_script("$('#asset_daily_asset_schedule[#{day}]').prop('checked', true)")

    DRIVER.find_element(:id, "asset_schedule_cfd_#{day}_0").clear
    DRIVER.find_element(:id, "asset_schedule_cfd_#{day}_0").send_keys("00:00")
    DRIVER.find_element(:id, "asset_schedule_cfd_#{day}_1").clear
    DRIVER.find_element(:id, "asset_schedule_cfd_#{day}_1").send_keys("23:59")
  end

  asset = File.absolute_path('./app/assets/images/asset.jpg')
  DRIVER.find_element(:id, "asset_pic").send_keys(asset)
  sleep 1

  DRIVER.find_elements(:css, ".btn-primary")[2].click
  sleep 1
end


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

  30.times do |num|
    begin
      DRIVER.find_element(:xpath, "//input[@value='0']//../a").click
    rescue
    end
  end

  DRIVER.find_elements(:css, ".btn-success")[0].click
  sleep 1
end

Given /^Update page privacy$/ do
  authorization_by_crm(DRIVER)
  DRIVER.get CommonSetting[:url_page_crm] + ""
  sleep 1
  DRIVER.find_elements(:css, ".btn-primary")[0].click
end

Given /^Update page agreement$/ do
  authorization_by_crm(DRIVER)
  DRIVER.get CommonSetting[:url_page_crm] + ""
  sleep 1
  DRIVER.find_elements(:css, ".btn-primary")[0].click

end

Given /^Create new article$/ do
  authorization_by_crm(DRIVER)
  DRIVER.get CommonSetting[:url_page_crm] + ""
  sleep 1
  DRIVER.find_elements(:css, ".btn-primary")[0].click

end

Given /^Update title by home page$/ do
  authorization_by_crm(DRIVER)
  DRIVER.get CommonSetting[:url_page_crm] + ""
  sleep 1
  DRIVER.find_elements(:css, ".btn-primary")[0].click

end

Given /^Add and update new link$/ do
  authorization_by_crm(DRIVER)
  DRIVER.get CommonSetting[:url_page_crm] + ""
  sleep 1
  DRIVER.find_elements(:css, ".btn-primary")[0].click

end

Given /^Create new strategies$/ do
  authorization_by_crm(DRIVER)
  DRIVER.get CommonSetting[:url_page_crm] + ""
  sleep 1
  DRIVER.find_elements(:css, ".btn-primary")[0].click

end

Given /^Create new technical article$/ do
  authorization_by_crm(DRIVER)
  DRIVER.get CommonSetting[:url_page_crm] + ""
  sleep 1
  DRIVER.find_elements(:css, ".btn-primary")[0].click

end

Given /^Create new invest idea$/ do
  authorization_by_crm(DRIVER)
  DRIVER.get CommonSetting[:url_page_crm] + ""
  sleep 1
  DRIVER.find_elements(:css, ".btn-primary")[0].click

end

Given /^Add new video$/ do
  authorization_by_crm(DRIVER)
  DRIVER.get CommonSetting[:url_page_crm] + ""
  sleep 1
  DRIVER.find_elements(:css, ".btn-primary")[0].click

end

Given /^Add new press articles$/ do
  authorization_by_crm(DRIVER)
  DRIVER.get CommonSetting[:url_page_crm] + ""
  sleep 1
  DRIVER.find_elements(:css, ".btn-primary")[0].click

end

Given /^Add ticket category$/ do
  authorization_by_crm(DRIVER)
  DRIVER.get CommonSetting[:url_page_crm] + ""
  sleep 1
  DRIVER.find_elements(:css, ".btn-primary")[0].click

end

Given /^Update all advises$/ do
  authorization_by_crm(DRIVER)
  DRIVER.get CommonSetting[:url_page_crm] + ""
  sleep 1
  DRIVER.find_elements(:css, ".btn-primary")[0].click

end

Given /^Update first group$/ do
  authorization_by_crm(DRIVER)
  DRIVER.get CommonSetting[:url_page_crm] + ""
  sleep 1
  DRIVER.find_elements(:css, ".btn-primary")[0].click

end

Given /^Update and set first group by question$/ do
  authorization_by_crm(DRIVER)
  DRIVER.get CommonSetting[:url_page_crm] + ""
  sleep 1
  DRIVER.find_elements(:css, ".btn-primary")[0].click

end

Given /^Create new mailer$/ do
  authorization_by_crm(DRIVER)
  DRIVER.get CommonSetting[:url_page_crm] + ""
  sleep 1
  DRIVER.find_elements(:css, ".btn-primary")[0].click

end

Given /^Create new static$/ do
  authorization_by_crm(DRIVER)
  DRIVER.get CommonSetting[:url_page_crm] + ""
  sleep 1
  DRIVER.find_elements(:css, ".btn-primary")[0].click

end
