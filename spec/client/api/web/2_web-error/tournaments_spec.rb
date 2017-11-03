require 'rails_helper'

RSpec.describe "join session" do
  before(:context) do
    api_sign_in = "https://#{ENV['stage']}binomo.com/api/sign_in"
    @response_auth = RestClient::Request.execute(
      method: :post,
      url: api_sign_in,
      headers: {
        referer: "https://#{ENV['stage']}binomo.com",
        content_type: 'text/plain',
        params:{
          email: Cookies.where(stage: "#{ENV['stage']}").last.email,
          password: "12345q",
          locale: "ru",
          device: "web",
          geo: "RU"
        }
      })

      api_conf_up = "https://#{ENV['stage']}binomo.com/api/config"
      @response = RestClient.get(
        api_conf_up,
        cookies: @response_auth.cookies,
         params: {
           locale: 'ru',
           device: 'web'
       }) { |response, request, result, &block| response }

     @tournaments = Tournaments.new.api("ru", "web")
     ids = []
     ids << @tournaments['data'].map { |key, value| key['id'] if key['timeline_status'] ==  "actual" }

     print "#{@id_max - 1}".yellow

     ws          = RequestWS.new
     @stage       = ENV['stage']
     @authtoken   = JSON.parse(@response_auth)['data']['authtoken']
     @device_id   = JSON.parse(@response)['data']['device_id']
     @asset = "GOL/OTC"
     @demo          = false
     @amount        = 100
     @deal_type     = "tournament"
     @won_deal = "put"
     @lose_deal = "call"
     @count = 1
     @device = "web"
     @option_type = "turbo"
     @id_max = ids[0].compact.max - 1

     @expire_at  = (Time.now.to_i / 60).to_i * 60
     @expire_at += Time.now.sec > 10 ? 2.minutes : 1.minutes

     @won =  ws.send_ws(@device, @demo, @asset, @expire_at, @amount, @option_type, @deal_type, @won_deal, @count, @id_max, @stage, @authtoken, @device_id)
    #  @lose =  ws.send_ws(@device, @demo, @asset, @expire_at, @amount, @option_type, @deal_type, @lose_deal, @count, @id_max, @stage, @authtoken, @device_id)


    #  puts "#{@msg_ws_deal}".red
  end

  context "check error ws" do
    it { puts @won }
  end
end
