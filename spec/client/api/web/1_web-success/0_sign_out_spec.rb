require 'rails_helper'

RSpec.describe "Authorize and Sign_out success" do
  before(:context) do
    api_sign_in = "https://#{ENV['stage']}binomo.com/api/sign_in"
    response = RestClient::Request.execute(
      method: :post,
      url: api_sign_in,
      headers: {
        referer: "https://#{ENV['stage']}binomo.com",
        params:{
            locale: "ru",
            device: "web",
            password: "12345q",
            email: Cookies.where(stage: ENV['stage']).last.email,
          }
        })
    @sign_out = RestClient.get("https://#{ENV['stage']}binomo.com/api/sign_out", { params: { locale: 'ru', device: 'web' }, cookies: response.cookies })
  end

  context "params" do
    it { expect(@sign_out.code).to eq(200) }
    it { expect(data(@sign_out, 'success')).to eq true }
    it { expect(data(@sign_out, 'data')['data']).to eq nil }
    it { expect(data(@sign_out, 'errors')).to eq [] }
  end
end
