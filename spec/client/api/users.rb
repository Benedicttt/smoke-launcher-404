class Coupons
#   def check(locale, device, id)
#
#
#     api = "https://#{ENV['stage']}binomo.com/api/coupons/check"
#     response = RestClient::Request.execute(
#       method: :get,
#       url: api,
#       headers: {
#         cookies: response.cookies,
#         params: {
#            locale: locale,
#            device: device,
#            geo: "RU"
#          }
#        }
#      ) { |response, request, result, &block| response}
#      return JSON.parse(response.body)
#   end
#
#
#   def coupons_id(locale, device)
#     api = "https://#{ENV['stage']}binomo.com/api/coupons/#{id}"
#     response = RestClient::Request.execute(
#       method: :get,
#       url:api,
#       headers: {
#         cookies: Cookies.where(stage: "#{ENV['stage']}").last.cookies_traider,
#         params: {
#            locale: locale,
#            device: device,
#            geo: "RU"
#          }
#        }
#      ) { |response, request, result, &block| response}
#      return JSON.parse(response.body)
#   end
# end






  def coupons(locale, device, consumer)
    api = "https://#{ENV['stage']}binomo.com/api/coupons"
    cookies = Cookies.where(stage: "#{ENV['stage']}").last.cookies_traider
       response = RestClient::Request.execute(
      method: :get,
      url:api,
      headers: {
        cookies: cookies,
        params: {
           locale: locale,
           device: device,
           consumer: consumer
         }
       }
     ) { |response, request, result, &block| response}
     return JSON.parse(response.body)
  end

end

puts Coupons.new.coupons("ru", "web", "cashier")
