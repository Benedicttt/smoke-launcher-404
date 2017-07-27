require 'rails_helper'

RSpec.describe "Assets types faild" do
  let!(:invalid) {{ invalid: [{"field"=>"locale", "message"=>"Неверное значение", "code"=>"not_supported"}] }}
  let!(:err_blank) {{ err_blank: [ {"field"=>"locale", "message"=>"Поле обязательно для заполнения", "code"=>"blank"} ]  }}

  context "params" do
    it { expect(Assets.new.errors('wesadsds', "r")['success']).to eq false }
    it { expect(Assets.new.errors('', "r")['success']).to eq false }
    it { expect(Assets.new.errors('wesadsds', "r")['errors']).to eq invalid[:invalid] }
    it { expect(Assets.new.errors('', "r")['errors']).to eq invalid[:invalid] }
    it { expect(Assets.new.errors('web', "")['errors']).to eq err_blank[:err_blank] }
  end
end
