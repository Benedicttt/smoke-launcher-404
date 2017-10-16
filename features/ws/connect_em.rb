module Server
  class Connect
    def self.em(msg)
      EM.run do
        ws_msg = WebSocket::EventMachine::Client.connect(:uri => 'ws://192.168.4.200:8081')
        ws_msg.send(msg)
        ws_msg.close
      end
    end
  end
end
