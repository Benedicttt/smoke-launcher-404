require 'rails_helper'

RSpec.describe "Assets types faild" do
  let!(:locale) {{ locale: [{"field"=>"locale", "message"=>"Неверное значение", "code"=>"not_supported"}] }}

  context "params" do
    it { expect(Assets.new.type("we", "r")['errors']).to eq locale[:locale] }
    it { expect(Assets.new.type("ios", "ry")['errors']).to eq locale[:locale] }
  end
end
