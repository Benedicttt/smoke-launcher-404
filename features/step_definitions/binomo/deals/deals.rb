Given /^Visit page trading$/ do

  $deals = Driver::Set.session(:deals)
  $deals.get(CommonSetting[:app_host] + CommonSetting[:locale] + "/trading")
  sleep 1

  $deals.manage.window.resize_to(1200, 700)

  id = User.where(stage_number: ENV['stage']).last.id
  add_cookies_to_page($deals)
  $deals.manage.add_cookie(name: "asset.daily", value: "FAKE")
  $deals.manage.delete_cookie("agreed");
  $deals.execute_script("localStorage.setItem(\"#{id}.real.welcome_bonus\", \"1\")" )
  $deals.execute_script("localStorage.setItem(\"#{id}.demo.welcome_bonus\", \"1\")")
  $deals.get(CommonSetting[:app_host] + CommonSetting[:locale] + "/trading")
end

When /^Use demo type$/ do
  sleep 5
  $deals.find_element(:css, "div.b-unit-dropdown-balance").click
  sleep 1
  $deals.find_elements(:css, ".i-unit-account-type")[1].click
  sleep 2
  begin
    implicit_wait_set(10, DRIVER)
    $deals.find_elements(:css, ".w-unit-account-mode-changed > button.btn-primary")[0].click
    implicit_wait_set(60, DRIVER)
  rescue Selenium::WebDriver::Error::NoSuchElementError
    puts_info "No found modal"
  end
end

When /^Use real type$/ do
  sleep 5
  $deals.find_element(:css, "div.b-unit-dropdown-balance").click
  sleep 1
  $deals.find_elements(:css, ".i-unit-account-type")[0].click
  sleep 2

  begin
    implicit_wait_set(10, DRIVER)
    $deals.find_elements(:css, ".w-unit-account-mode-changed > button.btn-primary")[0].click
    implicit_wait_set(60, DRIVER)
  rescue Selenium::WebDriver::Error::NoSuchElementError
    puts_info "No found modal"
  end
  sleep 2
end

Then /^Transactions committed$/ do
  puts_info "Created #{ENV['count_deals']} rates #{ENV['count_deals_sum']} #{ENV['cur']}"
  $deals.quit
end
