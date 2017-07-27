
And /^Visit users coupons adds$/ do
  DRIVER.get CommonSetting[:url_page_crm] + "/coupons/user_coupons/new?scope=common"
end

When /^Add coupons for users$/ do
  DRIVER.find_element(:css, ".filter-option").click
  sleep 0.5
  DRIVER.find_element(:css, ".filter-option").click
  DRIVER.execute_script("$(\".text:contains('#{$name_coupons}')\").click()")
  sleep 1
  DRIVER.find_elements(:css, ".btn-primary")[1].click
  sleep 0.5
  $code = DRIVER.find_element(:css, "#main-content > div > table > tbody > tr > td:nth-child(5)").text
end

Then /^Visit to user from cahsier$/ do
  id = User.where(stage_number: ENV['stage']).last.id

  DRIVER.get CommonSetting[:app_host] + CommonSetting[:locale] + "/cashier"
    DRIVER.manage.add_cookie(name: "asset.daily", value: "FAKE")
    DRIVER.execute_script("localStorage.setItem(\"#{id}.real.welcome_bonus\", \"1\")" )
    DRIVER.execute_script("localStorage.setItem(\"#{id}.demo.welcome_bonus\", \"1\")")
  DRIVER.get CommonSetting[:app_host] + CommonSetting[:locale] + "/cashier"
  sleep 5
end

Then /^Activate coupons\?$/ do
  DRIVER.find_elements(:css, ".active.link-have-bonus > span.ng-binding")[0].click
  sleep 0.5
  DRIVER.find_elements(:css, ".coupon_code")[0].send_keys($code)
  sleep 2
  puts_success "#{$code}"
  puts_success "Common coupon visible icon #{DRIVER.execute_script("return $('.text-green-darker').is(':visible')")}"
end
