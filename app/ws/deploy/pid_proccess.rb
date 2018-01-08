module Server
  class Deploy
    def self.pid_proccess(msg_json)
      if msg_json[:pid_deploy] == "pid_deploy"
        pid = File.read("./features/temporary/pids/pid_deploy").split[0..1000]
        puts pid

        pid.each do |x|
          system "kill -9 #{x}"
        end

        pid = File.open("./features/temporary/pids/pid_deploy", 'w'){ |f| f.puts("")}
        system "for pid in $(ps -ef | grep cap | grep -v grep | awk '{print $2}'); do kill $pid; done"
        puts "Kill pid process deploy".red
        ActionCable.server.broadcast "deploy_binomo_channel", message: "Kill pid process deploy", status: 200
      end
    end
  end
end
