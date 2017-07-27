require 'rails_helper'

RSpec.describe "get request /homepage unauthorize" do
  context "request in client" do
    %w[ru en ms id th vn id cn pt es]. each do |locale|
      it "get /#{locale}"do
       response = RestClient.get("https://#{ENV['stage']}binomo.com/#{locale}")
       expect(response.code).to eq(200)
      end
    end

    %w[ru en ms id th vn id cn pt es]. each do |locale|
      it "get /#{locale} and params" do
        response = RestClient.get("https://#{ENV['stage']}binomo.com/#{locale}", {params: {"a" => "sasasa"}} )
        expect(response.code).to eq(200)
      end
    end
  end
end

RSpec.describe "get response all links " do
    context "200" do
      %w[ru en ms id th vn id cn pt es]. each do |locale|
        $link_binomo_200.each_line do |link|
          it "get stage #{ENV['stage']} locale #{locale.to_s.yellow} link /#{link.red}" do
            response = RestClient.get("https://#{ENV['stage']}binomo.com/#{locale}#{link.gsub(/\n/, '')}")
            expect(response.code).to eq(200)
          end
        end
      end
    context "404" do
      %w[en ms id th vn id cn pt ru es].each do |locale|
        $link_binomo_404.each_line do |link|
          it "get stage #{ENV['stage']} locale #{locale.yellow} link #{link.red}" do
            expect {
              RestClient.get("https://#{ENV['stage']}binomo.com/#{locale}/#{link.gsub(/\n/, '')}")
            }.to raise_error RestClient::NotFound
          end
        end
      end
    end
  end
end
