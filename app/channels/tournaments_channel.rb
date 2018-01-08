class TournamentsChannel < ApplicationCable::Channel
  def subscribed
    stream_from "tournamnet_channel"
  end

  def unsubscribed
  end

  def perform_action(message)
    puts "#{params}".red
    puts "#{message}".red
    msg_json = JSON.parse(message, :symbolize_names => true)

    puts "#{msg_json}".yellow
    ::SmokeTournaments.enqueue msg_json, priority: 10, run_at:  Time.now
  end
end
