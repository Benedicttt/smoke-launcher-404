class TimeApi
  def get(device, locale)
    api_sign_in = "https://#{ENV['stage']}binomo.com/api/time"
    response = RestClient::Request.execute(
      method: :get,
      url: api_sign_in,
        headers: {
          cookies: Config.new.get_config("web", "ru"),
          referer: "https://#{ENV['stage']}binomo.com",
          params:{
            locale: locale,
            device: device,
      }}) { |response, request, result, &block| response}
    return JSON.parse(response.body)
  end
end
