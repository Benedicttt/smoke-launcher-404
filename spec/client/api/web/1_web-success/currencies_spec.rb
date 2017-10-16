require 'rails_helper'

RSpec.describe "Currency success" do
  before(:all) do
    @currencies = Currency.new.get("web","ru")
  end

  context "params" do
    it { expect(@currencies['success']).to eq true }
    it { expect(@currencies['errors']).to eq [] }
    it { expect(@currencies['data']['currencies'].empty?).to eq false }
    it { expect(@currencies['data']['currencies']).to include("EUR") }
    it { expect(@currencies['data']['currencies']).to include("RUB") }
    it { expect(@currencies['data']['currencies']).to include("USD") }
  end
end
