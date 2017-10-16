class Cities
  def get(device, locale, country)
    api = "https://#{ENV['stage']}binomo.com/api/cities"
    response = RestClient::Request.execute(
      method: :get,
      url:api,
      headers: {
        cookies: Config.new.get_config("web", "ru"),
        params: {
           locale: locale,
           device: device,
           country: country

         }
       }
     ) { |response, request, result, &block| response}
     return JSON.parse(response.body)
  end
end
