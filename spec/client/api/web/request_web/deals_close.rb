class Deals
  def list_close_demo(device, locale)
    sleep 2
    api_deals_create = "https://#{ENV['stage']}binomo.com/api/deals/list"
    deals_demo_list = RestClient::Request.execute(
    method: :get,
    url: api_deals_create,
    headers: {
      cookies: Cookies.where(stage: "#{ENV['stage']}").last.cookies_traider,
      params: {
        locale: locale,
        device: device,
        geo: "RU"
    }}) { |response, request, result, &block|  response }
    return JSON.parse(deals_demo_list.body), JSON.parse(deals_demo_list.body)
  end
end
