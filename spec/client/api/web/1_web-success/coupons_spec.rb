require 'rails_helper'
require "./features/helpers/runner"
# RSpec.describe "Success coupons cahsier for user" do
#   before(:context) { @coupon_cashier = CouponsWeb.new.coupons("ru", "web", "cashier")}
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
#
# RSpec.describe "Check coupons for user (welcome)" do
#   before(:context) do
#     code = Coupons.where(stage: ENV['stage']).last.welcome
#     @coupon_cashier = CouponsWeb.new.check("ru", "web", code)
#   end
#
#   context "params" do
#
#     it { expect(@coupon_cashier['success']).to eq true }
#     it { expect(@coupon_cashier['errors']).to eq [] }
#     it { expect(@coupon_cashier['data'][0]['amount']).to eq 0 }
#     it { expect(@coupon_cashier['data'][0]['bonus']).to eq 45 }
#     it { expect(@coupon_cashier['data'][1]['amount']).to eq 1000 }
#     it { expect(@coupon_cashier['data'][1]['bonus']).to eq 45 }
#     it { expect(@coupon_cashier['data'][2]['amount']).to eq 4000 }
#     it { expect(@coupon_cashier['data'][2]['bonus']).to eq 100 }
#     it { expect(@coupon_cashier['data'][3]['amount']).to eq 6000 }
#     it { expect(@coupon_cashier['data'][3]['bonus']).to eq 10 }
#   end
# end
#
# RSpec.describe "Check coupons for user (welcome)" do
#   before(:context) do
#     code = Coupons.where(stage: ENV['stage']).last.welcome
#     @coupon_cashier = CouponsWeb.new.check("ru", "web", code)
#   end
#
#   context "params" do
#     it { expect(@coupon_cashier['success']).to eq true }
#     it { expect(@coupon_cashier['errors']).to eq [] }
#     it { expect(@coupon_cashier['data'][0]['amount']).to eq 0 }
#     it { expect(@coupon_cashier['data'][0]['bonus']).to eq 45 }
#     it { expect(@coupon_cashier['data'][1]['amount']).to eq 1000 }
#     it { expect(@coupon_cashier['data'][1]['bonus']).to eq 45 }
#     it { expect(@coupon_cashier['data'][2]['amount']).to eq 4000 }
#     it { expect(@coupon_cashier['data'][2]['bonus']).to eq 100 }
#     it { expect(@coupon_cashier['data'][3]['amount']).to eq 6000 }
#     it { expect(@coupon_cashier['data'][3]['bonus']).to eq 10 }
#   end
# end


RSpec.describe "Check coupons for user (welcome)" do
  before(:context) do
    puts Cookies.where(stage: "#{ENV['stage']}").last.id
    puts Cookies.where(stage: "#{ENV['stage']}").last.email
    Runner.crm_for_rspec "
      user = ::User.find(#{Cookies.where(stage: "#{ENV['stage']}").last.id});

      bonus = ::Coupon.where(handler: :bonus, status: :active, scope: :individual).last;
      ::Coupons.create(bonus, user);

      free = ::Coupon.where(handler: :free_deals, status: :active, scope: :individual).last;
      ::Coupons.create(free, user);

      deposit = ::Coupon.where(handler: :bonus_deposit, status: :active, scope: :individual).last;
      ::Coupons.create(deposit, user);

      bonus_deposit = ::Coupon.where(handler: :bonus_deposit, status: :active, scope: :common).last;
      ::Coupons.create(bonus_deposit, user);
    "

    @welcome_cashier = CouponsWeb.new.coupons("ru", "web", "cashier")['data'][0]
    @bonus_cashier_individual = CouponsWeb.new.coupons("ru", "web", "cashier")['data'][1]
    @bonus_cashier_common = CouponsWeb.new.coupons("ru", "web", "cashier")['data'][2]

    @bonus_trading = CouponsWeb.new.coupons("ru", "web", "trading")['data'][0]
    @free_trading = CouponsWeb.new.coupons("ru", "web", "trading")['data'][1]
  end

  context "params" do
    it 'sss' do
      puts @welcome_cashier = CouponsWeb.new.coupons("ru", "web", "cashier")['data'][0]
      puts @bonus_cashier_individual = CouponsWeb.new.coupons("ru", "web", "cashier")['data'][1]
      puts @bonus_cashier_common = CouponsWeb.new.coupons("ru", "web", "cashier")['data'][2]

      puts @bonus_trading = CouponsWeb.new.coupons("ru", "web", "trading")['data'][0]
      puts @free_trading = CouponsWeb.new.coupons("ru", "web", "trading")['data'][1]
    end
  end
end
