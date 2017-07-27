class Currency
  def get(device, locale)
    api = "https://#{ENV['stage']}binomo.com/api/currencies"
    response = RestClient::Request.execute(
      method: :get,
      url:api,
      headers: {
        cookies: Cookies.where(stage: "#{ENV['stage']}").last.cookies_traider,
        params: {
           locale: locale,
           device: device,
           geo: "RU"
         }
       }
     ) { |response, request, result, &block| response}
     return JSON.parse(response.body)
  end
end
