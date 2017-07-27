class Countries
  def get(device, locale, coutry)
    api = "https://#{ENV['stage']}binomo.com/api/countries"
    response = RestClient::Request.execute(
      method: :get,
      url:api,
      headers: {
        cookies: Cookies.where(stage: "#{ENV['stage']}").last.cookies_traider,
        params: {
           locale: locale,
           device: device,
           coutry: coutry,
           geo: "RU"
         }
       }
     ) { |response, request, result, &block| response}
     return JSON.parse(response.body)
  end
end
