class Locale
  def get(device, locale)
    api = "https://#{ENV['stage']}binomo.com/api/locales"
    response = RestClient::Request.execute(
      method: :get,
      url:api,
      headers: {
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
