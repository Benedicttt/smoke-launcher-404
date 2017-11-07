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

RSpec.describe "Check coupons params cashier individual" do
  before(:context) do
    @bonus_cashier_individual = CouponsWeb.new.coupons("ru", "web", "cashier")['data'][1]
  end

  context "param success" do
    it { expect(@bonus_cashier_individual['id']).to be_a Integer }
    it { expect(@bonus_cashier_individual['type']).to eq "bonus_deposit" }
    it { expect(@bonus_cashier_individual['status']).to eq "issued" }
    it { expect(@bonus_cashier_individual['data'].empty?).to eq false }
  end
end

RSpec.describe "Check coupons params cashier common" do
  before(:context) do
    @bonus_cashier_common = CouponsWeb.new.coupons("ru", "web", "cashier")['data'][2]
  end

  context "param success" do
    it { expect(@bonus_cashier_common['id']).to be_a Integer }
    it { expect(@bonus_cashier_common['type']).to eq "bonus_deposit" }
    it { expect(@bonus_cashier_common['status']).to eq "issued" }
  end
end

RSpec.describe "Check coupons bonus trading" do
  before(:context) do
    @bonus_trading = CouponsWeb.new.coupons("ru", "web", "trading")['data'][0]
  end

  context "param success" do
    it { expect(@bonus_trading['id']).to be_a Integer }
    it { expect(@bonus_trading['type']).to eq "bonus" }
    it { expect(@bonus_trading['status']).to eq "issued" }
  end
end

RSpec.describe "Check coupons free deals trading" do
  before(:context) do
    @free_trading = CouponsWeb.new.coupons("ru", "web", "trading")['data'][1]
  end

  context "param success" do
    it { expect(@free_trading['id']).to be_a Integer }
    it { expect(@free_trading['type']).to eq "free_deals" }
    it { expect(@free_trading['status']).to eq "issued" }
  end
end
