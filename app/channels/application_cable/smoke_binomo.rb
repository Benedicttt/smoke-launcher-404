class SmokeBinomoChannel < ApplicationCable::Channel
  def subscribed
  end
  def speak(data)
    ActionCable.server.broadcast "smoke_binomo", message: data['message'] 
  end
end
