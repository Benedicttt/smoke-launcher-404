require 'rails_helper'

RSpec.describe Binomo::EmailMarketingController, type: :controller do
  before(:each) do
    @binomo_control = Binomo::EmailMarketingController.new
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
