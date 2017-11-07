require 'rails_helper'
require "./features/helpers/runner"

RSpec.describe "Success coupons cahsier for user" do
  before(:context) do
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
    it { expect(@welcome_cashier['id']).to be_a Integer }
    it { expect(@welcome_cashier['type']).to eq "welcome_bonus_deposit" }
    it { expect(@welcome_cashier['status']).to eq "issued" }
    it { expect(@welcome_cashier['amount']).to eq nil }
    it { expect(@welcome_cashier['data'][0]['bonus']).to eq 45 }
    it { expect(@welcome_cashier['data'][1]['amount']).to eq 1000 }
    it { expect(@welcome_cashier['data'][1]['bonus']).to eq 45 }
    it { expect(@welcome_cashier['data'][2]['amount']).to eq 4000 }
    it { expect(@welcome_cashier['data'][2]['bonus']).to eq 100 }
    it { expect(@welcome_cashier['data'][3]['amount']).to eq 6000 }
    it { expect(@welcome_cashier['data'][3]['bonus']).to eq 10 }
  end
end

RSpec.describe "Check coupons for user (welcome)" do
  before(:context) do
    code = Cookies.where(stage: ENV['stage']).last.welcome_coupon
    @welcome_cashier = CouponsWeb.new.check("ru", "web", code)
  end

  context "params" do

    it { expect(@welcome_cashier['success']).to eq true }
    it { expect(@welcome_cashier['errors']).to eq [] }
    it { expect(@welcome_cashier['data'][0]['amount']).to eq 0 }
    it { expect(@welcome_cashier['data'][0]['bonus']).to eq 45 }
    it { expect(@welcome_cashier['data'][1]['amount']).to eq 1000 }
    it { expect(@welcome_cashier['data'][1]['bonus']).to eq 45 }
    it { expect(@welcome_cashier['data'][2]['amount']).to eq 4000 }
    it { expect(@welcome_cashier['data'][2]['bonus']).to eq 100 }
    it { expect(@welcome_cashier['data'][3]['amount']).to eq 6000 }
    it { expect(@welcome_cashier['data'][3]['bonus']).to eq 10 }
  end
end
