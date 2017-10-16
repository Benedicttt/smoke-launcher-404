require 'rails_helper'

RSpec.describe "Locale" do
  context "params" do
    it { expect(Locale.new.get("wb", 'u')['success']).to eq true }
    it { expect(Locale.new.get("wb", 'ru')['success']).to eq true }
    it { expect(Locale.new.get("", 'u')['success']).to eq true }
    it { expect(Locale.new.get("wb", '')['success']).to eq true }
    it { expect(Locale.new.get("web", '')['success']).to eq true }
    it { expect(Locale.new.get("ios", '')['success']).to eq true }
  end
end
