module Server
  class Deploy
    def self.restart_daemons(msg_json)
      count_deploy = msg_json[:count_deploy].to_s
      write_log = msg_json[:write_log].to_s
      clear_releases = msg_json[:clear_releases].to_s

      if msg_json[:restart] == "daemons"
        send_broadcast "deploy_binomo_channel", "Start daemons:restart"
        send_broadcast "deploy_binpartner_channel", "Start daemons:restart"
        puts ("Start restart daemons")
        puts count_deploy.green
        system "cd qa && #{count_deploy}"
        sleep 1

        puts " Finished".red
        puts ("Restart daemons done")
        send_broadcast "deploy_binomo_channel", "Done daemons:restart"
        send_broadcast "deploy_binpartner_channel", "Done daemons:restart"
      end
    end
  end
end
