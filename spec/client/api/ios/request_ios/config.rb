class ConfigApp
  def get_ios(device, locale, geo, device_id, app_version)
    api_conf_up = "https://#{ENV['stage']}binomo.com/api/config"
    response = RestClient.get(
      api_conf_up,
      geo: geo,
       params: {
         locale: locale,
         device: device,
         device_id: device_id,
         app_version: app_version

     }){ |response, request, result, &block| response}
  end
end

class ConfigApp
  def get_config(device, locale, device_id, app_version, authtoken)
    api_conf_up = "https://#{ENV['stage']}binomo.com/api/config"
    response = RestClient.get(
      api_conf_up,
       params: {
         app_version: app_version,
         device: device,
         authtoken: authtoken,
         device_id: device_id,
         locale: locale

     }){ |response, request, result, &block| response }

  end
end
