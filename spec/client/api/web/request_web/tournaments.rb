class Tournaments
  def api(locale, device)
      api = RestClient::Request.execute(
      method: :get,
      url: "https://#{ENV['stage']}binomo.com/api/v2/tournaments",
      headers: {
        params: {
          locale: locale,
          device: device,
          }}) { |response, request, result, &block| response}

      return JSON.parse(api.body)
  end

  def participate(locale, device, password, email, id)
    api_sign_in = "https://#{ENV['stage']}binomo.com/api/sign_in"
    auth = RestClient::Request.execute(
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

    api_participate = "https://#{ENV['stage']}binomo.com/api/v2/tournaments/#{id}/tournament_users"
    api_participate = RestClient::Request.execute(
      method: :post,
      url: api_participate,
      headers: {
        cookies: auth.cookies,
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

  def participants(locale, device, id, password, email)
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

    participants = "https://#{ENV['stage']}binomo.com/api/v2/tournaments/#{id}"
    participants = RestClient::Request.execute(
      method: :get,
      url: participants,
      cookies: response.cookies,
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

  def deals_list(device, deal_type, tournament_id)
    api_deals_create = "https://#{ENV['stage']}binomo.com/api/deals/list"
    deals_tournament_list = RestClient::Request.execute(
      method: :get,
      url: api_deals_create,
      headers: {
        cookies: Cookies.where(stage: "#{ENV['stage']}").last.cookies_traider,
        params: {
          locale: 'ru',
          device: device,
          deal_type: deal_type,
          tournament_id: tournament_id,
          geo: "RU"
      }
      }) { |response, request, result, &block|  response }
    return JSON.parse(deals_tournament_list)
  end

  def show(locale, device, id, password, email)
    api_sign_in = "https://#{ENV['stage']}binomo.com/api/sign_in"
    @response = RestClient::Request.execute(
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

     api = RestClient::Request.execute(
       method: :get,
       url: "https://#{ENV['stage']}binomo.com/api/v2/tournaments/",
        headers: {
          cookies: @response.cookies,
          params: {
           locale: locale, device: device
          }}) { |response, request, result, &block| response}
    return JSON.parse(api.body)
  end
end
