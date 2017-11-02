module Server
  class Kill
    def self.process(data, msg_json)
      thr = []

      thr << Thread.new do
        puts "#{msg_json}".magenta.italic

        if msg_json[:pid_cucumber] == "pid_cucumber"
          pid = File.read("./features/temporary/pids/pid_cucumber").split[0..1000]
          puts "#{pid}".red; puts
          pid.each { |x| system "kill -9 #{x}" }
          system "for pid in $(ps -ef | grep rspec | grep -v grep | awk '{print $2}'); do kill $pid; done"
          pid = File.open("./features/temporary/pids/pid_cucumber", 'w'){ |f| f.puts("")}
          system "killall chrome && killall chromedriver"
          data.send("Test aborting")
        end
      end

    end
  end
end
