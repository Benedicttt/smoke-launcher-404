require 'rails_helper'

RSpec.describe "Config request in api errors validations" do
  let!(:err_locale) {{ err_locale:[ {'field' => 'locale', 'message' => 'Неверное значение','code' => 'not_supported'} ] }}
  let!(:err_device) {{ err_device: [ { "field"=>"device", "message"=>"Ошибки валидации", "code"=>"invalid"} ] }}
  let!(:err_blank) {{ err_blank: [ {"field"=>"locale", "message"=>"Поле обязательно для заполнения", "code"=>"blank"} ] }}

  context "params" do
    it { expect(Config.new.get('web', 'r')['success']).to eq false }
    it { expect(Config.new.get('we', 'r')['errors']).to eq err_locale[:err_locale] }
    it { expect(Config.new.get('we', '')['errors']).to eq err_blank[:err_blank] }
    it { expect(Config.new.get('web', 'r')['errors']).to eq err_locale[:err_locale] }
    it { expect(Config.new.get('we', 'ru')['success']).to eq true }
  end
end
