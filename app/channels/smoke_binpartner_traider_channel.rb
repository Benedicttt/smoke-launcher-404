class SmokeBinpartnerTraiderChannel < ApplicationCable::Channel
  def subscribed
    stream_from "smoke_binpartner_traider"
  end

  def unsubscribed
  end

  def perform_action(message)
    puts "#{params}".red
    puts "#{message}".red
    msg_json = JSON.parse(message, :symbolize_names => true)

    puts "#{msg_json}".yellow
    ::SmokeBinpartnerTraider.enqueue msg_json, priority: 10, run_at: Time.now
  end
end
