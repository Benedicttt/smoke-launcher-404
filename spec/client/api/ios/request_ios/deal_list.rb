class DealsApp
  def list_status_open(device, locale, password, i_agree, email, demo, amount, asset, option_type, trend, source, create_at, expire_at, device_id, app_version, authtoken)
    api_profile_edit = "https://#{ENV['stage']}binomo.com/api/profile/edit"
    welcome = RestClient::Request.execute(
      method: :get,
      url: api_profile_edit,
      headers: {

        params: {
          locale: locale,
          device: device,
          email: email,
          first_name: "rspec",
          last_name: "rspec",
          demo: false,
          geo: "RU",
          device_id: device_id,
          app_version: app_version,
          authtoken: authtoken

      }}) { |response, request, result, &block|  response }

    api_agree_risk = "https://#{ENV['stage']}binomo.com/api/profile/agree_risk"
    agree_risk = RestClient::Request.execute(
      method: :get,
      url: api_agree_risk,
      headers: {

        params: {
          locale: locale,
          device: device,
          geo: "RU",
          device_id: device_id,
          app_version: app_version,
          authtoken: authtoken

      }}) { |response, request, result, &block|  response }

        if ENV['stage'] == "s1."
          system "ssh binomo@#{ENV['stage'].sub(/[.]/, '')}-crm.binomo.com \"cd ~/binomo.com/current/crm.binomo.com/ && RAILS_ENV=staging ~/.rvm/bin/rvm ruby-2.4.0@binomo do bundle exec rails r -e staging 'User.find('#{Cookies.where(stage: ENV['stage']).last.id}').update(balance: \"10000\", email_verified: true)'\""
        else
          system "ssh binomo@#{ENV['stage'].sub(/[.]/, '')}-crm.binomo.com \"cd ~/binomo.com/current/crm.binomo.com/ && RAILS_ENV=staging#{ENV['stage'].sub(/[.]/, '').sub(/s/, '')} ~/.rvm/bin/rvm ruby-2.4.0@binomo do bundle exec rails r -e staging#{ENV['stage'].sub(/[.]/, '').sub(/s/, '')} 'User.find('#{Cookies.where(stage: ENV['stage']).last.id}').update(balance: \"10000\", email_verified: true)'\""
        end

      api_deals_create = "https://#{ENV['stage']}binomo.com/api/deals/create"
      deal_create = RestClient::Request.execute(
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


      api_deals = "https://#{ENV['stage']}binomo.com/api/deals"
      list = RestClient::Request.execute(
      method: :get,
      url: api_deals,
      headers: {
        cookies: sign_up.cookies,
        params: {
          locale: locale,
          device: device,
          geo: "RU",
          device_id: device_id,
          app_version: app_version,
          authtoken: authtoken

      }}) { |response, request, result, &block|  response }
    return JSON.parse(list.body)
  end

  def list_status_close(device, locale, password, i_agree, email, demo, amount, asset, option_type, trend, source, create_at, expire_at, device_id, app_version, authtoken)
    api_sign_up = "https://#{ENV['stage']}binomo.com/api/sign_up"
    sign_up = RestClient::Request.execute(
      method: :post,
      url: api_sign_up,
      headers: {
        params: {
          locale: locale,
          device: device,
          password: password,
          i_agree: i_agree,
          email: email,
          currency: "USD",
          geo: "RU",
          device_id: device_id,
          app_version: app_version,
          authtoken: authtoken

    }}) { |response, request, result, &block| response }

    api_profile_edit = "https://#{ENV['stage']}binomo.com/api/profile/edit"
    welcome = RestClient::Request.execute(
      method: :get,
      url: api_profile_edit,
      headers: {

        params: {
          locale: locale,
          device: device,
          email: email,
          first_name: "rspec",
          last_name: "rspec",
          demo: false,
          geo: "RU",
          device_id: device_id,
          app_version: app_version,
          authtoken: authtoken

      }}) { |response, request, result, &block|  response }

    api_agree_risk = "https://#{ENV['stage']}binomo.com/api/profile/agree_risk"
    agree_risk = RestClient::Request.execute(
      method: :get,
      url: api_agree_risk,
      headers: {

        params: {
          locale: locale,
          device: device,
          geo: "RU",
          device_id: device_id,
          app_version: app_version,
          authtoken: authtoken

      }}) { |response, request, result, &block|  response }

      system "ssh binomo@#{ENV['stage'].sub(/[.]/, '')}-crm.binomo.com \"cd ~/binomo.com/current/crm.binomo.com/ && RAILS_ENV=staging#{ENV['stage'].sub(/[.]/, '').sub(/s/, '')} ~/.rvm/bin/rvm ruby-2.4.0@binomo do bundle exec rails r -e staging#{ENV['stage'].sub(/[.]/, '').sub(/s/, '')} 'User.find('#{Cookies.where(stage: ENV['stage']).last.id}').update(balance: \"100000\", email_verified: true)'\""

      api_deals_create = "https://#{ENV['stage']}binomo.com/api/deals/create"
      deal_create = RestClient::Request.execute(
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

      api_deals = "https://#{ENV['stage']}binomo.com/api/deals"
      list = RestClient::Request.execute(
      method: :get,
      url: api_deals,
      headers: {

        params: {
          locale: locale,
          device: device,
          geo: "RU",
          device_id: device_id,
          app_version: app_version,
          authtoken: authtoken

      }}) { |response, request, result, &block|  response }
    return JSON.parse(list.body)
  end
end
