require 'rails_helper'

RSpec.describe "Deals demo errors validations" do
  let!(:err_max) {{ err_max:[{"field"=>"amount", "message"=> "Максимальная сумма <span class='currency-unit currency-unit-usd'>$</span><span class='currency-amount'>1000.00</span>", "code"=>"deal_amount_max"} ] }}
  let!(:err_expire) {{ err_expire:[ {"field"=>"expire_at", "message"=>"Неверное значение времени экспирации", "code"=>"deal_expire_at"} ] }}
  let!(:err_asset) {{ err_asset:[ {"field"=>"asset", "message"=>"В данный момент актив недоступен", "code"=>"asset_unavailable"}] }}
  let!(:err_err) {{ err_err:[ {"field"=>"locale", "message"=>"Неверное значение", "code"=>"not_supported"}] }}
  let!(:err_unauth) {{ err_unauth:[ {"field"=>"autorization", "message"=>"Не авторизован", "code"=>"unauthorized"}] }}
  # let!(:err_value) {{ err_value:[ {"field"=>"trend", "message"=>"имеет непредусмотренное значение", "code"=>"inclusion"}, {"field"=>"expire_at", "message"=>"Неверное значение времени экспирации", "code"=>"deal_expire_at"} ] }}
  # let!(:err_summ) {{ err_summ:[ {"field"=>"expire_at", "message"=>"Неверное значение времени экспирации", "code"=>"deal_expire_at"}, {"field"=>"amount", "message"=>"Неверное значение суммы", "code"=>"deal_amount_invalid"} ] }}
  # let!(:err_sum) {{ err_sum:[{"field"=>"expire_at", "message"=>"Неверное значение времени экспирации", "code"=>"deal_expire_at"}, {"field"=>"amount", "message"=>"Неверное значение суммы", "code"=>"deal_amount_invalid"} ] }}
  let!(:err_sum) {{ err_sum:[ {"field"=>"amount", "message"=>"Неверное значение суммы", "code"=>"deal_amount_invalid"} ] }}
  let!(:err_value) {{ err_value:[ {"field"=>"trend", "message"=>"имеет непредусмотренное значение", "code"=>"inclusion"} ] }}
  let!(:err_summ) {{ err_summ:[ {"field"=>"expire_at", "message"=>"Неверное значение времени экспирации", "code"=>"deal_amount_invalid"} ] }}

  context "params" do
    $first = (Time.now.to_i / 60).to_i*60
    $first += Time.now.sec > 30 ? 6.minutes : 5.minutes

    it { expect(Deals.new.error_demo_create(true, "100000000", "GOL/OTC", "turbo", "call", "mouse", Time.now.to_i, $first, 'ru', 'web')['errors']).to eq err_max[:err_max] }
    it { expect(Deals.new.error_demo_create(true, "", "GOL/OTC", "turbo", "call", "mouse", Time.now.to_i, $first, 'ru', 'web')['errors']).to eq err_sum[:err_sum] }
    it { expect(Deals.new.error_demo_create(true, "100", "", "turbo", "call", "mouse", Time.now.to_i, $first, 'ru', 'web')['errors']).to eq err_asset[:err_asset] }
    # it { expect(Deals.new.error_demo_create(true, "1000", "GOL/OTC", "turb", "call", "mouse", Time.now.to_i, $expired, 'ru', 'web')['errors']).to eq } 500
    it { expect(Deals.new.error_demo_create(true, "100", "GOL/OTC", "turbo", "cal", "mous", Time.now.to_i, $first, 'ru', 'web')['errors']).to eq err_value[:err_value] }
    it { expect(Deals.new.error_demo_create(true, "100", "GOL/OTC", "binary", "call", "mouse", Time.now.to_i, $first, 'ru', 'web')['errors']).to eq err_expire[:err_expire] }
  end

  context "params" do
    $last = (Time.now.to_i / 60).to_i*60
    $last += Time.now.sec > 30 ? 1.minutes : 0.minutes

    it { expect(Deals.new.error_demo_create(true, "1000", "GOL/OTC", "turbo", "call", "mouse", Time.now.to_i, $last, 'r', 'web')['errors']).to eq err_err[:err_err] }
    it { expect(Deals.new.error_demo_create(true, "1000", "GOL/OTC", "turbo", "call", "mouse", Time.now.to_i, $last, 'ru', 'we')['errors']).to eq err_unauth[:err_unauth] }
    # it { expect(Deals.new.error_demo_create(true, "1000", "GOL/OTC", "turbo", "call", "mouse", Time.now.to_i, '', 'ru', 'web')['errors']).to eq }
  end

  context "params" do
    $last = (Time.now.to_i / 60).to_i*60
    $last += Time.now.sec > 30 ? 0.minutes : 0.minutes

    it { expect(Deals.new.error_demo_create(true, "1000", "GOL/OTC", "turbo", "call", "mouse", Time.now.to_i, $last, 'r', 'web')['errors']).to eq err_err[:err_err] }
    it { expect(Deals.new.error_demo_create(true, "1000", "GOL/OTC", "turbo", "call", "mouse", Time.now.to_i, $last, 'ru', 'we')['errors']).to eq err_unauth[:err_unauth] }
    # it { expect(Deals.new.error_demo_create(true, "1000", "GOL/OTC", "turbo", "call", "mouse", Time.now.to_i, $expired, 'ru', 'web')['errors']).to eq err_unauth[:err_unauth] } 500
    # it { expect(Deals.new.error_demo_create(true, "1000", "GOL/OTC", "turbo", "call", "mouse", Time.now.to_i, '', 'ru', 'web')['errors']).to eq } 500
  end
end
