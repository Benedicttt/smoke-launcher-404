class CountriesApp
  def get(device, locale, coutry, device_id, app_version)
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
           geo: "RU",
           device_id: device_id,
           app_version: app_version
         }
       }
     ) { |response, request, result, &block| response}
     return JSON.parse(response.body)
  end
end
