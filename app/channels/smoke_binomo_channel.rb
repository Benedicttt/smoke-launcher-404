class SmokeBinomoChannel < ApplicationCable::Channel
  def subscribed
    stream_from "smoke_binomo"
  end

  def unsubscribed
  end

  def perform_action(message)
    puts "#{params}".red
    puts "#{message}".red
    msg_json = JSON.parse(message, :symbolize_names => true)

    if msg_json[:smoke_binomo] == true
      puts "#{msg_json}".yellow
      ::SmokeBinomo.enqueue msg_json, priority: 10, run_at: Time.now
    end

    if msg_json[:pid_cucumber] == "pid_cucumber"
      pid = File.read("./features/temporary/pids/pid_cucumber").split[0..1000]
      puts "#{pid}".red; puts
      pid.each { |x| system "kill -9 #{x}" }
      system "for pid in $(ps -ef | grep rspec | grep -v grep | awk '{print $2}'); do kill $pid; done"
      pid = File.open("./features/temporary/pids/pid_cucumber", 'w'){ |f| f.puts("")}
      system "killall chrome && killall chromedriver"
    end
  end
end
