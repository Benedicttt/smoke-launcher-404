require 'rubygems'
require 'eventmachine'
require 'faye/websocket'
require 'json'
require 'active_support'
require 'active_support/time'
require 'rest_client'
require 'rails'
require 'rails/all'
require "net/ssh"
# #
# # class RequestWS
# #   def self.send_ws(device, demo, asset, amount, deal_type, trend, count)
# #
# #     api_sign_in = "https://#{ENV['stage']}binomo.com/api/sign_in"
# #     @response_auth = RestClient::Request.execute(
# #       method: :post,
# #       url: api_sign_in,
# #       headers: {
# #         referer: "https://#{ENV['stage']}binomo.com",
# #         content_type: 'text/plain',
# #         params:{
# #           email: "sign_up.c2b7793ba84e8c24@yopmail.com",
# #           password: "123456q",
# #           locale: "ru",
# #           device: "web",
# #           geo: "RU"
# #         }
# #       })
# #
# #       api_conf_up = "https://#{ENV['stage']}binomo.com/api/config"
# #       @response = RestClient.get(
# #         api_conf_up,
# #         cookies: @response_auth.cookies,
# #          params: {
# #            locale: 'ru',
# #            device: 'web'
# #        }) { |response, request, result, &block| response }
# #
# #      authtoken = JSON.parse(@response_auth)['data']['authtoken']
# #      device_id = JSON.parse(@response)['data']['device_id']
# #
# #     # connect ws
# #     EM.run {
# #       ws = Faye::WebSocket::Client.new("wss://s7-ws.binomo.com:8080?vsn=2.0.0&device=#{device}&device_id=#{device_id}&authtoken=#{authtoken}")
# #       ws.on :open do |event|
# #          cfd_join = {
# #                       "topic":"cfd",
# #                       "event":"phx_join",
# #                         "payload": {
# #
# #                         },
# #                       "ref":"1",
# #                     }
# #
# #         cfd = JSON.dump(cfd_join)
# #
# #         closed = {
# #                      "topic":"cfd",
# #                      "event":"closed",
# #                        "payload": {
# #
# #                        },
# #                      "ref":"1",
# #                    }
# #
# #        closed = JSON.dump(closed)
# #
# #         ws.send(cfd)
# #         ws.send(closed)
# #       end
# #
# #       ws.on :message do |msg|
# #         params =
# #                   {
# #                     "event":"create",
# #                     "topic":"cfd",
# #                     "ref":"3",
# #                     "payload":
# #                       {
# #                         "ric":asset,
# #                         "amount":amount,
# #                         "deal_type":deal_type,
# #                         "demo":demo,
# #                         "leverage":3,
# #                         "trend":trend
# #                       }
# #                    }
# #
# #         deals = JSON.dump(params)
# #         count.times{ ws.send(deals) }
# #
# #         api_deals_create = "https://#{ENV['stage']}binomo.com/api/v2/deals/cfd"
# #         deals_cfd = RestClient::Request.execute(
# #         method: :get,
# #         url: api_deals_create,
# #         headers: {
# #           cookies: @response_auth.cookies,
# #           params: {
# #             locale: 'ru',
# #             device: device,
# #             # deal_type: deal_type,
# #             # geo: "RU"
# #         }
# #         }) { |response, request, result, &block|  response }
# #
# #         p JSON.parse(deals_cfd.body)['data'][0]
# #         puts "deal list"
# #         api_deals_create = "https://#{ENV['stage']}binomo.com/api/v2/deals/option"
# #         deals_option = RestClient::Request.execute(
# #         method: :get,
# #         url: api_deals_create,
# #         headers: {
# #           cookies: @response_auth.cookies,
# #           params: {
# #             locale: 'ru',
# #             device: device,
# #             deal_type: deal_type,
# #             geo: "RU"
# #         }
# #         }) { |response, request, result, &block|  response }
# #
# #
# #
# #         puts JSON.parse(msg.data) if JSON.parse(msg.data)['event'] == 'opened'
# #         puts JSON.parse(msg.data) if JSON.parse(msg.data)['event'] == 'closed'
# #
# #         return JSON.parse(msg.data) if JSON.parse(msg.data)['event'] == 'closed'
# #       end
# #     }
# #   end
# # end
# #
# # RequestWS.send_ws "web", false, "GOL/OTC", 100, "real", "call", 1
#
# #
# #




