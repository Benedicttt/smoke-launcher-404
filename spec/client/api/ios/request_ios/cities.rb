class CitiesApp
  def get(device, locale, country, device_id, app_version)
    api = "https://#{ENV['stage']}binomo.com/api/cities"
    response = RestClient::Request.execute(
      method: :get,
      url:api,
      headers: {
        cookies: Config.new.get_config("web", "ru"),
        params: {
           locale: locale,
           device: device,
           country: country,
           device_id: device_id,
           app_version: app_version
         }
       }
     ) { |response, request, result, &block| response}
     return JSON.parse(response.body)
  end
end
