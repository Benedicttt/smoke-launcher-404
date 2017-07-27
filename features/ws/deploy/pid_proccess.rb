module Server
  class Deploy
    def self.pid_proccess(data, msg_json)
      if msg_json[:pid_deploy] == "pid_deploy"
        pid = File.read("./features/temporary/pids/pid_deploy").split[0..1000]
        puts pid

        pid.each do |x|
          system "kill -9 #{x}"
        end

        pid = File.open("./features/temporary/pids/pid_deploy", 'w'){ |f| f.puts("")}
        system "for pid in $(ps -ef | grep cap | grep -v grep | awk '{print $2}'); do kill $pid; done"
        puts "Kill pid process deploy".red
        data.send("Kill pid process deploy")
      end
    end
  end
end
