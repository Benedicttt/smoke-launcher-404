module Server
  class Binomo
    def self.clean(msg_json)
      count_deploy = msg_json[:count_deploy].to_s
      write_log = msg_json[:write_log].to_s
      clear_releases = msg_json[:clear_releases].to_s

      if msg_json[:binomo_deploy_clean] == "binomo_deploy_clean"

        ENV['staging'] = count_deploy.split[1]
        ENV['project'] = count_deploy.split[3]
        ENV['branch'] = count_deploy.split[4]
        ENV['clean'] = count_deploy.split[5]
        ENV['debug'] = count_deploy.split[6]

        if ENV['staging'] == 'staging'
          @stage_deploy = 's1'
        end
        if ENV['staging'] == 'staging2'
          @stage_deploy = '188.42.243.49'
        end
        if ENV['staging'] == 'staging3'
          @stage_deploy = 's3'
        end
        if ENV['staging'] == 'staging4'
          @stage_deploy = 's4'
        end

        if msg_json[:clear_releases] == true
          puts "All eleases clear".red
          system "ssh binomo@#{@stage_deploy} \"rm -rf /home/binomo/binomo.com/releases/*\"" if ENV['staging'] == 'staging2'
          system "ssh binomo@#{@stage_deploy}-crm.binomo.com \"rm -rf /home/binomo/binomo.com/releases/*\" " if ENV['staging'] == 'staging2'
        end

        if msg_json[:write_log] == true
          ENV['log'] = "> ../deploy/logs/binomo/#{ENV['staging']}-#{count_deploy.split[4].gsub(/branch=/, '').gsub(/\//, '-')}-#{Time.now.strftime('%Y-%m-%d_%H-%M-%S')}.log 2>&1"
        end
        puts
        print count_deploy.green + " #{ENV['log'].to_s}".green

        system "cucumber ./features/deploy.feature"
        puts " Finished deploy binomo".red
        ActionCable.server.broadcast "deploy_binomo_channel", message: "Deploy Binomo staging done, #{ENV['branch']}", status: 200
        ENV['log'] = ""
      end
    end
  end
end
