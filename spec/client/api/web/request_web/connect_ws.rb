require 'rubygems'
require 'eventmachine'
require 'faye/websocket'
require 'json'

class RequestWS
  def send_ws(device, demo, asset, expire_at, amount, option_type, deal_type, trend, count, tournament_id, stage, authtoken, device_id)
    EM.run {
      ws = Faye::WebSocket::Client.new("wss://s1-ws.binomo.com:8080/?vsn=2.0.0")
      ws.on :open do |event|
        phx_join = { "topic":"base","event":"phx_join","payload": {"authtoken":authtoken,"device":device, "device_id":device_id}, "ref":"1", "join_ref":"1"}
        message = JSON.dump(phx_join)
        ws.send(message)
      end

      ws.on :message do |msg|
        params = { "topic":"base",
                   "event":"create_deal",
                   "payload":
                      { "device":device,
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
                    "ref":"2",
                    "join_ref":"1"
                  }

        demo_request = JSON.dump(params)
        count.times { ws.send demo_request; sleep 0.1 }

        api_deals_create = "https://#{ENV['stage']}binomo.com/api/deals/list"
        deals_real_list = RestClient::Request.execute(
        method: :get,
        url: api_deals_create,
        headers: {
          cookies: Cookies.where(stage: "#{ENV['stage']}").last.cookies_traider,
          params: {
            locale: 'ru',
            device: device,
            deal_type: deal_type,
            tournament_id: tournament_id,
            geo: "RU"
        }
        }) { |response, request, result, &block|  response }

        puts msg.data

        $msg_deals = msg.data if JSON.parse(msg.data)["payload"]['status'] == 'open'
        return JSON.parse(deals_real_list.body) if JSON.parse(msg.data)["payload"]['status'] == 'open' || JSON.parse(msg.data)["payload"]['status'] == 'error'
      end
    }


  end
end
