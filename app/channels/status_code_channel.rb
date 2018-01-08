class StatusCodeChannel < ApplicationCable::Channel
  def subscribed
    stream_from "status_code_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
  def perform_action(message)
    puts "#{params}".red
    puts "#{message}".red
    msg_json = JSON.parse(message, :symbolize_names => true)

    puts "#{msg_json}".yellow
    ::SmokeStatusCode.enqueue msg_json, priority: 10, run_at:  Time.now
  end
end
