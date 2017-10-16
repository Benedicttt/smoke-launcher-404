require 'rails_helper'

RSpec.describe "Profile success" do
  before(:context) do
    @profile_edit = Profile.new.edit_welcome("web", "ru", "RU", 23431, "Change First", "Change last", "Selenium", true, "up_sign.#{SecureRandom.hex(8)}@yopmail.com",
                                             "+79812323232", false, false, false, "1991-02-04", true )
  end

  after(:context) do
    @profile_rechange = Profile.new.edit_welcome("web", "ru", "RU", 23431, "Change First", "Change last", "Selenium", true, "sign_up.#{SecureRandom.hex(8)}@yopmail.com",
                                                 "+79810000000", true, true, true, "1970-01-01", false )
   Cookies.find(@profile_rechange['data']['id']).update(email: @profile_rechange['data']['email'])
  end

  context "Change params edit" do
      it { expect(@profile_edit['success']).to eq true }
      it { expect(@profile_edit['errors']).to eq [] }
      it { expect(@profile_edit['data']['id']).to be_a(Integer) }
      it { expect(@profile_edit['data']['avatar']).to eq nil }
      it { expect(@profile_edit['data']['first_name']).to eq "Change First" }
      it { expect(@profile_edit['data']['last_name']).to eq "Change Last" }
      it { expect(@profile_edit['data']['nickname']).to eq "Selenium" }
      it { expect(@profile_edit['data']['balance']).to eq 0 }
      it { expect(@profile_edit['data']['balance_version']).to eq 0 }
      it { expect(@profile_edit['data']['demo_balance']).to eq 100000 }
      it { expect(@profile_edit['data']['demo_balance_version']).to eq 0 }
      it { expect(@profile_edit['data']['bonus']).to eq 0 }
      it { expect(@profile_edit['data']['gender']).to eq false }
      it { expect(@profile_edit['data']['email']).to be_a String }
      it { expect(@profile_edit['data']['email_verified']).to eq false }
      it { expect(@profile_edit['data']['phone']).to eq "+79812323232" }
      it { expect(@profile_edit['data']['phone_verified']).to eq false }
      it { expect(@profile_edit['data']['phone_prefix']).to eq "7" }
      it { expect(@profile_edit['data']['receive_news']).to eq false }
      it { expect(@profile_edit['data']['receive_sms']).to eq false }
      it { expect(@profile_edit['data']['receive_notification']).to eq false }
      it { expect(@profile_edit['data']['country']).to eq "RU" }
      it { expect(@profile_edit['data']['country_name']).to eq "Российская Федерация" }
      it { expect(@profile_edit['data']['city']).to eq nil }
      it { expect(@profile_edit['data']['city_name']).to eq nil }
      it { expect(@profile_edit['data']['currency']).to eq "USD" }
      it { expect(@profile_edit['data']['birthday']).to eq "1991-02-04" }
      it { expect(@profile_edit['data']['activate']).to eq true }
      it { expect(@profile_edit['data']['password_is_set']).to eq true}
      it { expect(@profile_edit['data']['tutorial']).to eq false}
      it { expect(@profile_edit['data']['coupons']).to eq [] }
      it { expect(@profile_edit['data']['free_deals']).to eq nil }
      it { expect(@profile_edit['data']['blocked']).to eq false }
      it { expect(@profile_edit['data']['demo']).to eq true}
      it { expect(@profile_edit['data']['single_thread_trade']).to eq true}
      it { expect(@profile_edit['data']['first_account']).to eq "demo" }
      it { expect(@profile_edit['data']['agree_risk']).to eq false}
      it { expect(@profile_edit['data']['hotkeys_enabled']).to eq false }
      it { expect(@profile_edit['data']['status_group']).to eq "free" }
      it { expect(@profile_edit['data']['docs_verified']).to eq false }
      it { expect(@profile_edit['data']['last_deposit']).to eq 0 }
  end
end
