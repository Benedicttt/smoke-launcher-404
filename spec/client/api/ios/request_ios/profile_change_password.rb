class ProfileApp
  def change_password(device, locale, email, authtoken, current_password,  new_password, new_password_confirmation, device_id, app_version)
     url_profile= "https://#{ENV['stage']}binomo.com/api/profile/change_password"
     profile = RestClient::Request.execute(
         method: :get,
         url: url_profile,
         headers: {
           referer: "https://#{ENV['stage']}binomo.com",
           params:{
             locale: locale,
             device: device,
             email: email,
             current_password: current_password,
             new_password: new_password,
             new_password_confirmation: new_password_confirmation,
             authtoken: authtoken,
             geo: "RU",
             device_id: device_id,
             app_version: app_version

       }}) { |response, request, result, &block| response}

     Cookies.where(stage: "#{ENV['stage']}").last.update(cookies_traider: profile.cookies, authtoken: JSON.parse(profile.body)['data']['authtoken'])
     return JSON.parse(profile.body)
  end

  def change_password_error(device, locale, email, authtoken, current_password,  new_password, new_password_confirmation, device_id, app_version)
     url_profile= "https://#{ENV['stage']}binomo.com/api/profile/change_password"
     profile = RestClient::Request.execute(
         method: :get,
         url: url_profile,
         headers: {
           referer: "https://#{ENV['stage']}binomo.com",
           params:{
             locale: locale,
             device: device,
             email: email,
             current_password: current_password,
             new_password: new_password,
             new_password_confirmation: new_password_confirmation,
             authtoken: authtoken,
             geo: "RU",
             device_id: device_id,
             app_version: app_version
             
       }}) { |response, request, result, &block| response}

     return JSON.parse(profile.body)
  end
end
