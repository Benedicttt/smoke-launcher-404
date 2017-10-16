
def signature(params)
  secret = "bdd0395116d7873181e2161ecd4bdac6"
  parts = params.keys.sort.map { |key| "#{key}:#{params[key]}" }
  parts << secret
  Digest::SHA1.hexdigest parts.compact.join(";")
end

class ApiApp
  def get_api(device, locale, device_id, app_version)
    api = "https://#{ENV['stage']}binomo.com/api"
    response = RestClient.get(api,
         locale: locale,
         device: device,
         device_id: device_id,
         app_version: app_version,
         cookies: Config.new.get_config("", "ru"),
     ){ |response, request, result, &block| response}
     return JSON.parse(response.body)
  end
end

class ApiApp
  def get_server(device, email, locale, password, currency, i_agree, ip, device_id, app_version)
    params = signature({email: email, password:password, currency:currency, i_agree:i_agree, ip:ip})
    api = "https://#{ENV['stage']}binomo.com/api/server/user/create"
    api_server = RestClient.post(api,
        device: device,
        locale:locale,
        email: email,
        password: password,
        signature: params,
        api_key: "425837d44c75414a2a03fc59bac7f001",
        i_agree: i_agree,
        ip: ip,
        currency: currency,
        device_id: device_id,
        app_version: app_version,
        cookies: Config.new.get_config("", "ru")
     ){ |response, request, result, &block| response }
     return JSON.parse(api_server.body)
  end
end
