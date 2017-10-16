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
            email: Cookies.where(stage: ENV['stage']).last.email,
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
         }){ |response, request, result, &block| response}


  end

  context "params" do

  it {
    ws          = RequestWS.new
    stage       = ENV['stage']

    authtoken   = JSON.parse(@response_auth)['data']['authtoken']
    device_id   = JSON.parse(@response)['data']['device_id']
    #
    ws_params   = WebSocket::Client::Simple.connect "wss://#{ENV['stage'].sub(/[.]/, '')}-ws.binomo.com:8080/?vsn=2.0.0"
    device      = "web"
    demo        = false
    asset       = "GOL/OTC"
    amount      = 100
    option_type = "turbo"
    deal_type   = "real"
    trend       = "put"
    disconnect  = true
    count = 10

    expire_at  = (Time.now.to_i / 60).to_i * 60
    expire_at += Time.now.sec > 15 ? 2.minutes : 1.minutes

    ws.connect_ws(stage, authtoken , device, device_id, ws_params)
    ws.send_ws(ws_params, disconnect, device, demo, asset, expire_at, amount, option_type, deal_type, trend, count)

    }
  end
end
