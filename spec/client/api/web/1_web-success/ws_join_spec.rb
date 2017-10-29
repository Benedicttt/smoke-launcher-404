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
     @id_max = ids[0].compact.max
     puts "#{@id_max}".yellow

     ws          = RequestWS.new
     @stage       = ENV['stage']
     @authtoken   = JSON.parse(@response_auth)['data']['authtoken']
     @device_id   = JSON.parse(@response)['data']['device_id']
     @asset = "GOL/OTC"
     @demo          = false
     @amount        = 100
     @deal_type     = "tournament"
     @trend = "put"
     @count = 1
     @device = "web"
     @option_type = "turbo"

     @expire_at  = (Time.now.to_i / 60).to_i * 60
     @expire_at += Time.now.sec > 10 ? 2.minutes : 1.minutes


    @deals_list =  ws.send_ws(@device, @demo, @asset, @expire_at, @amount, @option_type, @deal_type, @trend, @count, @id_max, @stage, @authtoken, @device_id)
  end

  context "params" do
    it { puts @deals_list['data']['deals'][0]['bet']}
    it { expect(@deals_list['data']['deals'][0]['id']).to be_a Integer }
    it { expect(@deals_list['data']['deals'][0]['asset']).to eq @asset }
    it { expect(@deals_list['data']['deals'][0]['name']).to eq "FOR/HEIGHT" }
    it { expect(@deals_list['data']['deals'][0]['trend']).to eq @trend }

    it { expect(@deals_list['data']['deals'][0]['entrie_rate']).to be_a Float }
    it { expect(@deals_list['data']['deals'][0]['bet'].to_f).to be_a Float }
    it { expect(@deals_list['data']['deals'][0]['bet']).to eq "#{@amount.to_f}" }
    it { expect(@deals_list['data']['deals'][0]['payment']).to be_a Float }
    it { expect(@deals_list['data']['deals'][0]['payment']).to eq "#{@amount + Assets.new.get('web', 'ru')[1][0]}.0".to_f }
    it { expect(@deals_list['data']['deals'][0]['status']).to eq "open"  }
    it { expect(@deals_list['data']['deals'][0]['option_type']).to eq @option_type  }
    it { expect(@deals_list['data']['deals'][0]['payment_rate']).to eq "#{Assets.new.get('web', 'ru')[1][0]}.0}".to_f   }
    it { expect(@deals_list['data']['deals'][0]['demo']).to eq @demo}
    it { expect(@deals_list['data']['deals'][0]['deal_type']).to eq @deal_type}
    it { expect(@deals_list['data']['deals'][0]['tournament_id']).to eq @id_max}
    it { expect(@deals_list['data']['deals'][0]['end_rate']).to eq 0.0}
    it { expect(@deals_list['data']['deals'][0]['win']).to eq 0}
  end
end
