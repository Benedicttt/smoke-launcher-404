require 'rails_helper'

RSpec.describe "Config success" do
  before(:context) do
    @config = RestClient.get("#{ENV['api_host']}/config", {params: {locale: 'ru', device: 'web', geo: "AF"}})
  end


  context "params" do
    it { expect(@config.code).to eq(200) }
    it { expect(data(@config, 'success')).to eq true }
    it { expect(data(@config, 'errors')).to eq [] }
    it { expect(data(@config, 'data')['authorized']).to eq false }
    it { expect(data(@config, 'data')['device_id']).to eq nil}
    it { expect(data(@config, 'data')['device_type']).to eq 'web' }

    # it { expect(list_currency("USD").compact).to be_in [currency_usd, currency_usd_nil] }
    # it { expect(list_currency("EUR").compact).to be_in [currency_eur, currency_eur_nil] }
    # it { expect(list_currency("CNY").compact).to be_in [currency_cny, currency_cny_nil] }
    # it { expect(list_currency("INR").compact).to be_in [currency_inr, currency_inr_nil] }
    # it { expect(list_currency("TRY").compact).to be_in [currency_try, currency_try_nil] }
    # it { expect(list_currency("RUB").compact).to be_in [currency_rub, currency_rub_nil] }
    # it { expect(list_currency("UAH").compact).to be_in [currency_uah, currency_uah_nil] }

    it { expect(data(@config, 'data')['currencies']['default']).to eq 'RUB'}
    it { expect(data(@config, 'data')['show_tutorial']).to eq false}
    it { expect(data(@config, 'data')['ga_tid']).to eq "UA-60335261-1"}
    it { expect(data(@config, 'data')['geo']).to eq 'AF'}
    it { expect(data(@config, 'data')['ga_uid']).to eq nil }
    it { expect(data(@config, 'data')['moengage_sign']).to eq nil }
    it { expect(data(@config, 'data')['captcha_sign_up']).to eq false }
    it { expect(data(@config, 'data')['captcha_sign_in']).to eq false }
  end
end

RSpec.describe "Config authorized success" do
  before(:context) do
    api_sign_in = "https://#{ENV['stage']}binomo.com/api/sign_in"
    @response = RestClient::Request.execute(
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
    @config_auth = RestClient.get("#{ENV['api_host']}/config", {params: {locale: 'ru', device: 'web', geo: "RU"}, cookies: @response.cookies })
  end

  context "params" do
    it { expect(data(@config_auth, 'success')).to eq true }
    it { expect(data(@config_auth, 'errors')).to eq [] }
    it { expect(data(@config_auth, 'data')['authorized']).to eq true }
    it { expect(data(@config_auth, 'data')['device_id'].length).to eq 32}
    it { expect(data(@config_auth, 'data')['device_type']).to eq 'web' }
    it { expect(data(@config_auth, 'data')['currencies']['list'][0]).to include currency_usd_auth }
    it { expect(data(@config_auth, 'data')['currencies']['default']).to eq 'RUB'}
    it { expect(data(@config_auth, 'data')['currencies']['current']).to eq 'USD'}
    it { expect(data(@config_auth, 'data')['show_tutorial']).to eq false}
    it { expect(data(@config_auth, 'data')['ga_tid']).to eq "UA-60335261-1"}
    it { expect(data(@config_auth, 'data')['geo']).to eq 'RU'}
    it { expect(data(@config_auth, 'data')['captcha_sign_up']).to eq false }
    it { expect(data(@config_auth, 'data')['captcha_sign_in']).to eq false }
  end
end
