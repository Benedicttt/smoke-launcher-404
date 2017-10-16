require 'rails_helper'

RSpec.describe "Deals real errors validations" do
  context "params" do
   $first = (Time.now.to_i / 60).to_i*60
   $first += Time.now.sec > 30 ? 6.minutes : 5.minutes

    it { expect(Deals.new.error_real_create(false, "100000000", "GOL/OTC", "turbo", "call", "mouse", Time.now.to_i, $first, 'ru', 'web')['errors']).to eq deals_max_sum }
    it { expect(Deals.new.error_real_create(false, "", "GOL/OTC", "turbo", "call", "mouse", Time.now.to_i, $first, 'ru', 'web')['errors']).to eq deals_amount_invalid }
    it { expect(Deals.new.error_real_create(false, "100", "", "turbo", "call", "mouse", Time.now.to_i, $first, 'ru', 'web')['errors']).to eq deals_asset }
    it { expect(Deals.new.error_real_create(false, "100", "GOL/OTC", "turbo", "cal", "mous", Time.now.to_i, $first, 'ru', 'web')['errors']).to eq deals_inclusion }
    it { expect(Deals.new.error_real_create(false, "1000", "GOL/OTC", "binary", "call", "mouse", Time.now.to_i, $first, 'ru', 'web')['errors']).to eq deals_expire }
  end

  context "params" do
    $last = (Time.now.to_i / 60).to_i*60
    $last += Time.now.sec > 30 ? 0.minutes : 0.minutes

    it { expect(Deals.new.error_real_create(false, "1000", "GOL/OTC", "turbo", "call", "mouse", Time.now.to_i, $last, 'r', 'web')['errors']).to eq locale }
    it { expect(Deals.new.error_real_create(false, "1000", "GOL/OTC", "turbo", "call", "mouse", Time.now.to_i, $last, 'ru', 'we')['errors']).to eq not_authorize }
  end
end
