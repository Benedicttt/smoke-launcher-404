module Server
  class Deploy
    def self.restart_unicorn(msg_json)
      count_deploy = msg_json[:count_deploy].to_s
      write_log = msg_json[:write_log].to_s
      clear_releases = msg_json[:clear_releases].to_s

      if msg_json[:restart] == "unicorn"
        puts ("Start restart unicorn")
        puts count_deploy.green
        system "cd qa && #{count_deploy}"
        puts " Finished".red
        puts ("Restart unicorn done")
      end
    end
  end
end
