require 'rails_helper'

RSpec.describe "Cities success" do
  before(:all) do
    @cities = Cities.new.get('web', 'ru', 'KR')
  end

  context "params" do
    it { expect(@cities['success']).to eq true }
    it { expect(@cities['errors']).to eq [] }
    it { expect(@cities['data']['cities'].empty?).to eq false }
    it { expect(@cities['data']['cities'].empty?).to eq false }
    it { expect(@cities['data']['cities'][0][0]).to be_a(String) }
    it { expect(@cities['data']['cities'][0][1]).to be_a(Integer) }
  end
end

RSpec.describe "Cities success v2 - add params country" do
  before(:all) do
    @cities = Cities.new.get('', 'ru', 'KR')
  end

  context "params" do
    it { expect(@cities['success']).to eq true }
    it { expect(@cities['errors']).to eq [] }
    it { expect(@cities['data']['cities'].empty?).to eq false }
    it { expect(@cities['data']['cities'].empty?).to eq false }
    it { expect(@cities['data']['cities'][0][0]).to be_a(String) }
    it { expect(@cities['data']['cities'][0][1]).to be_a(Integer) }
  end
end
