Given /^Testing free deals$/ do
  # $pool.post do
    if ENV['driver'] == "firefox"
      fd = Selenium::WebDriver.for ENV['driver'].to_sym
      fd.manage.window.resize_to(1200, 700)
    elsif ENV['driver'] == "chrome"
      options =  Selenium::WebDriver::Chrome::Options.new(args:[ "#{ENV['param_headless']}", "--no-sandbox", "--disable-backing-store-limit", "--max-unused-resource-memory-usage-percentage", "--window-size=1600, 768", "--start-maximized",  "--disable-gpu", "--disable-notifications" , "#{ENV['proxy_http']}#{ENV['proxy_server']}"])
      fd = Selenium::WebDriver.for ENV['driver'].to_sym, options: options
    end

    fd.get(CommonSetting[:url_page_crm] + "coupons/user_coupons/new?scope=individual")

    if fd.current_url === CommonSetting[:url_page_crm] + "login"
      retried_process(3, 3) do
        fd.find_element(:id, "email").send_keys(CommonSetting[:user_crm]['login'])
        fd.find_element(:id, "password").send_keys(CommonSetting[:user_crm]['password'])
        fd.find_element(:css, 'input[value="Sign in"]').click
      end
      fd.get(CommonSetting[:url_page_crm] + "coupons/user_coupons/new?scope=individual")
      sleep 2

      id = User.where(stage_number: ENV['stage']).last.id
      fd.execute_script("$(\"span:contains('#{$id_free_deals}')\").click()")
      fd.find_element(:id, "coupon_count").send_keys("2")
      fd.find_element(:id, "coupon_user_ids").send_keys(id)
      fd.execute_script("$('input[type=submit].btn-primary').click()")
      sleep 1
    end
    fd.quit
  # end
end
