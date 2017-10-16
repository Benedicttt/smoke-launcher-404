
Then(/^Assert page welcome$/) do
  sleep 2
  if DRIVER.current_url == "https://#{ENV['stage']}.binomo.com/#{ENV['locale'].downcase}/trading"
    puts_success "true"
  else
    puts_danger "false"
  end
end

Then(/^Delete all providers stage and rename email account$/) do
   api_profile_edit = "https://#{ENV['stage']}.binomo.com/api/profile/edit"
   profile_edit = RestClient::Request.execute(
     method: :get,
     url: api_profile_edit,
     headers: {
       cookies: @cookies_soc,
       referer: "https://#{ENV['stage']}.binomo.com",
       params:{ locale: "ru", device: "web", geo: "RU", email: "#{SecureRandom.hex(14)}@yopmail.com", country: "AF" } } )

  Runner.call('UserProvider.delete_all')
  DRIVER.manage.delete_all_cookies
end
