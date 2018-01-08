module Server
  class Binpartner
    def self.clean_debug(msg_json)
      if msg_json[:binpartner_deploy_clean_debug] == "binpartner_deploy_clean_debug"
        count_deploy = msg_json[:count_deploy].to_s
        write_log = msg_json[:write_log].to_s
        clear_releases = msg_json[:clear_releases].to_s


        ENV['staging'] = count_deploy.split[1]
        ENV['project'] = count_deploy.split[3]
        ENV['branch'] = count_deploy.split[4]
        ENV['clean'] = count_deploy.split[5]
        ENV['debug'] = count_deploy.split[6]

        if msg_json[:write_log] == true
          ENV['log'] = "> ../deploy/logs/binpartner/#{ENV['staging']}-#{count_deploy.split[4].gsub(/branch=/, '').gsub(/\//, '-')}-#{Time.now.strftime('%Y-%m-%d_%H-%M-%S')}.log 2>&1"
        end
        puts
        print count_deploy.green + " #{ENV['log'].to_s}".green
        system "cucumber ./features/deploy.feature"
        puts " Finished deploy partner".red
        ActionCable.server.broadcast "deploy_binomo_channel", message: "Deploy Binpartner staging done, #{ENV['branch']}", status: 200
        ENV['log'] = ""
      end
    end
  end
end
