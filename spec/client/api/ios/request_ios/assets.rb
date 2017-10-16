class AssetsApp
  def get(device, locale, device_id, app_version)
    api = "https://#{ENV['stage']}binomo.com/api/assets"
    response = RestClient::Request.execute(
      method: :get,
      url:api,
      headers: {
        cookies: Config.new.get_config("web", "ru"),
           params: {
           locale: locale,
           device: device,
           country: "RU",
           device_id: device_id,
           app_version: app_version

          }
       }
     ) { |response, request, result, &block| response}

     return asset =  JSON.parse(response.body),
     payment_rate_turbo =  asset['data']['assets'].map { |k| k['payment_rate_turbo'] if k['name'] == "FOR/HEIGHT" }.compact,
     payment_rate_binary = asset['data']['assets'].map { |k| k['payment_rate_binary'] if k['name'] == "FOR/HEIGHT" }.compact,
     ric = asset['data']['assets'].map { |k| k['ric'] if k['ric'] == "GOL/OTC" }.compact
  end

  def errors(device, locale)
    api = "https://#{ENV['stage']}binomo.com/api/assets"
    response = RestClient::Request.execute(
      method: :get,
      url:api,
      headers: {
           params: {
           locale: locale,
           device: device,
           country: "RU",
           device_id: device_id,
           app_version: app_version
          }
       }
     ) { |response, request, result, &block| response}

      return JSON.parse(response.body)
  end
end
