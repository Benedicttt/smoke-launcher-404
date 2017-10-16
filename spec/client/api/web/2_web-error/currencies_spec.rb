require 'rails_helper'

RSpec.describe "Currencies" do
  context "params" do
    it { expect(Currency.new.get("we","ru")['success']).to eq true }
    it { expect(Currency.new.get("web","r")['errors']).to eq locale }
    it { expect(Currency.new.get("","ru")['success']).to eq true }
    it { expect(Currency.new.get("web","")['errors']).to eq blank }
    it { expect(Currency.new.get("","")['errors']).to eq blank }
  end
end
