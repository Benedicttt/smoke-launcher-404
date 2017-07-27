module Server
  class Deploy
    def self.restart_daemons(data, msg_json)
      count_deploy = msg_json[:count_deploy].to_s
      write_log = msg_json[:write_log].to_s
      clear_releases = msg_json[:clear_releases].to_s

      if msg_json[:restart] == "daemons"
        data.send("Start restart daemons")
        puts count_deploy.green
        system "cd qa && #{count_deploy}"
        puts " Finished".red
        data.send("Restart daemons done")
      end
    end
  end
end
