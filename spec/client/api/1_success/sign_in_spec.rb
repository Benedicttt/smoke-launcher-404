require 'rails_helper'

RSpec.describe "Authorized success" do
  before(:all) do
    @authorized = Authorized.new.get_auth("web", "ru", "12345q", "#{Cookies.where(stage: "#{ENV['stage']}").last.email}")
  end

  context "params" do
    it { expect(@authorized['success']).to eq true }
    it { expect(@authorized['data']['authtoken'].length).to eq 32 }
    it { expect(@authorized['data']['url']).to eq '/ru/welcome' }
    it { expect(@authorized['errors']).to eq [] }
  end
end
