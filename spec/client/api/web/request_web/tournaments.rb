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

  def list
  end
  def profile
  end
  def participants
  end
  def participate
  end
end
