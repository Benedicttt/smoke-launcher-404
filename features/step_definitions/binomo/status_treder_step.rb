Given /^Find status treder$/ do
end

Then /^Status treder$/ do
  if ENV['driver'] == "firefox"
    @status_tr = Selenium::WebDriver.for ENV['driver'].to_sym
  elsif ENV['driver'] == "chrome"
    options =  Selenium::WebDriver::Chrome::Options.new(args: %w[disable-gpu --disable-notifications])
    @status_tr = Selenium::WebDriver.for ENV['driver'].to_sym, options: options
  end

  @status_tr.get CommonSetting[:app_host] + CommonSetting[:locale]

  sleep 1
  id = User.where(stage_number: ENV['stage']).last.id
  add_cookies_to_page(@status_tr)
  @status_tr.get CommonSetting[:app_host] + CommonSetting[:locale]
  sleep 1
  @status_tr.manage.window.resize_to(1200, 700)

  @status_tr_treder = @status_tr.execute_script("return $('#dropdownProfile > i').attr('class')")

  if "#{@status_tr_treder}" == "n-icon-user-free-status"
    puts_info "#{@status_tr.execute_script("return $('#dropdownProfile > i').attr('class')")}"
    que "update users set status='free', updated_at = '#{Time.now}' where id = '#{id}';"
  end

  if "#{@status_tr_treder}" == "n-icon-user-standard-status"
    puts_info "#{@status_tr.execute_script("return $('#dropdownProfile > i').attr('class')")}"
    que "update users set status= 'standard', updated_at = '#{Time.now}' where id = '#{id}';"
  end

  if "#{@status_tr_treder}" == "n-icon-user-gold-status"
    puts_info "#{@status_tr.execute_script("return $('#dropdownProfile > i').attr('class')")}"
    que "update users set status= 'gold', updated_at = '#{Time.now}' where id = '#{id}';"
  end

  if "#{@status_tr_treder}" == "n-icon-user-vip-status"
    puts_info "#{@status_tr.execute_script("return $('#dropdownProfile > i').attr('class')")}"
    que "update users set status= 'vip', updated_at = '#{Time.now}' where id = '#{id}';"
  end
  @status_tr.quit

end
