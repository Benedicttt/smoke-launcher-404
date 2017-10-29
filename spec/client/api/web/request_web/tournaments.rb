class Tournaments
  def last_demo
  end
  def api(locale, device)
     api = RestClient::Request.execute(
       method: :get,
       url: "https://#{ENV['stage']}binomo.com/api/v2/tournaments",
        headers: {
          params: {
            locale: locale, device: device
            }}) { |response, request, result, &block| response}
            return JSON.parse(api.body)
  end

  def show(locale, device, id)
     api = RestClient::Request.execute(
       method: :get,
       url: "https://#{ENV['stage']}binomo.com/api/v2/tournaments/#{id}",
        headers: {
          params: {
           locale: locale, device: device
          }}) { |response, request, result, &block| response}


    return JSON.parse(api.body)
  end


  def participants(locale, device, id)
    participants = "https://#{ENV['stage']}binomo.com/api/v2/tournaments/#{id}/participants"
    participants = RestClient::Request.execute(
      method: :get,
      url: participants,
      headers: {
        referer: "https://#{ENV['stage']}binomo.com",
        params:{
            locale: locale,
            device: device,
            geo: "RU"
          }
        }
       ) { |response, request, result, &block| response }

     return JSON.parse(participants.body)
  end

  def participate(locale, device, password, email, id)

    api_sign_in = "https://#{ENV['stage']}binomo.com/api/sign_in"
    response = RestClient::Request.execute(
      method: :post,
      url: api_sign_in,
      headers: {
        cookies: Config.new.get_config("web", "ru"),
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

    api_participate = "https://#{ENV['stage']}binomo.com/api/v2/tournaments/#{id}/participate"
    api_participate = RestClient::Request.execute(
      method: :post,
      url: api_participate,
      headers: {
        cookies: response.cookies,
        referer: "https://#{ENV['stage']}binomo.com",
        params:{
            locale: locale,
            device: device,
            geo: "RU"
          }
        }
       ) { |response, request, result, &block| response}
     return JSON.parse(api_participate.body)
  end
end
