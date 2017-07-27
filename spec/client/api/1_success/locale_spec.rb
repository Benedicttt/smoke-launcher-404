require 'rails_helper'

RSpec.describe "Locale success" do
  before(:context) do
    @locale = Locale.new.get("web", 'ru')
  end

  context "params" do
    it { expect(@locale['success']).to eq true }
    it { expect(@locale['errors']).to eq [] }
    it { expect(@locale['data']['available_locales']).to eq %w[en ru id ms es th vn cn pt tr pl md me kr] }
    it { expect(@locale['data']['default_locale']).to eq 'en'}
  end
end
