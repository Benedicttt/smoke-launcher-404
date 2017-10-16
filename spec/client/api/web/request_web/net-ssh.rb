require 'net/ssh'

class Runner
  def self.call(command)
    Net::SSH.start("#{ENV['stage'].sub(/[.]/, '')}-crm.binomo.com", "binomo") do |ssh|
      if ENV['stage'] == "s1."
        ssh.exec! "cd ~/binomo.com/current/crm.binomo.com/ && RAILS_ENV=staging ~/.rvm/bin/rvm ruby-2.4.0@binomo do bundle exec rails r -e staging \"#{command}\""
      else
        ssh.exec! "cd ~/binomo.com/current/crm.binomo.com/ && RAILS_ENV=staging#{ENV['stage'].sub(/[.]/, '').sub(/s/, '')} ~/.rvm/bin/rvm ruby-2.4.0@binomo do bundle exec rails r -e staging#{ENV['stage'].sub(/[.]/, '').sub(/s/, '')} \"#{command}\""
      end
    end
  end
end
