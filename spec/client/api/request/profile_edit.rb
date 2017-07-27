class Profile
  def edit_welcome(device, locale, country, country_name, first_name, last_name,
                   nickname, gender, email, phone, receive_news, receive_sms,
                   receive_notification, birthday, single_thread_trade)

    url_profile_edit = "https://#{ENV['stage']}binomo.com/api/profile/edit"
    profile_edit = RestClient::Request.execute(
        method: :get,
        url: url_profile_edit,
        headers: {
          cookies: Cookies.where(stage: "#{ENV['stage']}").last.cookies_traider,
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
            single_thread_trade: single_thread_trade
          },
       }) { |response, request, result, &block| response}
    return JSON.parse(profile_edit.body)
  end

  def edit_error(device, locale, country, country_name, first_name, last_name,
                   nickname, gender, email, phone, receive_news, receive_sms,
                   receive_notification, birthday, single_thread_trade)

    url_profile_edit = "https://#{ENV['stage']}binomo.com/api/profile/edit"
    profile_edit = RestClient::Request.execute(
        method: :get,
        url: url_profile_edit,
        headers: {
          cookies: Cookies.where(stage: "#{ENV['stage']}").last.cookies_traider,
          referer: "https://#{ENV['stage']}binomo.com",
          params:{
            geo: "RU",
            authtoken: Cookies.where(stage: "#{ENV['stage']}").last.authtoken,
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
          },
       }) { |response, request, result, &block| response}
    return JSON.parse(profile_edit.body)
  end
end
