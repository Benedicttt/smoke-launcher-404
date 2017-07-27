require 'rails_helper'

RSpec.describe "get request /homepage authorize" do
  before(:context) do
    @config = RestClient.get("#{ENV['api_host']}/config", {params: {locale: 'ru', device: 'web'}})
    @auth = RestClient.post("#{ENV['api_host']}/sign_in?email=#{User.where(stage_number: "#{ENV['stage']}".sub(/[.]/, '')).last.email}", $config_api['web_auth'], cookies: @config.cookies)
    @cookies = @auth.cookies
  end

  context "request in client" do

  %w[ru en ms id th vn id cn pt es tr pl]. each do |locale|
      it "get /#{locale}"do
       response = RestClient.get("https://#{ENV['stage']}binomo.com/#{locale}", cookies: @auth.cookies, content_type: :json)
       expect(response.code).to eq(200)
      end
    end


  %w[ru en ms id th vn id cn pt es tr pl]. each do |locale|
      it "get /#{locale} and params" do
        response = RestClient.get("https://#{ENV['stage']}binomo.com/#{locale}", cookies: @auth.cookies, content_type: :json)
        expect(response.code).to eq(200)
      end
    end
  end
end

RSpec.describe "get response all links " do
  before(:context) do
    @config = RestClient.get("#{ENV['api_host']}/config", {params: {locale: 'ru', device: 'web'}})
    @auth = RestClient.post("#{ENV['api_host']}/sign_in?email=#{User.where(stage_number: "#{ENV['stage']}".sub(/[.]/, '')).last.email}", $config_api['web_auth'], cookies: @config.cookies)
    @cookies = @auth.cookies
  end
  #
    context "200" do
      %w[ru en ms id th vn id cn pt es tr pl]. each do |locale|
          $link_binomo_auth_200.each_line do |link|
            it "get stage #{ENV['stage']} locale #{locale.to_s.yellow} link /#{link.red}" do
              response = RestClient.get("https://#{ENV['stage']}binomo.com/#{locale}#{link.gsub(/\n/, '')}", cookies: @auth.cookies, content_type: :json)
              expect(response.code).to eq(200)
            end
          end
        end


      context "404" do
        %w[en ms id th vn id cn pt ru es]. each do |locale|
          $link_binomo_404.each_line do |link|
            it "get stage #{ENV['stage']} locale #{locale.yellow} link #{link.red}" do
              expect{ RestClient.get("https://#{ENV['stage']}binomo.com/#{locale}#{link.gsub(/\n/, '')}", cookies: @auth.cookies) }.to raise_error RestClient::NotFound
              end
          end
        end
    end
  end
end
