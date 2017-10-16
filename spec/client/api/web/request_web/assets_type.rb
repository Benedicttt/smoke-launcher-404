class Assets
  def type(device, locale)
    api = "https://#{ENV['stage']}binomo.com/api/assets/types"
    response = RestClient::Request.execute(
      method: :get,
      url:api,
      headers: {
           params: {
           locale: locale,
           device: device
          }
       }
     ) { |response, request, result, &block| response}

   return  JSON.parse(response.body)
  end

end
