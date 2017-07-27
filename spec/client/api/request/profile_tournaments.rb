class Tournaments
  def get(device, locale, password, email)
   get = "https://#{ENV['stage']}binomo.com/api/profile/tournaments"
   response = RestClient::Request.execute(
     method: :get,
     url: get,
     headers: {
       cookies: Cookies.where(stage: "#{ENV['stage']}").last.cookies_traider,
       referer: "https://#{ENV['stage']}binomo.com",
       params:{
           locale: locale,
           device: device,
           password: password,
           email: email,
           geo: "RU"
         }
       }
      ) { |response, request, result, &block| response}
    return JSON.parse(response.body)
  end

  def list(device, locale, password, email)
   list = "https://#{ENV['stage']}binomo.com/api/v2/tournaments"
   response = RestClient::Request.execute(
     method: :get,
     url: list,
     headers: {
       cookies: Cookies.where(stage: "#{ENV['stage']}").last.cookies_traider,
       referer: "https://#{ENV['stage']}binomo.com",
       params:{
           locale: locale,
           device: device,
           password: password,
           email: email,
           geo: "RU"
         }
       }
      ) { |response, request, result, &block| response}
    return JSON.parse(response.body)
  end
end
