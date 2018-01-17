require 'rails_helper'

RSpec.describe "Authorize and Sign_out success" do
  before(:context) do
    def sign_in_ios(email, password)
      api_sign_in = "https://#{ENV['stage']}binomo.com/api/sign_in"
      response = RestClient::Request.execute(
        method: :post,
        url: api_sign_in,
        headers: {
          referer: "https://#{ENV['stage']}binomo.com",
          params: {
            locale: "ru",
            device: "ios",
            app_version: "432",
            device_id: $uuid,
            email: email,
            password: password
          }
        }) { |response| response }

        return JSON.parse(response.body)
     end

     email = Cookies.where(stage: ENV['stage']).last.email
     password = "12345q"
     password_two = "123456q"

     @result = sign_in_ios(email, password)
     begin
       if @result['errors'][0]['field'] == "sign_in"
         @result = sign_in_ios(email, password_two)
       end
     rescue
     end

     
    @sign_out = RestClient::Request.execute(
      method: :get,
      url: "https://#{ENV['stage']}binomo.com/api/sign_out",
      headers: {
        params: {
          locale: 'ru',
          device: 'ios',
          app_version: "432",
          device_id: $uuid,
          authtoken: @result['data']['authtoken'],
        },
      })
  end

  context "params" do
    it { expect(@sign_out.code).to eq(200) }
    it { expect(data(@sign_out, 'success')).to eq true }
    it { expect(data(@sign_out, 'data')['data']).to eq nil }
    it { expect(data(@sign_out, 'errors')).to eq [] }
  end
end
