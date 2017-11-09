require 'faye/websocket'
require 'eventmachine'

def send_connect_msg(msg)
  EM.run {
    ws = Faye::WebSocket::Client.new('ws://0.0.0.0:8081')

    ws.on :open do |event|
      ws.send msg.to_json
    end

    ws.on :message do |msg|
      p [:message]
      ws.send msg.to_json
      puts "Send message".yellow
    end

  }
end
