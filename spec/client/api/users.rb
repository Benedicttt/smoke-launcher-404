# # require 'rubygems'
# # require 'eventmachine'
# # require 'faye/websocket'
# # require 'json'
# # require 'active_support'
# # require 'active_support/time'
# # require 'rest_client'
# # require 'rails'
# # require 'rails/all'
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
#
#
# require 'rubygems'
# require 'eventmachine'
# require 'faye/websocket'
# require 'json'
#
# class RequestWS
#   def send_ws(device, demo, asset, expire_at, amount, option_type, deal_type, trend, count, tournament_id, stage, ref)
#
#     api_sign_in = "https://#{ENV['stage']}binomo.com/api/sign_in"
#     @response_auth = RestClient::Request.execute(
#       method: :post,
#       url: api_sign_in,
#       headers: {
#         referer: "https://#{ENV['stage']}binomo.com",
#         content_type: 'text/plain',
#         params:{
#           email: Cookies.where(stage: "#{ENV['stage']}").last.email,
#           password: "12345q",
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
#                     "tournament_id":tournament_id
#
#                   },
#                 "ref":ref,
#                 "join_ref":"1"
#               }
#
#         demo_request = JSON.dump(params)
#         count.times { ws.send demo_request; sleep 0.01 }
#
#         api_deals_create = "https://#{ENV['stage']}binomo.com/api/deals/list"
#         deals_real_list = RestClient::Request.execute(
#         method: :get,
#         url: api_deals_create,
#         headers: {
#           cookies: Cookies.where(stage: "#{ENV['stage']}").last.cookies_traider,
#           params: {
#             locale: 'ru',
#             device: device,
#             deal_type: deal_type,
#             tournament_id: tournament_id,
#             geo: "RU"
#         }
#         }) { |response, request, result, &block|  response }
#
#         puts msg.data
#         $msg_deals = msg.data if JSON.parse(msg.data)["payload"]["status"] == "open"
#         return puts msg.data if JSON.parse(msg.data)["payload"]["status"] == "error"
#
#         # return JSON.parse(deals_real_list.body) if JSON.parse(msg.data)["payload"]['trend'] == 'put'
#         # return JSON.parse(deals_real_list.body) if JSON.parse(msg.data)["payload"]['trend'] == 'call'
#         $deal_list_tour = JSON.parse(deals_real_list.body.to_json)
#         return JSON.parse(deals_real_list.body) if JSON.parse(msg.data)["payload"]['status'] == 'open'
#       end
#     }
#   end
# end
#
#
# require 'rails_helper'
#
# RSpec.describe "join session" do
#   before(:context) do
#      tournaments = Tournaments.new.api("ru", "web")
#      ids = []
#      ids << tournaments['data'].map { |key, value| key['id'] if key['timeline_status'] ==  "actual" && key['name'].split[0] == "ru" }
#      @id_max = ids[0].compact.max
#      print "#{@id_max} ".yellow
#
#      ws          = RequestWS.new
#      stage       = ENV['stage']
#
#      expire_at  = (Time.now.to_i / 60).to_i * 60
#      expire_at += Time.now.sec > 10 ? 2.minutes : 1.minutes
#      #
#      @won =  ws.send_ws "web", false, "GOL/OTC", expire_at, 100,  "turbo", "tournament", "put", 1, @id_max, stage, "2"
#      sleep 1
#      @lose =  ws.send_ws "web", false, "GOL/OTC", expire_at, 100,  "turbo", "tournament", "call", 1, @id_max, stage, "3"
#
#      @deals_won = Tournaments.new.deals_list("web", "tournament", @id_max)['data']['deals'][1] #won
#      sleep 0.5
#      @deals_lose = Tournaments.new.deals_list("web", "tournament", @id_max)['data']['deals'][0] #lose
#      #
#      # print "#{(Time.parse(@deals_won['finished_at']) - Time.parse(@deals_won['created_at'])).to_i}".green
#      # sleep (Time.parse(@deals_won['finished_at']) - Time.parse(@deals_won['created_at'])).to_i + 5
#
#      @call = Tournaments.new.deals_list("web", "tournament", @id_max)['data']['deals'][1]
#      @put = Tournaments.new.deals_list("web", "tournament", @id_max)['data']['deals'][0]
#      sleep 1
#      null = "l"
#      @msg_ws_deal = JSON.parse(eval($msg_deals).to_json)
#
#      puts $deal_list_tour['data']['deals'].each { |i| puts i if i['trend'] == "put" }[0]
#      puts $deal_list_tour['data']['deals'].each { |i| puts i if i['trend'] == "call" }[0]
#   end
#
#   context "param create deal" do
#     it {  $deal_list_tour }
#   end
# end
