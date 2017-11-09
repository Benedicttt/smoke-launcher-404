require 'rails_helper'

RSpec.describe "Api tournaments success" do
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

         ws          = RequestWsError.new
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

         @expire_at  = (Time.now.to_i / 60).to_i * 60
         @expire_at += Time.now.sec > 10 ? 2.minutes : 1.minutes

         @won =  ws.send_ws(@device, @demo, @asset, @expire_at, @amount, @option_type, @deal_type, @won_deal, @count, @id_max, @stage, @authtoken, @device_id)

  end

  context "params list" do

    it 'dd' do
      it { puts @won}
    end
  end
end
