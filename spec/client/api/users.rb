require 'rails_helper'
#
# RSpec.describe "Authorized" do
#   1.times do
#     @config = RestClient.get("#{ENV['api_host']}/config", {params: {locale: 'ru', device: 'web'}})
#     @reg =  RestClient::Request.execute(method: :post,
#       url: "https://s2.binomo.com/api/v2/sign_up",
#       cookies: @config.cookies.merge(ot: "20000", os: "getcourse"),
#       headers: { referer: "https://s2.binomo.com",
#         params:{
#           locale: "ru",
#           device: "web",
#           i_agree: true,
#           password: '12345q',
#           email: "#{SecureRandom.hex(8)}@yopmail.com"
#         }})
#           # }},
#       # proxy: 'https://89.38.149.185:8080') { |res| puts res.body }
#
#       agree_risk =  RestClient::Request.execute(method: :get,
#         url: "https://s2.binomo.com/api/profile/agree_risk",
#         cookies: @reg.cookies,
#         headers: { referer: "https://s2.binomo.com",
#           params:{
#             locale: "ru",
#             device: "web",
#         }}) {|response| puts response.body}
#
#   end
# # end
#
# RSpec.describe "Authorized" do
#   @auth = RestClient.post("https://s2.binomo.com/api/sign_in", { locale: "ru", device: "web", password: '12345q', email: "test197@yopmail.com" } )
#   list = RestClient.get("https://s2.binomo.com/api/payouts/history", cookies: @auth.cookies, params: { locale: "ru", device: "web" }) { |response| puts response.body }
#   puts
#   list = RestClient.get("https://s2.binomo.com/api/payouts/purses", cookies: @auth.cookies, params: { locale: "ru", device: "web" }) { |response| puts response.body }
#
#   list = RestClient.post("https://s2.binomo.com/api/payouts", {
#         "locale":"ru",
#         "device":"web",
#         "amount":"20",
#         "purse":7565,
#         "comments_payout":"profits",
#         "comments_text":"Testing stag 2",
#         "bank_code":"中国银行3",
#         "bank_branch": "上海浦东发展银行",
#         "bank_account_number": "农业银行",
#         "bank_city": "农业银行",
#         "bank_province": "农业银行"
#         }, cookies: @auth.cookies) { |response| response.body }
# end
