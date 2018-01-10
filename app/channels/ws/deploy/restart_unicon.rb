module Server
  class Deploy
    def self.restart_unicorn(msg_json)
      count_deploy = msg_json[:count_deploy].to_s
      write_log = msg_json[:write_log].to_s
      clear_releases = msg_json[:clear_releases].to_s

      if msg_json[:restart] == "unicorn"
        send_broadcast "deploy_binomo_channel", "Start unicorn:restart"
        send_broadcast "deploy_binpartner_channel", "Start unicorn:restart"

        puts ("Start restart unicorn")
        puts count_deploy.green
        # system "cd qa && #{count_deploy}"
        sleep 1

        puts " Finished".red
        puts ("Restart unicorn done")

        send_broadcast "deploy_binomo_channel", "Done unicorn:restart"
        send_broadcast "deploy_binpartner_channel", "Done unicorn:restart"
      end
    end
  end
end
