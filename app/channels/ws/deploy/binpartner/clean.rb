module Server
  class Binpartner
    def self.clean(msg_json)
      if msg_json[:binpartner_deploy_clean] == "binpartner_deploy_clean"
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
        
        if msg_json[:clear_releases] == true
          system "ssh binpartner@#{@stage_deploy}.binpartner.com \"rm -rf /home/binpartner/binpartner.com/releases/*\""
          puts "All releases clear".red
        end

        puts
        print count_deploy.green + " #{ENV['log'].to_s}".green

        send_broadcast "deploy_binpartner_channel", "Start"
        system "cucumber ./features/deploy.feature"
        puts " Finished deploy partner".red
        send_broadcast "deploy_binpartner_channel", "Complete"

        ENV['log'] = ""
      end
    end
  end
end
