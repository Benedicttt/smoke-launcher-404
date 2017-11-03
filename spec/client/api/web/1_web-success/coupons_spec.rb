# require 'rails_helper'
# RSpec.describe "Success coupons cahsier for user" do
#   before(:context) { @coupon_cashier = Coupons.new.coupons("ru", "web", "cashier")}
#
#   context "params" do
#     it { puts @coupon_cashier }
#     it { expect(@coupon_cashier['success']).to eq true }
#     it { expect(@coupon_cashier['errors']).to eq [] }
#     it { expect(@coupon_cashier['data'][0]['id']).to be_a Integer }
#     it { expect(@coupon_cashier['data'][0]['type']).to eq "welcome_bonus_deposit" }
#     it { expect(@coupon_cashier['data'][0]['status']).to eq "issued" }
#     it { expect(@coupon_cashier['data'][0]['data'][0]['amount']).to eq 0 }
#     it { expect(@coupon_cashier['data'][0]['data'][0]['bonus']).to eq 45 }
#     it { expect(@coupon_cashier['data'][0]['data'][1]['amount']).to eq 1000 }
#     it { expect(@coupon_cashier['data'][0]['data'][1]['bonus']).to eq 45 }
#     it { expect(@coupon_cashier['data'][0]['data'][2]['amount']).to eq 4000 }
#     it { expect(@coupon_cashier['data'][0]['data'][2]['bonus']).to eq 100 }
#     it { expect(@coupon_cashier['data'][0]['data'][3]['amount']).to eq 6000 }
#     it { expect(@coupon_cashier['data'][0]['data'][3]['bonus']).to eq 10 }
#   end
# end

RSpec.describe "Check coupons for user (welcomne)" do
  before(:context) { @coupon_cashier = Coupons.new.check("ru", "web", "27JBYqcdisBr")}

  context "params" do
    it { puts @coupon_cashier }
    # it { expect(@coupon_cashier['success']).to eq true }
    # it { expect(@coupon_cashier['errors']).to eq [] }
    # it { expect(@coupon_cashier['data'][0]['id']).to be_a Integer }
    # it { expect(@coupon_cashier['data'][0]['type']).to eq "welcome_bonus_deposit" }
    # it { expect(@coupon_cashier['data'][0]['status']).to eq "issued" }
    # it { expect(@coupon_cashier['data'][0]['data'][0]['amount']).to eq 0 }
    # it { expect(@coupon_cashier['data'][0]['data'][0]['bonus']).to eq 45 }
    # it { expect(@coupon_cashier['data'][0]['data'][1]['amount']).to eq 1000 }
    # it { expect(@coupon_cashier['data'][0]['data'][1]['bonus']).to eq 45 }
    # it { expect(@coupon_cashier['data'][0]['data'][2]['amount']).to eq 4000 }
    # it { expect(@coupon_cashier['data'][0]['data'][2]['bonus']).to eq 100 }
    # it { expect(@coupon_cashier['data'][0]['data'][3]['amount']).to eq 6000 }
    # it { expect(@coupon_cashier['data'][0]['data'][3]['bonus']).to eq 10 }
  end
end
