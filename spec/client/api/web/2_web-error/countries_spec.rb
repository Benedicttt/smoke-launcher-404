require 'rails_helper'

RSpec.describe "Countries errors validations" do
  context "params" do
    it { expect(Countries.new.get('web', '', 'KR')['success']).to eq false }
    it { expect(Countries.new.get('web', 'r', 'KR')['success']).to eq false }
    it { expect(Countries.new.get('web', 'r', 'KR')['errors']).to eq locale }
    it { expect(Countries.new.get('web', 'ru', 'sss')['success']).to eq true }
    it { expect(Countries.new.get('', 'ru', 'sss')['success']).to eq true }
    it { expect(Countries.new.get('', '', 'K')['errors']).to eq blank }
  end
end
