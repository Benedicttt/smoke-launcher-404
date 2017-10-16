require 'rails_helper'

RSpec.describe "Assets types faild" do
  context "params" do
    it { expect(Assets.new.type("we", "r")['errors']).to eq locale }
    it { expect(Assets.new.type("ios", "ry")['errors']).to eq locale }
  end
end
