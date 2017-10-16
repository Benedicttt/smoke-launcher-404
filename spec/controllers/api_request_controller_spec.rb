require "rails_helper"


RSpec.describe Homepage::ApiRequestController, type: :controller do
  before(:each) do
    @api_control = Homepage::ApiRequestController.new
  end
  context "request", :type => :request do
    it { get "/homepage/api_request"}
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
