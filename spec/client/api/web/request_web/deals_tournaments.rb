class Deals
  def tournament_create(demo, amount, asset, option_type, trend, source, create_at, expire_at, locale, device, tournament, tournament_id)
      api_deals_create = "https://#{ENV['stage']}binomo.com/api/deals/create"
      deals_real  = RestClient::Request.execute(
      method: :get,
      url: api_deals_create,
      headers: {
        cookies: Cookies.where(stage: "#{ENV['stage']}").last.cookies_traider,
        params: {
          locale: locale,
          amount: amount,
          asset: asset,
          create_at: create_at,
          deal_type: tournament,
          demo: demo,
          device: device,
          expire_at: expire_at,
          option_type: option_type,
          source: source,
          tournament_id: tournament_id.to_i,
          trend: trend,
          trusted: false,

      }}) { |response, request, result, &block| response  }


      sleep 2
      api_deals_create = "https://#{ENV['stage']}binomo.com/api/deals/list"
      deals_real_list = RestClient::Request.execute(
      method: :get,
      url: api_deals_create,
      headers: {
        cookies: Cookies.where(stage: "#{ENV['stage']}").last.cookies_traider,
        params: {
          locale: locale,
          device: device,
          amount: amount,
          asset: asset,
          demo: demo,
          option_type: option_type,
          trend: trend,
          source: source,
          create_at: create_at,
          expire_at: expire_at,
          geo: "RU"
      }}) { |response, request, result, &block|  response }
      return JSON.parse(deals_real.body), JSON.parse(deals_real_list.body)
  end

  def error_tournament_create(demo, amount, asset, option_type, trend, source, create_at, expire_at, locale, device, tournament, tournament_id)
    api_deals_create = "https://#{ENV['stage']}binomo.com/api/deals/create"
    deals_demo  = RestClient::Request.execute(
    method: :get,
    url: api_deals_create,
    headers: {
      cookies: Cookies.where(stage: "#{ENV['stage']}").last.cookies_traider,
      params: {
        locale: locale,
        device: device,
        amount: amount,
        asset: asset,
        demo: demo,
        option_type: option_type,
        trend: trend,
        source: source,
        create_at: create_at,
        expire_at: expire_at,
        deal_type: tournament,
        geo: "RU"
    }}) { |response, request, result, &block|  response }
    return JSON.parse(deals_demo.body)
  end
end
