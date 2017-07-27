RSpec.describe "get request /homepage authorize" do
    context "request in client" do
      %w[ru en ms id th vn id cn pt es tr pl]. each do |locale|
        (1..36).each do |number|
        it "get /#{locale} and number land #{number}"do
          @config = RestClient.get("#{ENV['api_host']}/config", {params: {locale: 'ru', device: 'web'}})
          response = RestClient.get("https://#{ENV['stage']}binomo.com/#{locale}/promo/l#{number}", @config.cookies )
          expect(response.code).to eq(200)
        end
      end
    end
  end
end
