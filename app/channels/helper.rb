def send_broadcast(channel, message)
  ActionCable.server.broadcast channel, message
end
