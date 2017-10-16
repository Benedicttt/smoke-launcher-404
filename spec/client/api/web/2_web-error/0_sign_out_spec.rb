require 'rails_helper'

RSpec.describe "Unauthorize and Sign_out" do
  context "params" do
    RestClient.get("#{ENV['api_host']}/sign_out", $config_api['web'])  do |response, request, result|
      it { expect(response.code).to eq(422) }
      it { expect(data(response,"success")).to eq false }
      it { expect(data(response,"data")).to eq nil }
      it 'Hash from array errors' do
        expect(data(response, "errors")).to include(hash_including("field" => "locale", "code" => "blank"))
      end
    end
  end
end
