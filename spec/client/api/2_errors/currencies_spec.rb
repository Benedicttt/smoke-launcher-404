require 'rails_helper'

RSpec.describe "Currencies" do
  let!(:err_locale) {{ err_locale:[ {'field' => 'locale', 'message' => 'Неверное значение','code' => 'not_supported'} ] }}
  let!(:err_blank) {{ err_blank: [ {"field"=>"locale", "message"=>"Поле обязательно для заполнения", "code"=>"blank"} ] }}

  context "params" do
    it { expect(Currency.new.get("we","ru")['success']).to eq true }
    it { expect(Currency.new.get("web","r")['errors']).to eq err_locale[:err_locale] }
    it { expect(Currency.new.get("","ru")['success']).to eq true }
    it { expect(Currency.new.get("web","")['errors']).to eq err_blank[:err_blank] }
    it { expect(Currency.new.get("","")['errors']).to eq err_blank[:err_blank] }
  end
end
