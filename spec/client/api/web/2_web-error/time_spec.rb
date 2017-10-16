require 'rails_helper'

RSpec.describe "Time errors validations" do
  context "params" do
    it { expect(TimeApi.new.get("", "ru")['success']).to eq true }
    it { expect(TimeApi.new.get("web", "")['errors']).to eq blank }
    it { expect(TimeApi.new.get("", "")['errors']).to eq blank }
    it { expect(TimeApi.new.get("wseb", "rsu")['errors']).to eq locale }
  end
end
