class ProfileApp
  def get(device, locale, device_id, app_version, authtoken)
   api_sign_in = "https://#{ENV['stage']}binomo.com/api/sign_in"
   response = RestClient::Request.execute(
     method: :post,
     url: api_sign_in,
       headers: {
         referer: "https://#{ENV['stage']}binomo.com",
         params:{
             locale: locale,
             device: device,
             geo: "RU",
             device_id: device_id,
             app_version: app_version,
             authtoken: authtoken

      }}) { |response, request, result, &block| response}
    return JSON.parse(response.body)
  end
end
