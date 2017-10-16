require 'rails_helper'

RSpec.describe "Profile errors validations" do
  context "params" do
    it { expect(ProfileAuth.new.get_web("web", "u")['errors']).to eq  locale }
    it { expect(ProfileAuth.new.get_web("wb", "ru")['errors']).to eq not_authorize }
    it { expect(ProfileAuth.new.get_web("web", "")['errors']).to eq  blank }
    it { expect(ProfileAuth.new.get_web("", "ru")['errors']).to eq  not_authorize }
  end
end
