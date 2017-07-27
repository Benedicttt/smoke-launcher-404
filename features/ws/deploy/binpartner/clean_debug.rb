module Server
  class Binpartner
    def self.clean_debug(data, msg_json)
      count_deploy = msg_json[:count_deploy].to_s
      write_log = msg_json[:write_log].to_s
      clear_releases = msg_json[:clear_releases].to_s

      if msg_json[:binpartner_deploy_clean_debug] == "binpartner_deploy_clean_debug"

        ENV['staging'] = count_deploy.split[1]
        ENV['project'] = count_deploy.split[3]
        ENV['branch'] = count_deploy.split[4]
        ENV['clean'] = count_deploy.split[5]
        ENV['debug'] = count_deploy.split[6]

        if msg_json[:write_log] == true
          ENV['log'] = "> ../deploy/logs/binpartner/#{ENV['staging']}-#{count_deploy.split[4].gsub(/branch=/, '').gsub(/\//, '-')}-#{Time.now.strftime('%Y-%m-%d_%H-%M-%S')}.log 2>&1"
        end

        puts count_deploy.green + " #{ENV['log'].to_s}".green
        data.send("Start deploy Binpartner staging, #{ENV['branch'].to_s}")
        data.send("Start deploy Binpartner staging, #{ENV['branch'].to_s} #{ENV['debug'].to_s}")
        data.send("Start deploy Binpartner staging, #{ENV['branch'].to_s} #{ENV['clean'].to_s}")
        data.send("Start deploy Binpartner staging, #{ENV['branch'].to_s} #{ENV['clean'].to_s} #{ENV['debug'].to_s}")
        system "cucumber ./features/deploy.feature"
        puts " Finished deploy partner".red
        data.send("Deploy Binpartner staging done, #{ENV['branch']}")
        ENV['log'] = ""
      end
    end
  end
end
