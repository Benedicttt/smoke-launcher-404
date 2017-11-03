require 'rails_helper'

RSpec.describe "Coupon cahsier success false" do
  let :coupon_cashier { CouponsWeb.new.coupons("ru", "web", "cashie")}
  it { expect(coupon_cashier['success']).to eq false }
  it { expect(coupon_cashier['data']).to eq nil }
end

RSpec.describe "Coupon cahsier locale invalid " do
  let :coupon_cashier { CouponsWeb.new.coupons("u", "web", "cashie")['errors']}
  it { expect(coupon_cashier).to eq locale }
end

RSpec.describe "Coupon cahsier web invalid " do
  let :coupon_cashier { CouponsWeb.new.coupons("ru", "eb", "cashie")['errors']}
  it { expect(coupon_cashier).to eq not_authorize }
end


RSpec.describe "Coupon cahsier consumer invalid " do
  let :coupon_cashier { CouponsWeb.new.coupons("ru", "web", "ashier")['errors']}
  it { expect(coupon_cashier.empty?).to eq true }
end

RSpec.describe "Coupon cahsier consumer empty " do
  let :coupon_cashier { CouponsWeb.new.coupons("ru", "web", "ashier")['errors']}
  it { expect(coupon_cashier.empty?).to eq true }
end

RSpec.describe "Check coupons error locale for user" do
  let :coupon_cashier { CouponsWeb.new.check("r", "web", "zxcX3SqnlIJS") }

  context "params" do
    it { expect(coupon_cashier['success']).to eq false }
    it { expect(coupon_cashier['errors']).to eq locale }
  end
end

RSpec.describe "Check coupons error device for user" do
  let :coupon_cashier { CouponsWeb.new.check("ru", "wb", "zxcX3SqnlIJS") }

  context "params" do
    it { expect(coupon_cashier['success']).to eq false }
    it { expect(coupon_cashier['errors']).to eq not_authorize }
  end
end
