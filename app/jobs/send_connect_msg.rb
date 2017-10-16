def send_connect_msg(msg)
  ws = WebSocket::Client::Simple.connect 'ws://0.0.0.0:8081'
  ws.on :open do
    ws.send msg.to_s
    puts "Connecting and send message".green
  end
end
