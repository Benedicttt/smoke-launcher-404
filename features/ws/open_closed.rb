module Server
  class Open
    def host(ws, ip)
      ws.onopen do
        print "\nWebSocket server #{ip.green}".yellow + " start".yellow
        puts " :port => 8081".yellow
        puts Process.pid
        File.open("./features/temporary/pids/pid_ws", "w") { |f| f.puts("#{Process.pid}")}
      end
    end
  end

  class Closed
    def host(ws, ip)
      ws.onclose  do
        puts "WebSocket server #{ip.green}".red + " closed".red
      end
    end
  end
end
