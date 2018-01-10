module Server
  class Deploy
    def self.memcached_flush(msg_json)
      count_deploy = msg_json[:count_deploy].to_s
      write_log = msg_json[:write_log].to_s

      if msg_json[:memcached] == "memcached"
        send_broadcast "deploy_binomo_channel", "Start command memcached:flush"
        send_broadcast "deploy_binpartner_channel", "Start command memcached:flush"

        puts ("Start clear memcached")
        puts count_deploy.green
        # system "cd qa && #{count_deploy}"
        sleep 1
        puts " Finished".red
        puts ("Done clear memcached")

        send_broadcast "deploy_binomo_channel", "Done command memcached:flush"
        send_broadcast "deploy_binpartner_channel", "Done command memcached:flush"

      end
    end
  end
end
