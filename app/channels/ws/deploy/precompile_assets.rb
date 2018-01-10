module Server
  class Deploy
    def self.precompile_assets(msg_json)
      count_deploy = msg_json[:count_deploy].to_s
      write_log = msg_json[:write_log].to_s
      clear_releases = msg_json[:clear_releases].to_s

      if msg_json[:assets] == "precompile"
        send_broadcast "deploy_binomo_channel", "Start assets:precompile"
        send_broadcast "deploy_binpartner_channel", "Start assets:precompile"

        puts ("Assets precompile start")
        puts count_deploy.green
        system "cd qa && #{count_deploy}"
        sleep 1

        puts " Finished".red
        puts ("Assets precompile done")
        send_broadcast "deploy_binomo_channel", "Done assets:precompile"
        send_broadcast "deploy_binpartner_channel", "Done assets:precompile"
      end
    end
  end
end
