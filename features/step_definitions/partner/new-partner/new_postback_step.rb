Given /^Created postback$/ do
  DRIVER.get CommonSetting[:url_partner]
  DRIVER.manage.delete_all_cookies
  sleep 1
  DRIVER.get CommonSetting[:url_partner]
  wait_until(5, :css, "div.sign-in-btn")
  DRIVER.find_element(:css, "div.sign-in-btn").click
  sleep 3
  DRIVER.execute_script("$('.form > .control-group > .email').val('#{@@email_partner}')")
  DRIVER.execute_script("$('.form > .control-group > .password').val('#{CommonSetting[:user_test]['pass_partner']}')")
  DRIVER.find_elements(:css, ".btn-yellow")[0].click
  sleep 3
end

When  /^Enter data$/ do
  DRIVER.get CommonSetting[:url_partner] + CommonSetting[:page]["postback"]
  sleep 1
  DRIVER.execute_script("$('#postback_method > option:nth-child(1)').prop('selected',true)")
  sleep 0.5
  DRIVER.find_element(:css, "input[name='postback[campaign_name]']").send_keys("com-123")
  DRIVER.find_element(:css, "input[name='postback[subaccount_name]']").send_keys("sub-123")
  DRIVER.find_element(:css, "input[name='postback[url]']").send_keys(CommonSetting[:url_partner] + "ru")
  DRIVER.execute_script("$('#postback_method > option:nth-child(2)').click()")
  DRIVER.find_element(:css, "input[name='postback[data][reg_name]']").send_keys("reg_test1")
  DRIVER.find_element(:css, "input[name='postback[data][conf_name]']").send_keys("conf_test1")
  DRIVER.find_element(:css, "input[name='postback[data][ftd_name]']").send_keys("ftd_test1")
  DRIVER.find_element(:css, "input[name='postback[data][dep_name]']").send_keys("dep_test1")
  DRIVER.find_element(:css, "input[name='postback[data][app_name]']").send_keys("app_test1")
  DRIVER.find_element(:css, "input[name='postback[data][click_id_name]']").send_keys("click_id_test1")
  DRIVER.find_element(:css, "input[name='postback[data][site_id_name]']").send_keys("site_id_test1")
  DRIVER.find_element(:css, "input[name='postback[data][trader_id_name]']").send_keys("trader_id_test1")
  DRIVER.find_element(:css, "input[name='postback[data][sumdep_name]']").send_keys("sumdep_test1")
  DRIVER.find_element(:css, "input[name='postback[data][transaction_name]']").send_keys("transaction_test1")
  DRIVER.find_element(:css, "input[name='postback[data][a_name]']").send_keys("a_test1")
  DRIVER.find_element(:css, "input[name='postback[data][ac_name]']").send_keys("ac_test1")
  DRIVER.find_element(:css, "input[name='postback[data][sa_name]']").send_keys("sa_test1")
  DRIVER.find_element(:css, "input[name='postback[data][cpa_name]']").send_keys("cpa_test1")

  DRIVER.find_element(:css, "input[name='postback[data][reg_url]']").send_keys(CommonSetting[:url_partner] + "ru")
  DRIVER.find_element(:css, "input[name='postback[data][conf_url]']").send_keys(CommonSetting[:url_partner] + "ru")
  DRIVER.find_element(:css, "input[name='postback[data][dep_url]']").send_keys(CommonSetting[:url_partner] + "ru")
  DRIVER.find_element(:css, "input[name='postback[data][ftd_url]']").send_keys(CommonSetting[:url_partner] + "ru")
  DRIVER.find_element(:css, "input[name='postback[data][app_url]']").send_keys(CommonSetting[:url_partner] + "ru")
  DRIVER.find_element(:css, "input[name='postback[data][cpa_url]']").send_keys(CommonSetting[:url_partner] + "ru") if has_css?("input[name='postback[data][cpa_name]']")
  sleep 1
end

Then /^Data is entered$/ do
  DRIVER.find_element(:css, ".btn.btn-primary").click
  sleep 1
end

When /^Activate postback$/ do
  link_post = DRIVER.find_element(:css, 'a.btn.btn-warning').attribute('href').sub(/#{ENV['stage']}/, "#{ENV['stage']}-adm").sub(/\/ru/, '')
  DRIVER.get link_post
  sleep 3
  DRIVER.execute_script("$('div.form-group.boolean.optional.postback_active > div > label > span').click()")
  sleep 0.5
  DRIVER.find_element(:css, ".btn.btn-primary").click
  sleep 1
  begin
    puts_success "Status Postback: " + DRIVER.find_element(:xpath, "//*[contains(text(), '#{@@email_partner}')]/../../td[5]").text
  rescue
    puts_danger "Not found '#{@@email_partner}' this email"
  end
end

When /^Delete postbacks$/ do
  PartnersSmoke::Admin.authorize
  DRIVER.get CommonSetting[:url_adm_partner] + "/postbacks"
  sleep 1
  begin
    while DRIVER.find_elements(:css, ".btn-danger")[0].displayed? == true
      DRIVER.find_elements(:css, ".btn-danger")[0].click
      print u
    end
  rescue
    puts_danger "Delete ALL postbacks"
  end
end
