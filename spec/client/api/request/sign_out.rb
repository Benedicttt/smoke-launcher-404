class Sign_out
  def response(device, locale)
    api_sign_in = "https://#{ENV['stage']}binomo.com/api/sign_in"
    response = RestClient::Request.execute(
      method: :post,
      url: api_sign_in,
      headers: {
        referer: "https://#{ENV['stage']}binomo.com",
        cookies: Cookies.where(stage: "#{ENV['stage']}").last.cookies_traider,
        params:{
            locale: locale,
            device: device,
            geo: "RU"
          }
        }
       ) { |response, request, result, &block| result}
    return JSON.parse(response.body)
  end
end
