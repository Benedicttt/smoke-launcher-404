require 'rubygems'
require 'eventmachine'
require 'faye/websocket'
require 'json'
require 'active_support'
require 'active_support/time'
require 'rest_client'
require 'rails'
require 'rails/all'

class RequestWS
  def self.send_ws(device, demo, asset, amount, deal_type, trend, count)

    api_sign_in = "https://#{ENV['stage']}binomo.com/api/sign_in"
    @response_auth = RestClient::Request.execute(
      method: :post,
      url: api_sign_in,
      headers: {
        referer: "https://#{ENV['stage']}binomo.com",
        content_type: 'text/plain',
        params:{
          email: "sign_up.c2b7793ba84e8c24@yopmail.com",
          password: "123456q",
          locale: "ru",
          device: "web",
          geo: "RU"
        }
      })

      api_conf_up = "https://#{ENV['stage']}binomo.com/api/config"
      @response = RestClient.get(
        api_conf_up,
        cookies: @response_auth.cookies,
         params: {
           locale: 'ru',
           device: 'web'
       }) { |response, request, result, &block| response }

     authtoken = JSON.parse(@response_auth)['data']['authtoken']
     device_id = JSON.parse(@response)['data']['device_id']

    # connect ws
    EM.run {
      ws = Faye::WebSocket::Client.new("wss://s7-ws.binomo.com:8080?vsn=2.0.0&device=#{device}&device_id=#{device_id}&authtoken=#{authtoken}")
      ws.on :open do |event|
         cfd_join = {
                      "topic":"cfd",
                      "event":"phx_join",
                        "payload": {

                        },
                      "ref":"1",
                    }

        cfd = JSON.dump(cfd_join)

        closed = {
                     "topic":"cfd",
                     "event":"closed",
                       "payload": {

                       },
                     "ref":"1",
                   }

       closed = JSON.dump(closed)

        ws.send(cfd)
        ws.send(closed)
      end

      ws.on :message do |msg|
        params =
                  {
                    "event":"create",
                    "topic":"cfd",
                    "ref":"3",
                    "payload":
                      {
                        "ric":asset,
                        "amount":amount,
                        "deal_type":deal_type,
                        "demo":demo,
                        "leverage":3,
                        "trend":trend
                      }
                   }

        deals = JSON.dump(params)
        count.times{ ws.send(deals) }

        api_deals_create = "https://#{ENV['stage']}binomo.com/api/v2/deals/cfd"
        deals_cfd = RestClient::Request.execute(
        method: :get,
        url: api_deals_create,
        headers: {
          cookies: @response_auth.cookies,
          params: {
            locale: 'ru',
            device: device,
            # deal_type: deal_type,
            # geo: "RU"
        }
        }) { |response, request, result, &block|  response }

        p JSON.parse(deals_cfd.body)['data'][0]
        puts "deal list"
        api_deals_create = "https://#{ENV['stage']}binomo.com/api/v2/deals/option"
        deals_option = RestClient::Request.execute(
        method: :get,
        url: api_deals_create,
        headers: {
          cookies: @response_auth.cookies,
          params: {
            locale: 'ru',
            device: device,
            deal_type: deal_type,
            geo: "RU"
        }
        }) { |response, request, result, &block|  response }



        puts JSON.parse(msg.data) if JSON.parse(msg.data)['event'] == 'opened'
        puts JSON.parse(msg.data) if JSON.parse(msg.data)['event'] == 'closed'

        return JSON.parse(msg.data) if JSON.parse(msg.data)['event'] == 'closed'
      end
    }
  end
end

RequestWS.send_ws "web", false, "GOL/OTC", 100, "real", "call", 1
