class ProfileEditApp
  def edit_welcome(device, locale, country, country_name, first_name, last_name,
                   nickname, gender, email, phone, receive_news, receive_sms,
                   receive_notification, birthday, single_thread_trade, device_id, app_version, authtoken)

    url_profile_edit = "https://#{ENV['stage']}binomo.com/api/profile/edit"
    profile_edit = RestClient::Request.execute(
        method: :get,
        url: url_profile_edit,
        headers: {
          referer: "https://#{ENV['stage']}binomo.com",
          params:{
            geo: "RU",
            locale: locale,
            device: device,
            country: country,
            country_name: country_name,
            first_name: first_name,
            last_name:last_name,
            nickname: nickname,
            gender: gender,
            email: email,
            phone: phone,
            receive_news: receive_news,
            receive_sms: receive_sms,
            receive_notification: receive_notification,
            birthday: birthday,
            single_thread_trade: single_thread_trade,
            device_id: device_id,
            app_version: app_version,
            authtoken: authtoken
          },
       }) { |response, request, result, &block| response }
    return JSON.parse(profile_edit.body)
  end

  def edit_error(device, locale, country, country_name, first_name, last_name,
                   nickname, gender, email, phone, receive_news, receive_sms,
                   receive_notification, birthday, single_thread_trade, device_id, app_version, authtoken)

    url_profile_edit = "https://#{ENV['stage']}binomo.com/api/profile/edit"
    profile_edit = RestClient::Request.execute(
        method: :get,
        url: url_profile_edit,
        headers: {
          referer: "https://#{ENV['stage']}binomo.com",
          params:{
            geo: "RU",
            locale: locale,
            device: device,
            country: country,
            country_name: country_name,
            first_name: first_name,
            last_name:last_name,
            nickname: nickname,
            gender: gender,
            email: email,
            phone: phone,
            receive_news: receive_news,
            receive_sms: receive_sms,
            receive_notification: receive_notification,
            birthday: birthday,
            single_thread_trade: single_thread_trade,
            device_id: device_id,
            app_version: app_version,
            authtoken: authtokens
          },
       }) { |response, request, result, &block| response}
    return JSON.parse(profile_edit.body)
  end
end
