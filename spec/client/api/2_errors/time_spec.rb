require 'rails_helper'

RSpec.describe "Time errors validations" do
  let!(:err_locale) {{ err_locale:[ {'field' => 'locale', 'message' => 'Неверное значение','code' => 'not_supported'} ] }}
  let!(:err_blank) {{ err_blank: [ {"field"=>"locale", "message"=>"Поле обязательно для заполнения", "code"=>"blank"} ] }}

  context "params" do
    it { expect(TimeApi.new.get("", "ru")['success']).to eq true }
    it { expect(TimeApi.new.get("web", "")['errors']).to eq err_blank[:err_blank] }
    it { expect(TimeApi.new.get("", "")['errors']).to eq err_blank[:err_blank] }
    it { expect(TimeApi.new.get("wseb", "rsu")['errors']).to eq err_locale[:err_locale] }
  end
end
