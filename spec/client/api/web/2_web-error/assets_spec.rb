require 'rails_helper'

RSpec.describe "Assets types faild" do
  context "params" do
    it { expect(Assets.new.errors('wesadsds', "r")['success']).to eq false }
    it { expect(Assets.new.errors('', "r")['success']).to eq false }
    it { expect(Assets.new.errors('wesadsds', "r")['errors']).to eq locale }
    it { expect(Assets.new.errors('', "r")['errors']).to eq locale }
    it { expect(Assets.new.errors('web', "")['errors']).to eq blank }
  end
end
