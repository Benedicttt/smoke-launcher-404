require 'rails_helper'

RSpec.describe "Time success" do
  before(:all) do
    @time = TimeApi.new.get("web", "ru")
  end

  context "params" do
    it { expect(@time['success']).to eq true }
    it { expect(@time['errors']).to eq [] }
    it { expect(@time['data']['time'].zero?).to eq false }
  end
end
