Given /^Find status treder$/ do
end

Then /^Status treder$/ do
  if ENV['driver'] == "firefox"
    @status_tr = Selenium::WebDriver.for ENV['driver'].to_sym
  elsif ENV['driver'] == "chrome"
    options =  Selenium::WebDriver::Chrome::Options.new(args: ["--verbose", "#{ENV['param_headless']}", "--window-size=1600, 768", "--start-maximized",  "--disable-gpu", "--disable-notifications" , "#{ENV['proxy_http']}#{ENV['proxy_server']}"])
    @status_tr = Selenium::WebDriver.for ENV['driver'].to_sym, options: options
    @status_tr.manage.timeouts.implicit_wait = 5
  end

  @status_tr.get CommonSetting[:app_host] + CommonSetting[:locale]
  sleep 1
  id = User.where(stage_number: ENV['stage']).last.id

  add_cookies_to_page(@status_tr)
  @status_tr.execute_script("localStorage.setItem(\"#{id}.real.welcome_bonus\", \"1\")" )
  @status_tr.execute_script("localStorage.setItem(\"#{id}.demo.welcome_bonus\", \"1\")")
  @status_tr.manage.add_cookie(name: "asset.daily", value: "FAKE")
  @status_tr.manage.add_cookie(name: "agreed", value: "1")
  @status_tr.get CommonSetting[:app_host] + CommonSetting[:locale] + "/help"

  sleep 2
  @status_tr_treder = @status_tr.execute_script("return angular.element(document.querySelectorAll('.btn-link > i')).attr('class')")

  retried_process(1,3) do
    if "#{@status_tr_treder}" == "n-icon-user-free-status"
      que "update users set status='free', updated_at = '#{Time.now}' where id = '#{id}';"
      puts_info "#{@status_tr.execute_script("return angular.element(document.querySelectorAll('.btn-link > i')).attr('class')")}"

    elsif "#{@status_tr_treder}" == "n-icon-user-standard-status"
      que "update users set status='standard', updated_at = '#{Time.now}' where id = '#{id}';"
      puts_info "#{@status_tr.execute_script("return angular.element(document.querySelectorAll('.btn-link > i')).attr('class')")}"

    elsif "#{@status_tr_treder}" == "n-icon-user-gold-status"
      que "update users set status='gold', updated_at = '#{Time.now}' where id = '#{id}';"
      puts_info "#{@status_tr.execute_script("return angular.element(document.querySelectorAll('.btn-link > i')).attr('class')")}"

    elsif "#{@status_tr_treder}" == "n-icon-user-vip-status"
      que "update users set status='vip', updated_at = '#{Time.now}' where id = '#{id}';"
      puts_info "#{@status_tr.execute_script("return angular.element(document.querySelectorAll('.btn-link > i')).attr('class')")}"

    end
  end

  @status_tr.quit
end
