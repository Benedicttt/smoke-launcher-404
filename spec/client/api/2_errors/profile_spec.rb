require 'rails_helper'

RSpec.describe "Profile errors validations" do
  let!(:err_locale) {{ err_locale:[ {'field' => 'locale', 'message' => 'Неверное значение','code' => 'not_supported'} ] }}
  let!(:err_blank) {{ err_blank: [ {"field"=>"locale", "message"=>"Поле обязательно для заполнения", "code"=>"blank"} ] }}
  let!(:err_unauth) {{ err_unauth: [ {"field"=>"autorization", "message"=>"Не авторизован", "code"=>"unauthorized"} ] }}

  context "params" do
    it { expect(ProfileAuth.new.get("web", "u")['errors']).to eq  err_locale[:err_locale] }
    it { expect(ProfileAuth.new.get("wb", "ru")['errors']).to eq err_unauth[:err_unauth] }
    it { expect(ProfileAuth.new.get("web", "")['errors']).to eq  err_blank[:err_blank] }
    it { expect(ProfileAuth.new.get("", "ru")['errors']).to eq  err_unauth[:err_unauth] }
  end
end
