class SmokeBinpartnerChannel < ApplicationCable::Channel
  def subscribed
    stream_from "smoke_binpartner"
    puts "!!!!!!!!!!!! if params[:channel] == 'SmokeBinpartnerChannel'"
  end

  def unsubscribed
  end

  def perform_action(message)
    puts
    puts "#{params}".red
    puts
    puts "#{message}".red

  end
end
