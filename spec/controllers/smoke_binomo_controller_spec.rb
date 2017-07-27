require 'rails_helper'

RSpec.describe Binomo::SmokeBinomoController, type: :controller do
  before(:each) do
    @binomo_control = Homepage::ApiRequestController.new
  end

  it "has a 200 status code" do
    expect(@binomo_control.currency).to match(["RUB", "EUR", "USD"])
  end

  it '' do
    expect(@binomo_control.stage_select).to match({"s1"=>"Stage1", "s2"=>"Stage2", "s3"=>"Stage3", "s4"=>"Stage4", "prod"=>"Production"})
  end
  it '' do
    expect(@binomo_control.drv).to match(["chrome", "webkit", "firefox", "safari"])
  end
  it '' do
    expect(@binomo_control.locale).to match(["RU","EN","ID","MS","ES","TH","VN","CN","PT","ZW"])
  end
  it '' do
    expect(@binomo_control.framework).to match({"cucumber"=>"cucumber", "rspec"=>"rspec"})
  end
  it '' do
    expect(@binomo_control.tariff).to match({"FTD 1"=>"0", "FTD 2"=>"1", "CPA"=>"2", "CPA %"=>"3", "CPL SOI" => "4", "CPL DOI"=>"5"})
  end
end

RSpec.describe Binomo::SmokeBinomoController, type: :controller do
  before(:each) do
    @binomo_control = Binomo::SmokeBinomoController.new
  end

  subject { @binomo_control.set_params }

   it { should include("authorization") }
   it { should include("authorization_crm") }
   it { should include("cashier") }
   it { should include("comment_crm") }
   it { should include("confirmed") }
   it { should include("send_letter_em") }
   it { should include("create_group_push_notify") }
   it { should include("crm verified") }
   it { should include("deals") }
   it { should include("manager_crm") }
   it { should include("payments_approve_crm") }
   it { should include("payments_reject_crm") }
   it { should include("payouts") }
   it { should include("recovery_password") }
   it { should include("registration") }
   it { should include("send_push") }
   it { should include("temp-mail") }
   it { should include("ticket") }
   it { should include("ticket_crm") }
   it { should include("welcome") }
   it { should include("yopmail") }
end
