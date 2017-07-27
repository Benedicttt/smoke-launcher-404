require 'rails_helper'

RSpec.describe "Config success" do
  before(:context) do
    @config = RestClient.get("#{ENV['api_host']}/config", {params: {locale: 'ru', device: 'web', geo: "RU"}})
  end

  context "params" do
    it { expect(@config.code).to eq(200) }
    it { expect(data(@config, 'success')).to eq true }
    it { expect(data(@config, 'errors')).to eq [] }
    it { expect(data(@config, 'data')['authorized']).to eq false }
    it { expect(data(@config, 'data')['device_id'].length).to eq 32}
    it { expect(data(@config, 'data')['device_type']).to eq 'web' }
    it { expect(data(@config, 'data')['currencies']).to include ("USD") }
    it { expect(data(@config, 'data')['currencies']).to include ("EUR") }
    it { expect(data(@config, 'data')['currencies']).to include ("RUB") }
    it { expect(data(@config, 'data')['trade']['summs']).to eq [100,500,1000,2000,5000,10000,20000,100000]}
    it { expect(data(@config, 'data')['default_currency']).to eq 'RUB'}
    it { expect(data(@config, 'data')['show_tutorial']).to eq false}
    it { expect(data(@config, 'data')['ga_tid']).to eq "UA-60335261-1"}
    it { expect(data(@config, 'data')['geo']).to eq 'RU'}
  end
end

RSpec.describe "Config authorized success" do
  before(:context) do
    api_sign_in = "https://#{ENV['stage']}binomo.com/api/sign_in"
    response = RestClient::Request.execute(
      method: :post,
      url: api_sign_in,
      headers: {
        referer: "https://#{ENV['stage']}binomo.com",
        cookies: Cookies.where(stage: "#{ENV['stage']}").last.cookies_traider,
        params:{
            locale: "ru",
            device: "web",
            geo: "RU"
          }
        })
    @config_auth = RestClient.get("#{ENV['api_host']}/config", {params: {locale: 'ru', device: 'web'}, cookies: response.cookies })
  end

  context "params" do
    it { expect(@config_auth.code).to eq(200) }
    it { expect(data(@config_auth, 'success')).to eq true }
    it { expect(data(@config_auth, 'errors')).to eq [] }
    it { expect(data(@config_auth, 'data')['authorized']).to eq true }
    it { expect(data(@config_auth, 'data')['device_id'].length).to eq 32}
    it { expect(data(@config_auth, 'data')['device_type']).to eq 'web' }
    it { expect(data(@config_auth, 'data')['currencies']).to include ("USD") }
    it { expect(data(@config_auth, 'data')['currencies']).to include ("EUR") }
    it { expect(data(@config_auth, 'data')['currencies']).to include ("RUB") }
    it { expect(data(@config_auth, 'data')['trade']['summs']).to eq [100, 500, 1000, 2000, 5000, 10000, 20000, 100000]}
    it { expect(data(@config_auth, 'data')['default_currency']).to eq "RUB"}
    it { expect(data(@config_auth, 'data')['show_tutorial']).to eq false}
    it { expect(data(@config_auth, 'data')['ga_tid']).to eq "UA-60335261-1"}
    it { expect(data(@config_auth, 'data')['geo']).to eq 'RU'}
  end
end
