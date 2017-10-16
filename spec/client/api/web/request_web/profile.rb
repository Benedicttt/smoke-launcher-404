class ProfileAuth
  def get_app(device, locale)
   api_sign_in = "https://#{ENV['stage']}binomo.com/api/sign_in"
   response = RestClient::Request.execute(
     method: :post,
     url: api_sign_in,
       headers: {
         cookies: Cookies.where(stage: "#{ENV['stage']}").last.cookies_traider,
         referer: "https://#{ENV['stage']}binomo.com",
         params:{
             locale: 'ru',
             device: 'web',
             geo: "RU"

     }})

    url_profile= "https://#{ENV['stage']}binomo.com/api/profile"
    profile = RestClient::Request.execute(
        method: :get,
        url: url_profile,
        headers: {
          cookies: response.cookies,
          referer: "https://#{ENV['stage']}binomo.com",
          params:{
            locale: locale,
            device: device,
            geo: "RU"

      }}) { |response, request, result, &block| response}
    return JSON.parse(profile.body)
  end

  def get_web(device, locale)
   api_sign_in = "https://#{ENV['stage']}binomo.com/api/sign_in"
   response = RestClient::Request.execute(
     method: :post,
     url: api_sign_in,
       headers: {
         cookies: Cookies.where(stage: "#{ENV['stage']}").last.cookies_traider,
         referer: "https://#{ENV['stage']}binomo.com",
         params:{
             locale: 'ru',
             device: 'web',
             geo: "RU"
           }
     })

    url_profile= "https://#{ENV['stage']}binomo.com/api/profile"
    profile = RestClient::Request.execute(
        method: :get,
        url: url_profile,
        headers: {
          cookies: response.cookies,
          referer: "https://#{ENV['stage']}binomo.com",
          params:{
            locale: locale,
            device: device,
            geo: "RU",

      }}) { |response, request, result, &block| response}
    return JSON.parse(profile.body)
  end
end
