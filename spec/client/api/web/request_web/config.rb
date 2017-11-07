class Config
  def get_web(device, locale, geo)
    api_conf_up = "https://#{ENV['stage']}binomo.com/api/config"
    response = RestClient.get(
      api_conf_up,
      geo: geo,
       params: {
         locale: locale,
         device: device,
     }){ |response, request, result, &block| response}

     return JSON.parse(response)
  end

  def get_config(device, locale)
    api_conf_up = "https://#{ENV['stage']}binomo.com/api/config"
    response = RestClient.get(
      api_conf_up,
       params: {
         locale: locale,
         device: device,
         geo: "RU"
     }){ |response, request, result, &block| response}

     return response.cookies
  end

  def get_web_v2(device, locale, geo)
    api_conf_up = "https://#{ENV['stage']}binomo.com/api/v2/config"
    response = RestClient.get(
      api_conf_up,
      geo: geo,
       params: {
         locale: locale,
         device: device,
     }){ |response, request, result, &block| response}
     return JSON.parse(response.body)
  end

  def get_config_v2(device, locale)
    api_conf_up = "https://#{ENV['stage']}binomo.com/api/v2/config"
    response = RestClient.get(
      api_conf_up,
      cookies: Cookies.where(stage: "#{ENV['stage']}").last.cookies_traider,
       params: {
         locale: locale,
         device: device,
         geo: "RU"
     }){ |response, request, result, &block| response}
    return JSON.parse(response.body)
  end

end
