Given /^Testing bonuses$/ do
  # $pool.post do
    if ENV['driver'] == "firefox"
      bon = Selenium::WebDriver.for ENV['driver'].to_sym
    elsif ENV['driver'] == "chrome"
      options =  Selenium::WebDriver::Chrome::Options.new(args: ["--verbose", "#{ENV['param_headless']}", "--window-size=1600, 768", "--start-maximized",  "--disable-gpu", "--disable-notifications" , "#{ENV['proxy_http']}#{ENV['proxy_server']}"])
      bon = Selenium::WebDriver.for ENV['driver'].to_sym, options: options
    end

      bon.get(CommonSetting[:url_page_crm] + "coupons/user_coupons/new?scope=individual")

    if bon.current_url === CommonSetting[:url_page_crm] + "login"
      retried_process(3, 3) do
        bon.find_element(:id, "email").send_keys(CommonSetting[:user_crm]['login'])
        bon.find_element(:id, "password").send_keys(CommonSetting[:user_crm]['password'])
        bon.find_element(:css, 'input[value="Sign in"]').click
      end

      bon.get(CommonSetting[:url_page_crm] + "coupons/user_coupons/new?scope=individual")
      sleep 2

      find_and_click_selectors('.text', $id_bonus, bon)

      bon.find_element(:id, "coupon_count").send_keys("2")

      @id = User.where(stage_number: ENV['stage']).last.id
      bon.find_element(:id, "coupon_user_ids").send_keys("#{@id}")
      bon.execute_script("document.querySelector('input[type=submit].btn-primary').click()")
      sleep 1

      bon.get(CommonSetting[:app_host] + CommonSetting[:locale] + "/trading")
      bon.manage.add_cookie(name: "asset.daily", value: "FAKE")
      bon.execute_script("localStorage.setItem(\"#{@id}.real.welcome_bonus\", \"1\")" )
      bon.execute_script("localStorage.setItem(\"#{@id}.demo.welcome_bonus\", \"1\")")
      add_cookies_to_page(bon)
      bon.get(CommonSetting[:app_host] + CommonSetting[:locale] + "/trading")
      sleep 5
      bon.execute_script("document.querySelectorAll(\".i-unit > .title > translate\")[1].click()")
      # bon.execute_script("$(\"translate:contains('Bonuses')\")[0].click()")
      sleep 2
      bon.execute_script("document.querySelector('button.btn-primary.btn-sm').click()")
      sleep 1
      bon.execute_script("document.querySelector('button.btn-primary.btn-sm').click()")
      sleep 2


      bon.get(CommonSetting[:url_user_crm] + "/#{@id}" + "/bonuses")
      sleep 1

      id =  "ID: #{bon.find_element(:css, "#main-content > div > div:nth-child(3) > table > tbody > tr > td:nth-child(1)").text}"
      amount =  "Amount: #{bon.find_element(:css, "#main-content > div > div:nth-child(3) > table > tbody > tr > td:nth-child(2)").text}"
      status =  "Status: #{bon.find_element(:css, "#main-content > div > div:nth-child(3) > table > tbody > tr > td:nth-child(7)").text}"
      leverage =  "Leverage: #{bon.find_element(:css,'#main-content > div > div:nth-child(3) > table > tbody > tr > td:nth-child(4)').text}"
      puts_warning "#{link_report_id(bon.current_url.to_s, bon.current_url.to_s)} #{id} #{amount} #{status} #{leverage}"
      sleep 2

      bon.get(CommonSetting[:url_user_crm] + "/#{@id}" + "/free_deals")
      sleep 3

      sum =  "ID: #{bon.find_element(:css, "#main-content > div > div > div > table > tbody > tr > td:nth-child(1)").text}"
      amount =  "Amount: #{bon.find_element(:css, "#main-content > div > div > div > table > tbody > tr > td:nth-child(3)").text}"
      status =  "Status: #{bon.find_element(:css, "#main-content > div > div > div > table > tbody > tr > td:nth-child(5)").text}"
      create_at =  "Leverage: #{bon.find_element(:css, '#main-content > div > div > div > table > tbody > tr > td:nth-child(7)').text}"
      puts_warning "#{link_report_id(bon.current_url.to_s, bon.current_url.to_s)} #{sum} #{amount} #{status} #{create_at}"

    end
    bon.quit
  # end
end
