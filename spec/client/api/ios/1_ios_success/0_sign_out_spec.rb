require 'rails_helper'

RSpec.describe "Authorize and Sign_out success" do
  before(:context) do
    api_sign_in = "https://#{ENV['stage']}binomo.com/api/sign_in"
    response = RestClient::Request.execute(
      method: :post,
      url: api_sign_in,
      headers: {
        referer: "https://#{ENV['stage']}binomo.com",
        params: {
          locale: "ru",
          device: "ios",
          app_version: "1.0",
          device_id: $uuid,
          password: "12345q",
          email: "test197@yopmail.com",
        }
      })

    @sign_out = RestClient::Request.execute(
      method: :get,
      url: "https://#{ENV['stage']}binomo.com/api/sign_out",
      headers: {
        params: {
          locale: 'ru',
          device: 'ios',
          app_version: "1.0",
          device_id: $uuid,
          password: "12345q",
          authtoken: JSON.parse(response.body)['data']['authtoken'],
          email: "test197@yopmail.com"
        },
        cookies: response.cookies
      })
  end

  context "params" do
    it { expect(@sign_out.code).to eq(200) }
    it { expect(data(@sign_out, 'success')).to eq true }
    it { expect(data(@sign_out, 'data')['data']).to eq nil }
    it { expect(data(@sign_out, 'errors')).to eq [] }
  end
end
