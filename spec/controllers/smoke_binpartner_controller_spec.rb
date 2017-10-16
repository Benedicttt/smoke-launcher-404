require 'rails_helper'

RSpec.describe Binpartner::SmokeBinpartnerController , type: :controller do
  before(:each) do
    @binomo_control = Binpartner::SmokeBinpartnerController.new
  end

  subject { @binomo_control.set_params }
      it { should include("authorization") }
      it { should include("cashier") }
      it { should include("create_postback") }
      it { should include("authorization_crm") }
      it { should include("deals") }
      it { should include("lose") }
      it { should include("payments_approve_crm") }
      it { should include("payouts") }
      it { should include("receive_promo_code") }
      it { should include("reg_treder_refcode") }
      it { should include("registration_partner") }
      it { should include("welcome") }
      it { should include("win") }
      it { should include("yopmail") }
      it { should include("turbo") }
      it { should include("binary") }
end
