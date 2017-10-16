class DealsApp
  def real_create(demo, amount, asset, option_type, trend, source, create_at, expire_at, locale, device, user_balance, device_id, app_version, authtoken)

    api_agree_risk = "https://#{ENV['stage']}binomo.com/api/profile/agree_risk"
    activate = RestClient::Request.execute(
      method: :get,
      url: api_agree_risk,
      headers: {

        params: {
          locale: locale,
          device: device,
          demo: false,
          geo: "RU",
          device_id: device_id,
          app_version: app_version,
          authtoken: authtoken

      }}) { |response, request, result, &block|  response }

      if user_balance == true
        id = Cookies.where(stage: ENV['stage']).last.id
        Runner.call("User.find(#{id.to_s}).update(balance: \"10000\", email_verified: true)")
      end

      api_deals_create = "https://#{ENV['stage']}binomo.com/api/deals/create"
      deals_real  = RestClient::Request.execute(
      method: :get,
      url: api_deals_create,
      headers: {
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
          geo: "RU",
          device_id: device_id,
          app_version: app_version,
          authtoken: authtoken

      }}) { |response, request, result, &block|  response }

      sleep 2
      api_deals_create = "https://#{ENV['stage']}binomo.com/api/deals/list"
      deals_real_list = RestClient::Request.execute(
      method: :get,
      url: api_deals_create,
      headers: {
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
          geo: "RU",
          device_id: device_id,
          app_version: app_version,
          authtoken: authtoken

      }}) { |response, request, result, &block|  response }
      return JSON.parse(deals_real.body), JSON.parse(deals_real_list.body)
  end

  def error_real_create(demo, amount, asset, option_type, trend, source, create_at, expire_at, locale, device, device_id, app_version, authtoken)
    api_deals_create = "https://#{ENV['stage']}binomo.com/api/deals/create"
    deals_demo  = RestClient::Request.execute(
    method: :get,
    url: api_deals_create,
    headers: {
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
        geo: "RU",
        device_id: device_id,
        app_version: app_version,
        authtoken: authtoken

    }}) { |response, request, result, &block|  response }
    return JSON.parse(deals_demo.body)
  end
end
