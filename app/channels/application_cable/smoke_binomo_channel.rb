class SmokeBinomoChannel < ApplicationCable::Channel
  def subscribed
    # if params[:channel] == "SmokeBinomoChannel"
      stream_from "smoke_binomo"
      puts "!!!!!!!!!!!! if params[:channel] == 'SmokeBinomoChannel'"
    # end
  end

  def unsubscribed
  end

  def send_message(data)
    if data['message'] == "123"
      puts
      puts "Funny"
    end
  end
end
