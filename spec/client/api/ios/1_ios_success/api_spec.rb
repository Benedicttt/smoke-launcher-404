require 'rails_helper'

RSpec.describe "Api success" do
  before(:context) do
    @api = RestClient.get("https://#{ENV['stage']}binomo.com/api", { params: { locale: 'ru', device: 'ios' } })
  end

  context "params" do
    it { expect(@api.code).to eq(200) }
    it { expect(data(@api, 'success')).to eq true }
    it { expect(data(@api, 'errors')).to eq [] }
    it { expect(data(@api, 'data').empty?).to eq true }
  end
end
