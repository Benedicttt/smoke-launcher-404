class AssetsApp
  def type(device, locale, device_id, app_version)
    api = "https://#{ENV['stage']}binomo.com/api/assets/types"
    response = RestClient::Request.execute(
      method: :get,
      url:api,
      headers: {
           params: {
           locale: locale,
           device: device,
           device_id: device_id,
           app_version: app_version
          }
       }
     ) { |response, request, result, &block| response}

   return  JSON.parse(response.body)
  end

end