#
# require 'rubygems'
# require 'eventmachine'
# require 'faye/websocket'
# require 'json'
# require "time"
# require 'active_support/time'
# require 'rest_client'
#
# class RequestWS
#   def send_ws(device, demo, asset, expire_at, amount, option_type, deal_type, trend, count,  stage, ref)
#
#     api_sign_in = "https://#{ENV['stage']}binomo.com/api/sign_in"
#     @response_auth = RestClient::Request.execute(
#       method: :post,
#       url: api_sign_in,
#       headers: {
#         referer: "https://#{ENV['stage']}binomo.com",
#         content_type: 'text/plain',
#         params:{
#           # email: "na111taly2a.bogdanova@binomo.com",
#           # password: "023001qq",
#           email: "stage1.39e7439758cd6829@yopmail.com",
#           password: "Jemetr!@#()11Capybara123",
#           locale: "ru",
#           device: "web",
#           geo: "RU"
#         }
#       })
#
#       api_conf_up = "https://#{ENV['stage']}binomo.com/api/config"
#       @response = RestClient.get(
#         api_conf_up,
#         cookies: @response_auth.cookies,
#          params: {
#            locale: 'ru',
#            device: 'web'
#        }) { |response, request, result, &block| response }
#
#      authtoken = JSON.parse(@response_auth)['data']['authtoken']
#      device_id = JSON.parse(@response)['data']['device_id']
#
#     # connect ws
#     EM.run {
#       ws = Faye::WebSocket::Client.new("wss://#{ENV['stage'].sub(/[.]/, '')}-ws.binomo.com:8080/?vsn=2.0.0")
#       ws.on :open do |event|
#         phx_join = {
#                      "topic":"base",
#                      "event":"phx_join",
#                      "ref":"1",
#                      "join_ref":"1",
#                      "payload": {
#                        "device":device,
#                        "device_id":device_id,
#                        "authtoken":authtoken
#                      },
#                    }
#
#         message = JSON.dump(phx_join)
#         ws.send(message)
#       end
#
#       ws.on :message do |msg|
#         params = {
#                  "topic":"base",
#                  "event":"create_deal",
#                  "payload": {
#                     "demo":demo,
#                     "asset":asset,
#                     "expire_at":expire_at,
#                     "amount":amount,
#                     "source":"mouse",
#                     "trusted":false,
#                     "created_at":Time.now.to_i,
#                     "option_type":option_type,
#                     "deal_type":deal_type,
#                     "trend":trend,
#                     "tournamend_id":"null"
#                   },
#                 "ref":ref,
#                 "join_ref":"1"
#               }
#           count.times { sleep 1; ws.send(JSON.dump(params)) }
#           puts msg.data
#         # return JSON.parse(msg.data) if JSON.parse(msg.data)['payload']['status'] == 'open'
#       end
#     }
#   end
# end
#
#
# ws          = RequestWS.new
# stage       = ENV['stage']
# expire_at  = (Time.now.to_i / 60).to_i * 60
# expire_at += Time.now.sec > 10 ? 2.minutes : 1.minutes
#
# ws.send_ws "web", false, "GOL/OTC", expire_at, 100,  "turbo", "real", "put", 50, stage, "3"



def self.crm_for_rspec(command)
  Net::SSH.start("#{ENV['stage'].sub(/[.]/, '')}-crm.binomo.com", "binomo") do |ssh|
    if ENV['stage'] == "s1."
      ssh.exec! "cd ~/binomo.com/current/crm.binomo.com/ && RAILS_ENV=staging ~/.rvm/bin/rvm ruby-2.4.0@binomo do bundle exec rails r -e staging \"#{command}\""
    else
      ssh.exec! "cd ~/binomo.com/current/crm.binomo.com/ && RAILS_ENV=staging#{ENV['stage'].sub(/[a-z]/, '').sub(/[.]/, '')} ~/.rvm/bin/rvm ruby-2.4.0@binomo do bundle exec rails r -e staging#{ENV['stage'].sub(/[a-z]/, '').sub(/[.]/, '')} \"#{command}\""
    end
  end
end


def participate(locale, device, password, email, id)
  api_sign_up = "https://#{ENV['stage']}binomo.com/api/sign_up"
  reg = RestClient::Request.execute(
    method: :post,
    url: api_sign_up,
    headers: {
      referer: "https://#{ENV['stage']}binomo.com",
      params: {
        locale: locale,
        device: device,
        password: password,
        i_agree: true,
        email: email,
        currency: "USD",
        geo: "RU",
        country: "RU"
      }
    }
     ) { |response, request, result, &block| response }

  user_id = JSON.parse(reg.body)['data']['id']

   api_agree_risk = "https://#{ENV['stage']}binomo.com/api/profile/agree_risk"
   activate = RestClient::Request.execute(
     method: :get,
     url: api_agree_risk,
     headers: reg.cookies,
       params: {
         locale: locale,
         device: device,
         demo: false,
         geo: "RU"
     }) { |response, request, result, &block|  response }

  api_sign_in = "https://#{ENV['stage']}binomo.com/api/sign_in"
  auth = RestClient::Request.execute(
    method: :post,
    url: api_sign_in,
    headers: {
      cookies: Config.new.get_config("web", "ru"),
      referer: "https://#{ENV['stage']}binomo.com",
      params:{
          locale: locale,
          device: device,
          password: password,
          email: email,
          geo: "RU"
        }
      }
     ) { |response, request, result, &block| response}

     puts auth.body
     puts
     puts


     api_conf_up = "https://#{ENV['stage']}binomo.com/api/config"
     @response = RestClient.get(
       api_conf_up,
       cookies: auth.cookies,
        params: {
          locale: 'ru',
          device: 'web'
      }) { |response, request, result, &block| response }

      device_id = JSON.parse(@response)['data']['device_id']

      puts @response.body
      puts
      puts

  Runner.crm_for_rspec("User.find(#{user_id.to_s}).update(balance: \"30000\", email_verified: true)")



  api_participate = "https://#{ENV['stage']}binomo.com/api/v2/tournaments/#{id}/tournament_users"
  api_participate = RestClient::Request.execute(
    method: :post,
    url: api_participate,
    headers: {
      cookies: auth.cookies,
      referer: "https://#{ENV['stage']}binomo.com",
      params:{
          locale: locale,
          device: device,
          device_id: device_id,
          geo: "RU"
        }
      }
     ) { |response, request, result, &block| response }

     puts api_participate.body
end





email = "#{SecureRandom.hex(20)}@yopmail.com"
password = "12345q"
device = "web"
locale = "ru"
id = 1377

participate(locale, device, password, email, id)
