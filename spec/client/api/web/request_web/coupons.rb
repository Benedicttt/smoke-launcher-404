class CouponsWeb
  def check(locale, device, code)
    api = "https://#{ENV['stage']}binomo.com/api/coupons/check"

    response = RestClient::Request.execute(
      method: :get,
      url: api,
      headers: {
        cookies: Cookies.where(stage: "#{ENV['stage']}").last.cookies_traider.merge(Config.new.get_config("web", "ru")),
        params: {
           locale: locale,
           device: device,
          code: code,
         }
       }
     ) { |response, request, result, &block| response}
     return JSON.parse(response.body)
  end

  def coupons(locale, device, consumer)
    api = "https://#{ENV['stage']}binomo.com/api/coupons"
    cookies = Cookies.where(stage: "#{ENV['stage']}").last.cookies_traider
       response = RestClient::Request.execute(
      method: :get,
      url:api,
      headers: {
        cookies: cookies,
        params: {
           locale: locale,
           device: device,
           consumer: consumer
         }
       }
     ) { |response, request, result, &block| response}
     return JSON.parse(response.body)
  end

  def id(locale, device, id)
    api = "https://#{ENV['stage']}binomo.com/api/coupons/#{id}"
    response = RestClient::Request.execute(
      method: :get,
      url:api,
      headers: {
        cookies: Cookies.where(stage: "#{ENV['stage']}").last.cookies_traider,
        params: {
           locale: locale,
           device: device,
         }
       }
     ) { |response, request, result, &block| response}
     return JSON.parse(response.body)
  end
end
