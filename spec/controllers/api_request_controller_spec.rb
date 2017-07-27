require "rails_helper"

RSpec.describe Homepage::ApiRequestController, type: :controller do
  before(:each) do
    @api_control = Homepage::ApiRequestController.new
  end
  context "request", :type => :request do
    it { get "/homepage/api_request"}
  end
  it "has a 200 status code" do
    expect(@api_control.currency).to match(["RUB", "EUR", "USD"])
  end

  it '' do
    expect(@api_control.stage_select).to match({"s1"=>"Stage1", "s2"=>"Stage2", "s3"=>"Stage3", "s4"=>"Stage4", "prod"=>"Production"})
  end
  it '' do
    expect(@api_control.drv).to match(["chrome", "webkit", "firefox", "safari"])
  end
  it '' do
    expect(@api_control.locale).to match(["RU","EN","ID","MS","ES","TH","VN","CN","PT","ZW"])
  end
  it '' do
    expect(@api_control.framework).to match({"cucumber"=>"cucumber", "rspec"=>"rspec"})
  end
  it '' do
    expect(@api_control.tariff).to match({"FTD 1"=>"0", "FTD 2"=>"1", "CPA"=>"2", "CPA %"=>"3", "CPL SOI" => "4", "CPL DOI"=>"5"})
  end
end

RSpec.describe Homepage::ApiRequestController, type: :controller do
  before(:each) do
    @api_control = Homepage::ApiRequestController.new
  end

  subject { @api_control.set_params }
    it { should include("agree_risk_android") }
    it { should include("agree_risk_ios" ) }
    it { should include("cashier_android") }
    it { should include("cashier_ios" ) }
    it { should include("deals_android") }
    it { should include("deals_ios" ) }
    it { should include("email_conf_android" ) }
    it { should include("email_conf_ios" ) }
    it { should include("install_android") }
    it { should include("install_ios") }
    it { should include("payouts_android") }
    it { should include("payouts_ios" ) }
    it { should include("profile_edit_android") }
    it { should include("profile_edit_ios" ) }
    it { should include("registration_android") }
    it { should include("registration_ios") }
    it { should include("sign_in_android") }
    it { should include("sign_in_ios") }
end
