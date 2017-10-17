Given(/^Visit homepage and click soc\-reg vk\(not ref\)$/) do
  DRIVER.get CommonSetting[:app_host] + CommonSetting[:locale] + "?geo=#{ENV['geo']}"
  sleep 1
  DRIVER.manage.delete_cookie("geo");
  DRIVER.manage.delete_all_cookies
  DRIVER.manage.add_cookie(name: "geo", value: "#{ENV['geo']}")
  DRIVER.navigate.refresh
  sleep 3
  wait_until(5, :class, "btn-primary")
  DRIVER.find_element(:class, "btn-primary").click
  sleep 2
  DRIVER.find_elements(:css, 'div.btn-icon.btn-md.ng-scope.btn-icon-vk')[0].click
end

Given(/^Visit homepage and click soc\-reg vk$/) do
  DRIVER.get CommonSetting[:app_host] + CommonSetting[:locale] + "?a=#{ENV["refcode"]}&geo=#{ENV['geo']}&t=#{ENV['tariff'].to_s}&sa=Testing_sa&ac=testing_ac"
  sleep 1
  DRIVER.manage.delete_cookie("geo");
  DRIVER.manage.delete_all_cookies
  DRIVER.manage.add_cookie(name: "geo", value: "#{ENV['geo']}")
  DRIVER.navigate.refresh
  sleep 3
  wait_until(5, :class, "btn-primary")
  DRIVER.find_element(:class, "btn-primary").click
  sleep 2
  DRIVER.find_elements(:css, 'div.btn-icon.btn-md.ng-scope.btn-icon-vk')[0].click
end

When(/^Click my email vk$/) do
  sleep 1
  wnd_titl = DRIVER.window_handles.map do |w|
    DRIVER.switch_to.window(w)
    [w,DRIVER.title]
  end
  #
  sleep 3
  DRIVER.find_element(:css, "input[name=email]").send_keys("reg27051987@gmail.com")
  DRIVER.find_element(:css, "input[name=pass]").send_keys(CommonSetting[:user_crm]['password'])
  DRIVER.find_element(:id, "install_allow").click
  DRIVER.switch_to.window(DRIVER.window_handles[0])
  sleep 1
end

Then(/^Auth soc reg vk$/) do
  @cookies_soc = DRIVER.manage.all_cookies.each_with_object({}) { |cookie, acc| acc[cookie[:name]] = cookie[:value] }
  api_profile = "https://#{ENV['stage']}.binomo.com/api/profile"
  profile = RestClient::Request.execute(
    method: :get,
    url: api_profile,
    headers: {
      cookies: @cookies_soc,
      referer: "https://#{ENV['stage']}.binomo.com",
      params:{ locale: "ru", device: "web", geo: "RU" } } )

  DRIVER.manage.delete_all_cookies
  DRIVER.manage.add_cookie(name: "geo", value: "#{ENV['geo']}")
  DRIVER.navigate.refresh
  sleep 3
  DRIVER.find_element(:css, "div:nth-child(2) > div > button").click
  sleep 3
  DRIVER.find_elements(:css, 'div.btn-icon.btn-md.ng-scope.btn-icon-vk')[1].click
  sleep 1
end
