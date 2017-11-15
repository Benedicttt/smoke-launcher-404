require 'rails_helper'

RSpec.describe "Registration success" do
  before(:all) do
    @registration = RegApp.new.post_sign_up("ios", "ru", "123456q", true, "sign_up_ios.#{SecureRandom.hex(8)}@yopmail.com", true, $uuid, "1.0")[0]
  end

  context "params" do
    it { expect(@registration["success"]).to eq true }
    it { expect(@registration["errors"]).to eq [] }
    it { expect(@registration['data']['authtoken'].length).to eq 32 }
    it { expect(@registration['data']['balance']).to eq 0 }
    it { expect(@registration['data']['bonus']).to eq 0 }
    it { expect(@registration['data']['avatar']).to eq nil }
    it { expect(@registration['data']['first_name']).to eq "" }
    it { expect(@registration['data']['last_name']).to eq "" }
    it { expect(@registration['data']['nickname']).to eq "" }
    it { expect(@registration['data']['balance_version']).to eq 0 }
    it { expect(@registration['data']['demo_balance']) <=> 100000 }
    it { expect(@registration['data']['demo_balance_version']).to eq 0 }
    it { expect(@registration['data']['gender']).to eq true }
    it { expect(@registration['data']['email_verified']).to eq false }
    it { expect(@registration['data']['phone']).to eq nil }
    it { expect(@registration['data']['phone_verified']).to eq false }
    it { expect(@registration['data']['phone_prefix']).to eq "7" }
    it { expect(@registration['data']['receive_news']).to eq true }
    it { expect(@registration['data']['receive_sms']).to eq false }
    it { expect(@registration['data']['receive_notification']).to eq true }
    it { expect(@registration['data']['country']).to eq 'RU' }
    it { expect(@registration['data']['country_name']).to eq 'Российская Федерация' }
    it { expect(@registration['data']['city']).to eq nil }
    it { expect(@registration['data']['city_name']).to eq nil }
    it { expect(@registration['data']['currency']).to eq 'USD' }
    it { expect(@registration['data']['birthday']).to eq "1970-01-01" }
    it { expect(@registration['data']['activate']).to eq true }
    it { expect(@registration['data']['password_is_set']).to eq true }
    it { expect(@registration['data']['tutorial']).to eq false }
    it { expect(@registration['data']['coupons']).to eq [] }
    it { expect(@registration['data']['free_deals']).to eq nil }
    it { expect(@registration['data']['blocked']).to eq false }
    it { expect(@registration['data']['demo']).to eq true }
    it { expect(@registration['data']['single_thread_trade']).to eq false }
    it { expect(@registration['data']['first_account']).to eq "demo" }
    it { expect(@registration['data']['agree_risk']).to eq false }
    it { expect(@registration['data']['hotkeys_enabled']).to eq false }
    it { expect(@registration['data']['status_group']).to eq 'free' }
    it { expect(@registration['data']['docs_verified']).to eq false }
  end
end

RSpec.describe "Authorized success" do
  before(:all) do
    @authorized = SignInApp.new.get_auth("ios", "ru", "123456q", "#{Cookies.where(stage: "#{ENV['stage']}").last.email}", $uuid, "1.0")
  end

  context "params" do
    it { expect(@authorized['success']).to eq true }
    it { expect(@authorized['data']['authtoken'].length).to eq 32 }
    it { expect(@authorized['data']['url']).to eq nil }
    it { expect(@authorized['errors']).to eq [] }
  end
end

RSpec.describe "Config authorized success" do
  before(:context) do
    @config_auth = ConfigApp.new.get_config("ios", "ru", $uuid, "2", "#{Cookies.where(stage: ENV['stage']).last.authtoken}")
  end

  context "params" do
    it { expect(@config_auth.code).to eq(200) }
    it { expect(data(@config_auth, 'success')).to eq true }
    it { expect(data(@config_auth, 'errors')).to eq [] }
    it { expect(data(@config_auth, 'data')['authorized']).to eq true }
    it { expect(data(@config_auth, 'data')['device_id'].length).to eq 36 }
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
    # it { expect(data(@config, 'data')['currencies']['list'][0]).to include currency_usd }
    # it { expect(data(@config, 'data')['currencies']['list'][1]).to include currency_eur }
    # it { expect(data(@config, 'data')['currencies']['list'][2]).to include currency_cny }
    # it { expect(data(@config, 'data')['currencies']['list'][3]).to include currency_inr }
    # it { expect(data(@config, 'data')['currencies']['list'][4]).to include currency_try }
    # it { expect(data(@config, 'data')['currencies']['list'][5]).to include currency_rub }
    # it { expect(data(@config, 'data')['currencies']['list'][6]).to include currency_uah }
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
