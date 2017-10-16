class DealsApp
  def list_close_demo(device, locale, device_id, app_version, authtoken)
    sleep 2
    api_deals_create = "https://#{ENV['stage']}binomo.com/api/deals/list"
    deals_demo_list = RestClient::Request.execute(
    method: :get,
    url: api_deals_create,
    headers: {

      params: {
        locale: locale,
        device: device,
        geo: "RU",
        device_id: device_id,
        app_version: app_version,
        authtoken: authtoken

    }}) { |response, request, result, &block|  response }
    return JSON.parse(deals_demo_list.body), JSON.parse(deals_demo_list.body)
  end
end
