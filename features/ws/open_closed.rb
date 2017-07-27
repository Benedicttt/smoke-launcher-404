module Server
  class Open
    def self.host(param)
      param.onopen do
        param.send("Start")
        print "\nWebSocket server start".yellow
        puts " :port => 8081".red
        puts Process.pid
        File.open("./features/temporary/pids/pid_ws", "w") { |f| f.puts("#{Process.pid}")}
      end
    end
  end

  class Closed
    def self.host(param)
      param.onclose  do
        param.send("Close")
        puts "WebSocket server closed".red
      end
    end
  end
end
