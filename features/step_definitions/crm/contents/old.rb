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
    DRIVER.execute_script("$('#daily_assets_#{i}_random').prop('checked', true)"
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
  DRIVER.find_elements(:css, ".btn-primary")[0].click
  sleep 1
  DRIVER.find_elements(:css, ".btn-primary")[0].click
end

Given /^Create one preset$/ do
  refcode = Partner.last.refcode
  authorization_by_crm(DRIVER)
  DRIVER.get CommonSetting[:url_page_crm] + "/presets/new"
  sleep 1
  DRIVER.find_element(:id, "preset_title").send_keys("test_preset")
  DRIVER.find_element(:id, "preset_refcodes").send(refcode)
  DRIVER.find_elements(:css, ".btn-primary")[0].click
  sleep 1
  DRIVER.find_element(:xpath, "//*[@id='main-content']/div/table/tbody/tr[2]/td[1]") == refcode
end

Given /^Set percet rate and time$/ do
  authorization_by_crm(DRIVER)
  DRIVER.get CommonSetting[:url_page_crm] + "/stock_assets"
  sleep 1
  DRIVER.find_element(:id, "assets_reduce_rates_time_from").clear
  DRIVER.find_element(:id, "assets_reduce_rates_time_from").send_keys("11:00")
  DRIVER.find_element(:id, "assets_reduce_rates_time_to").clear
  DRIVER.find_element(:id, "assets_reduce_rates_time_to").send_keys("11:15")
  DRIVER.find_element(:id, "assets_reduce_rates_value").clear
  DRIVER.find_element(:id, "assets_reduce_rates_value").send_keys("15")

  DRIVER.find_elements(:css, ".btn-small")[0].click
end


#######
Given /^Set ric GOL\/OTC all defaults params$/ do
  authorization_by_crm(DRIVER)
  DRIVER.get CommonSetting[:url_page_crm] + "/stock_assets"
  sleep 1
  DRIVER.find_element(:xpath, ('//*[@class="sortable-row"]//td[text() = "FOR/HEIGHT"]//../td[10]').click
  sleep 
  DRIVER.find_elements(:css, ".btn-primary")[0].click

end

Given /^Set USD curency defaults params$/ do
  authorization_by_crm(DRIVER)
  DRIVER.get CommonSetting[:url_page_crm] + ""
  sleep 1
  DRIVER.find_elements(:css, ".btn-primary")[0].click

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
