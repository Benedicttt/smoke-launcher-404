class Authorized
  def get_auth(device, locale, password, email)
    api_sign_in = "https://#{ENV['stage']}binomo.com/api/sign_in"
    response = RestClient::Request.execute(
      method: :post,
      url: api_sign_in,
      headers: {
        cookies: Config.new.get_config("web", "ru"),
        referer: "https://#{ENV['stage']}binomo.com",
        params:{
            locale: locale,
            device: device,
            password: password,
            email: email,
            geo: "RU"
          }
        }
       ) { |response, request, result, &block| response}
    return JSON.parse(response.body)
  end
end
