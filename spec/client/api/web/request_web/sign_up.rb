class Reg
  def post_sign_up(device, locale, password, i_agree, email, cookies)
    api_sign_up = "https://#{ENV['stage']}binomo.com/api/sign_up"
    response = RestClient::Request.execute(
      method: :post,
      url: api_sign_up,
      headers: {
        cookies: Config.new.get_config("web", "ru"),
        referer: "https://#{ENV['stage']}binomo.com",
        params: {
          locale: locale,
          device: device,
          password: password,
          i_agree: i_agree,
          email: email,
          currency: "USD",
          geo: "RU",
          country: "RU"
        }
      }
       ) { |response, request, result, &block| response }

     Cookies.create(email: "#{JSON.parse(response)['data']['email']}",
                    id: "#{JSON.parse(response)['data']['id']}",
                    cookies_traider: response.cookies,
                    stage: ENV['stage'].to_s,
                    authtoken: JSON.parse(response.body)['data']['authtoken']).to_json if cookies == true

     return JSON.parse(response.body), response.cookies
  end

  def post_sign_up_v2(device, locale, password, i_agree, email)
    api_sign_up_v2 = "https://#{ENV['stage']}binomo.com/api/v2/sign_up"
    response = RestClient::Request.execute(
      method: :post,
      url: api_sign_up_v2,
      headers: {
        params: {
          locale: locale,
          device: device,
          password: password,
          i_agree: i_agree,
          email: email,
          currency: "USD",
          geo: "RU",
          country: "RU"
        }
      }
       ) { |response, request, result, &block|  response }
    return JSON.parse(response.body), response.cookies
  end

  def self.post_sign_up_offer
    api_conf_up = "https://#{ENV['stage']}binomo.com/api/config?geo=RU"
    config_offer = RestClient.get(api_conf_up, params: { locale: "ru", device: "web" })

    api_sign_up_offer = "https://#{ENV['stage']}binomo.com/api/v2/sign_up"
    response = RestClient::Request.execute(
      method: :post,
      url: api_sign_up_offer,
      cookies: config_offer.cookies.merge(ot: "5000", os: "getcourse"),
      headers: {
        referer: "https://#{ENV['stage']}binomo.com",
        params:{
          locale: "ru",
          device: "web",
          i_agree: true,
          password: 'Jemetr!@#()11Capybara123',
          currency: "USD",
          email: "sign_up_offer." + SecureRandom.hex(6) + "@yopmail.com",
          geo: "RU",
          country: "RU"
        }}) { |response, request, result, &block| response }
    return JSON.parse(response.body), response.cookies
  end
end
