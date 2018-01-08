module Server
  class Deploy
    def self.memcached_flush(msg_json)
      count_deploy = msg_json[:count_deploy].to_s
      write_log = msg_json[:write_log].to_s

      if msg_json[:memcached] == "memcached"
        # data.send("Start clear memcached")
        puts count_deploy.green
        system "cd qa && #{count_deploy}"
        puts " Finished".red
        # data.send("Done clear memcached")
      end
    end
  end
end
