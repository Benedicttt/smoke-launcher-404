require 'rails_helper'

RSpec.describe "Config success" do
  before(:context) do
    @config = ConfigApp.new.get_ios("ios", "ru", "RU", $uuid, "1.0")
  end

  context "params" do
    it { expect(@config.code).to eq(200) }
    it { expect(data(@config, 'success')).to eq true }
    it { expect(data(@config, 'errors')).to eq [] }
    it { expect(data(@config, 'data')['authorized']).to eq false }
    it { expect(data(@config, 'data')['device_id']).to eq $uuid }
    it { expect(data(@config, 'data')['device_type']).to eq 'ios' }
    it { expect(data(@config, 'data')['currencies']['list'][0]).to include currency_usd }
    it { expect(data(@config, 'data')['currencies']['list'][1]).to include currency_eur }
    it { expect(data(@config, 'data')['currencies']['list'][2]).to include currency_cny }
    it { expect(data(@config, 'data')['currencies']['list'][3]).to include currency_inr }
    it { expect(data(@config, 'data')['currencies']['list'][4]).to include currency_try }
    it { expect(data(@config, 'data')['currencies']['list'][5]).to include currency_rub }
    it { expect(data(@config, 'data')['currencies']['list'][6]).to include currency_uah }
    it { expect(data(@config, 'data')['currencies']['default']).to eq 'RUB'}
    it { expect(data(@config, 'data')['show_tutorial']).to eq false}
    it { expect(data(@config, 'data')['ga_tid']).to eq "UA-60335261-1"}
    it { expect(data(@config, 'data')['geo']).to eq 'RU'}
    it { expect(data(@config, 'data')['ga_uid']).to eq nil }
    it { expect(data(@config, 'data')['moengage_sign']).to eq nil }
    it { expect(data(@config, 'data')['captcha_sign_up']).to eq false }
    it { expect(data(@config, 'data')['captcha_sign_in']).to eq false }
  end
end

RSpec.describe "Config authorized success" do
  before(:context) do
    @config_auth = ConfigApp.new.get_config("ios", "ru", $uuid, "1.0", Cookies.where(stage: ENV['stage']).last.authtoken)
  end

  context "params" do
    it { expect(@config_auth.code).to eq(200) }
    it { expect(data(@config_auth, 'success')).to eq true }
    it { expect(data(@config_auth, 'errors')).to eq [] }
    it { expect(data(@config_auth, 'data')['authorized']).to eq true }
    it { expect(data(@config_auth, 'data')['device_id'].length).to eq 32}
    it { expect(data(@config_auth, 'data')['device_type']).to eq 'ios' }
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
