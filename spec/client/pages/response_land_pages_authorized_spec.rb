require 'rails_helper'

RSpec.describe "get request /homepage authorize" do
  before(:context) do
    @config = RestClient.get("#{ENV['api_host']}/config", {params: {locale: 'ru', device: 'web'}})
    @auth = RestClient.post("#{ENV['api_host']}/sign_in?email=#{User.where(stage_number: "#{ENV['stage']}".sub(/[.]/, '')).last.email}", $config_api['web_auth'], cookies: @config.cookies)
  end

    context "request in client" do
      %w[ru en ms id th vn id cn pt es tr pl]. each do |locale|
        (1..36).each do |number|
        it "get /#{locale} and number land #{number}"do
         response = RestClient.get("https://#{ENV['stage']}binomo.com/#{locale}/promo/l#{number}", cookies: @auth.cookies, content_type: :json)
         expect(response.code).to eq(200)
        end
      end
    end
  end
end
