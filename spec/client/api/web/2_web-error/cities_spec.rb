require 'rails_helper'

RSpec.describe "Cities errors validations" do
  context "params" do
    it { expect(Cities.new.get('web', '', 'KR')['success']).to eq false }
    it { expect(Cities.new.get('web', 'r', 'KR')['success']).to eq false }
    it { expect(Cities.new.get('web', 'r', 'KR')['errors']).to eq locale }
    it { expect(Cities.new.get('web', 'ru', 'K')['errors']).to eq country }
    it { expect(Cities.new.get('web', 'ru', 'KURD')['errors']).to eq country }
    it { expect(Cities.new.get('we', 'r', 'K')['errors']).to eq locale }
  end
end
