require 'rails_helper'

RSpec.describe "Countries success" do
  before(:all) do
    @countries = Countries.new.get("web", "ru", '')
  end

  context "params" do
    it { expect(@countries['success']).to eq true }
    it { expect(@countries['errors']).to eq [] }
    it { expect(@countries['data']['countries'].empty?).to eq false }
    it { expect(@countries['data']['countries'][0][0]).to be_a(String) }
    it { expect(@countries['data']['countries'][0][1]).to be_a(String) }
    it { expect(@countries['data']['countries'][0][2]).to be_a(String) }
  end
end
