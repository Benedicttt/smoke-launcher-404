require 'rails_helper'

RSpec.describe "Assets types success" do
  before(:all) do
    @type = Assets.new.type("web", "ru")
  end

  context "params" do
    it {expect(@type['success']).to eq true}
    it {expect(@type['data']['types'][0]['id']).to be_a Integer }
    # it {expect(@type['data']['types'][0]['title']).to eq "not assets"}
    it {expect(@type['data']['errors']).to eq nil}
  end
end

RSpec.describe "Assets types success" do
  before(:all) do
    @type = Assets.new.type('', "ru")
  end

  context "params" do
    it {expect(@type['success']).to eq true}
    it {expect(@type['data']['types'][0]['id']).to be_a Integer }
    # it {expect(@type['data']['types'][0]['title']).to eq "not assets"}
    it {expect(@type['data']['errors']).to eq nil}
  end
end
