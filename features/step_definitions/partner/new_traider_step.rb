Given /^Visit with partner refcode$/ do
  # DRIVER.get "https://binomo.co?a=#{ENV["refcode"]}I&t=#{ENV['tariff'].to_s}&sa=Testing_sa&ac=testing_ac"
  # DRIVER.get CommonSetting[:app_host] + CommonSetting[:locale] + "?a=#{ENV["refcode"]}gfdggdgfdgdf&t=#{ENV['tariff'].to_s}&sa=Testing_sa&ac=testing_ac&geo=#{ENV['geo']}"
  # sleep 1
  DRIVER.get CommonSetting[:app_host] + CommonSetting[:locale] + "?a=#{ENV["refcode"]}&t=#{ENV['tariff'].to_s}&sa=Testing_sa&ac=testing_ac&geo=#{ENV['geo']}"
  puts_info CommonSetting[:app_host] + CommonSetting[:locale] + "?a=#{ENV["refcode"]}&t=#{ENV['tariff'].to_s}&sa=Testing_sa&ac=testing_ac&geo=#{ENV['geo']}"
  DRIVER.manage.delete_cookie("geo");
  DRIVER.manage.add_cookie(name: "geo", value: "#{ENV['geo']}")
  sleep 1
  DRIVER.navigate.refresh

end

When /^Registration traider refcode$/  do
  sleep 5
  wait_until(5, :class, "btn-primary")
  DRIVER.find_element(:class, "btn-primary").click
  DRIVER.find_element(:css, "input[name=email]").send_keys(EMAIL)
  DRIVER.find_element(:css, "input[name=password]").send_keys(CommonSetting[:user_test]['pass_platform'])
  1.times { DRIVER.find_element(:css, "span[ng-bind='::vm.title']").click; sleep 0.5 }

  2.times { DRIVER.execute_script(CommonSetting[:currency][0]) }
  sleep 1
  DRIVER.find_element(:css, "fieldset > div:nth-child(6) > button").click
  sleep 1
end

Then /^Email, locale, id, currency \- partner$/ do
  ApiResponse.run
  sleep 1

  que "update users
        set
        platform = 'partner',
        updated_at = '#{Time.now}',
        refcode = '#{ENV["refcode"]}',
        tariff = '#{ENV['tariff']}',
        partner_id = (select id from partners where refcode = '#{Partner.last.refcode}')
        where id = '#{User.where(stage_number: ENV['stage']).last.id}' ;"
end
