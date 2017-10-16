require 'rubygems'
require 'websocket-client-simple'
require 'json'
class RequestWS

  def connect_ws(stage, authtoken, device, device_id)
    ws = WebSocket::Client::Simple.connect "wss://#{stage}-ws.binomo.com:8080/?vsn=2.0.0"

    ws.on :open do
      phx_join = {
            "topic":"base",
            "event":"phx_join",
            "payload": {
              "authtoken":"8740c0ff3e2f6fdf0e370a9e5f1535e3",
              "device":device,
              "device_id":device_id
              },
            "ref":"1",
            "join_ref":"1"
          }

      ws.send(JSON.dump(phx_join))
    end

    ws.on :message do |msg|
      puts msg.data
      exit 1
    end

    loop do
      ws.send STDIN.gets.strip
    end
  end
end
