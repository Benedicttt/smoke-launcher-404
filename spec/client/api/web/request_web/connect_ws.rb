require 'rubygems'
require 'websocket-client-simple'
require 'json'

class RequestWS
  def connect_ws(stage, authtoken, device, device_id, ws)
    ws.on :open do
      phx_join = { "topic":"base","event":"phx_join","payload": {"authtoken":authtoken,"device":device, "device_id":device_id}, "ref":"1", "join_ref":"1"}
      message = JSON.dump(phx_join)
      ws.send(message)
    end
  end

  def send_ws(ws, disconnect = nil, device, demo, asset, expire_at, amount, option_type, deal_type, trend, count)
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
                      "trusted":true,
                      "created_at":Time.now.to_i,
                      "option_type":option_type,
                      "deal_type":deal_type,
                      "trend":trend
                    },
                  "ref":"2",
                  "join_ref":"1"
                }
      demo_request = JSON.dump(params)
      count.times { ws.send demo_request }
      exit 1 if disconnect == true
    end

    loop do
      ws.send STDIN.gets.strip
    end
  end
end
