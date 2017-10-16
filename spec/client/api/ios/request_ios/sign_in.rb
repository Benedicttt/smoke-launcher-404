class SignInApp
  def get_auth(device, locale, password, email, device_id, app_version)
    api_sign_in = "https://#{ENV['stage']}binomo.com/api/sign_in"
    response = RestClient::Request.execute(
      method: :post,
      url: api_sign_in,
      headers: {
        referer: "https://#{ENV['stage']}binomo.com",
        params:{
            locale: locale,
            device: device,
            password: password,
            email: email,
            geo: "RU",
            device_id: device_id,
            app_version: app_version
          }
        }
       ) { |response, request, result, &block| response}
    Cookies.where(stage: ENV['stage']).last.update(authtoken: JSON.parse(response.body)['data']['authtoken'])
    return JSON.parse(response.body)
  end
end
