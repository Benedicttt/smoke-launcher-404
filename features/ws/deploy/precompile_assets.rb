module Server
  class Deploy
    def self.precompile_assets(data, msg_json)
      count_deploy = msg_json[:count_deploy].to_s
      write_log = msg_json[:write_log].to_s
      clear_releases = msg_json[:clear_releases].to_s

      if msg_json[:assets] == "precompile"
        data.send("Assets precompile start")
        puts count_deploy.green
        system "cd qa && #{count_deploy}"
        puts " Finished".red
        data.send("Assets precompile done")
      end
    end
  end
end
