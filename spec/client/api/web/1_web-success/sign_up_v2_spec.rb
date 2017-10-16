require 'rails_helper'

RSpec.describe "Registration v2 success" do
  before(:all) do
     @registration = Reg.new.post_sign_up_v2("web", "ru", "12345q", true, "sign_up_v2.#{SecureRandom.hex(8)}@yopmail.com")[0]
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
