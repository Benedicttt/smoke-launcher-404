require 'rails_helper'

RSpec.describe "Profile success" do
  before(:all) do
    @profile = ProfileAuth.new.get_web("web", "ru")
  end

  context "params" do
    it { expect(@profile['success']).to eq true }
    it { expect(@profile['errors']).to eq [] }
    it { expect(@profile['data']['avatar']).to eq nil }
    it { expect(@profile['data']['first_name']).to eq "Change First" }
    it { expect(@profile['data']['last_name']).to eq "Change Last" }
    it { expect(@profile['data']['nickname']).to eq "Selenium" }
    it { expect(@profile['data']['balance']).to eq 0 }
    it { expect(@profile['data']['balance_version']).to eq 0 }
    it { expect(@profile['data']['demo_balance']).to eq 100000 }
    it { expect(@profile['data']['demo_balance_version']).to eq 0 }
    it { expect(@profile['data']['bonus']).to eq 0 }
    it { expect(@profile['data']['gender']).to eq false }
    it { expect(@profile['data']['email_verified']).to eq false }
    it { expect(@profile['data']['phone']).to eq "+79810000000" }
    it { expect(@profile['data']['phone_verified']).to eq false }
    it { expect(@profile['data']['phone_prefix']).to eq "7" }
    it { expect(@profile['data']['receive_news']).to eq true }
    it { expect(@profile['data']['receive_sms']).to eq true }
    it { expect(@profile['data']['receive_notification']).to eq true }
    it { expect(@profile['data']['country']).to eq 'RU' }
    it { expect(@profile['data']['country_name']).to eq 'Российская Федерация' }
    it { expect(@profile['data']['city']).to eq nil }
    it { expect(@profile['data']['city_name']).to eq nil }
    it { expect(@profile['data']['currency']).to eq 'USD' }
    it { expect(@profile['data']['birthday']).to eq "1970-01-01" }
    it { expect(@profile['data']['activate']).to eq true }
    it { expect(@profile['data']['password_is_set']).to eq true }
    it { expect(@profile['data']['tutorial']).to eq false }
    it { expect(@profile['data']['coupons']).to eq [] }
    it { expect(@profile['data']['free_deals']).to eq nil }
    it { expect(@profile['data']['demo']).to eq true }
    it { expect(@profile['data']['single_thread_trade']).to eq false }
    it { expect(@profile['data']['first_account']).to eq "demo" }
    it { expect(@profile['data']['blocked']).to eq false }
    it { expect(@profile['data']['agree_risk']).to eq false }
    it { expect(@profile['data']['hotkeys_enabled']).to eq false }
    it { expect(@profile['data']['status_group']).to eq 'free' }
    it { expect(@profile['data']['docs_verified']).to eq false }
  end
end
