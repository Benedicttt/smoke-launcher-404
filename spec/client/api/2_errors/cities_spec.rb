require 'rails_helper'

RSpec.describe "Cities errors validations" do
  let!(:err_device) {{ err_device: [ { "field"=>"country", "message"=>"Ошибки валидации", "code"=>"invalid"} ] }}
  let!(:err_locale) {{ err_locale:[ {'field' => 'locale', 'message' => 'Неверное значение','code' => 'not_supported'} ] }}
  let!(:err_blank) {{ err_blank: [ {"field"=>"locale", "message"=>"Поле обязательно для заполнения", "code"=>"blank"} ] }}

  context "params" do
    it { expect(Cities.new.get('web', '', 'KR')['success']).to eq false }
    it { expect(Cities.new.get('web', 'r', 'KR')['success']).to eq false }
    it { expect(Cities.new.get('web', 'r', 'KR')['errors']).to eq err_locale[:err_locale] }
    it { expect(Cities.new.get('web', 'ru', 'K')['errors']).to eq err_device[:err_device] }
    it { expect(Cities.new.get('web', 'ru', 'KURD')['errors']).to eq err_device[:err_device] }
    it { expect(Cities.new.get('we', 'r', 'K')['errors']).to eq err_locale[:err_locale] }
  end
end
