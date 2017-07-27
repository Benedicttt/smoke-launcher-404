require 'rails_helper'

RSpec.describe "Countries errors validations" do
  let!(:err_locale) {{ err_locale:[ {'field' => 'locale', 'message' => 'Неверное значение','code' => 'not_supported'} ] }}
  let!(:err_device) {{ err_device: [ { "field"=>"device", "message"=>"Ошибки валидации", "code"=>"invalid"} ] }}
  let!(:err_blank) {{ err_blank: [ {"field"=>"locale", "message"=>"Поле обязательно для заполнения", "code"=>"blank"} ] }}

  context "params" do
    it { expect(Countries.new.get('web', '', 'KR')['success']).to eq false }
    it { expect(Countries.new.get('web', 'r', 'KR')['success']).to eq false }
    it { expect(Countries.new.get('web', 'r', 'KR')['errors']).to eq err_locale[:err_locale] }
    it { expect(Countries.new.get('web', 'ru', 'sss')['success']).to eq true }
    it { expect(Countries.new.get('', 'ru', 'sss')['success']).to eq true }
    it { expect(Countries.new.get('', '', 'K')['errors']).to eq err_blank[:err_blank] }
  end
end
