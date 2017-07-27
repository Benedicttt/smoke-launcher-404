require 'rails_helper'

RSpec.describe Binpartner::SmokeBinpartnerController , type: :controller do
  before(:each) do
    @class_new = Homepage::ApiRequestController.new
  end

  it "has a 200 status code" do
    expect(@class_new.currency).to match(["RUB", "EUR", "USD"])
  end

  it '' do
    expect(@class_new.stage_select).to match({"s1"=>"Stage1", "s2"=>"Stage2", "s3"=>"Stage3", "s4"=>"Stage4", "prod"=>"Production"})
  end
  it '' do
    expect(@class_new.drv).to match(["chrome", "webkit", "firefox", "safari"])
  end
  it '' do
    expect(@class_new.locale).to match(%w[RU EN ID MS ES TH VN CN PT ZW])
  end
  it '' do
    expect(@class_new.framework).to match({"cucumber"=>"cucumber", "rspec"=>"rspec"})
  end
  it '' do
    expect(@class_new.tariff).to match({"FTD 1"=>"0", "FTD 2"=>"1", "CPA"=>"2", "CPA %"=>"3", "CPL SOI" => "4", "CPL DOI"=>"5"})
  end
end

RSpec.describe Binpartner::SmokeBinpartnerController , type: :controller do
  before(:each) do
    @binomo_control = Binpartner::SmokeBinpartnerController.new
  end

  subject { @binomo_control.set_params }
      it { should include("authorization") }
      it { should include("cashier") }
      it { should include("confirmed") }
      it { should include("create_postback") }
      it { should include("crm verified") }
      it { should include("authorization_crm") }
      it { should include("deals") }
      it { should include("lose") }
      it { should include("payments_approve_crm") }
      it { should include("payouts") }
      it { should include("receive_promo_code") }
      it { should include("reg_treder_refcode") }
      it { should include("registration_partner") }
      it { should include("temp-mail") }
      it { should include("welcome") }
      it { should include("win") }
      it { should include("yopmail") }
      it { should include("turbo") }
      it { should include("binary") }
end
