require 'rubygems'
require 'eventmachine'
require 'faye/websocket'
require 'json'

class RequestWS
  def send_ws(device, demo, asset, expire_at, amount, option_type, deal_type, trend, count, tournament_id, stage, ref)

    api_sign_in = "https://#{ENV['stage']}binomo.com/api/sign_in"
    @response_auth = RestClient::Request.execute(
      method: :post,
      url: api_sign_in,
      headers: {
        referer: "https://#{ENV['stage']}binomo.com",
        content_type: 'text/plain',
        params:{
          email: Cookies.where(stage: "#{ENV['stage']}").last.email,
          password: "12345q",
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
      ws = Faye::WebSocket::Client.new("wss://#{ENV['stage'].sub(/[.]/, '')}-ws.binomo.com:8080/?vsn=2.0.0")
      ws.on :open do |event|
        phx_join = {
                     "topic":"base",
                     "event":"phx_join",
                     "ref":"1",
                     "join_ref":"1",
                     "payload": {
                       "device":device,
                       "device_id":device_id,
                       "authtoken":authtoken
                     },
                   }

        message = JSON.dump(phx_join)
        ws.send(message)
      end

      ws.on :message do |msg|
        params = {
                 "topic":"base",
                 "event":"create_deal",
                 "payload": {
                    "demo":demo,
                    "asset":asset,
                    "expire_at":expire_at,
                    "amount":amount,
                    "source":"mouse",
                    "trusted":false,
                    "created_at":Time.now.to_i,
                    "option_type":option_type,
                    "deal_type":deal_type,
                    "trend":trend,
                    "tournament_id":tournament_id

                  },
                "ref":ref,
                "join_ref":"1"
              }

        demo_request = JSON.dump(params)
        count.times { ws.send demo_request; sleep 0.01 }

        api_deals_create = "https://#{ENV['stage']}binomo.com/api/deals/list"
        deals_real_list = RestClient::Request.execute(
        method: :get,
        url: api_deals_create,
        headers: {
          cookies: @response_auth.cookies,
          params: {
            locale: 'ru',
            device: device,
            deal_type: deal_type,
            tournament_id: tournament_id,
            geo: "RU"
        }
        }) { |response, request, result, &block|  response }

        sleep 0.5
        # $deal_list_tour = JSON.parse(deals_real_list.body)
        $msg_deals = msg.data if JSON.parse(msg.data)["payload"]["status"] == "open"

        return JSON.parse(deals_real_list.body) if JSON.parse(msg.data)["payload"]['trend'] == 'put'
        return JSON.parse(deals_real_list.body) if JSON.parse(msg.data)["payload"]['trend'] == 'call'
        return msg.data if JSON.parse(msg.data)["payload"]["status"] == "open"
        return puts msg.data if JSON.parse(msg.data)["payload"]["status"] == "error"
      end
    }
  end
end
