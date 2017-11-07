class Runner

  def self.call(command)
    Net::SSH.start("#{ENV['stage']}.binomo.com", "binomo") do |ssh|
      if ENV['stage'] == "s1."
        ssh.exec! "cd ~/binomo.com/current/binomo.com/ && RAILS_ENV=staging ~/.rvm/bin/rvm ruby-2.4.0@binomo do bundle exec rails r -e staging \"#{command}\""
      else
        ssh.exec! "cd ~/binomo.com/current/binomo.com/ && RAILS_ENV=staging#{ENV['stage'].sub(/s/, '')} ~/.rvm/bin/rvm ruby-2.4.0@binomo do bundle exec rails r -e staging#{ENV['stage'].sub(/s/, '')} \"#{command}\""
      end
    end
  end

  def self.call_crm(command)
    Net::SSH.start("#{ENV['stage']}.binomo.com", "binomo") do |ssh|
      if ENV['stage'] == "s1."
        ssh.exec! "cd ~/binomo.com/current/crm.binomo.com/ && RAILS_ENV=staging ~/.rvm/bin/rvm ruby-2.4.0@binomo do bundle exec rails r -e staging \"#{command}\""
      else
        ssh.exec! "cd ~/binomo.com/current/crm.binomo.com/ && RAILS_ENV=staging#{ENV['stage'].sub(/s/, '')} ~/.rvm/bin/rvm ruby-2.4.0@binomo do bundle exec rails r -e staging#{ENV['stage'].sub(/s/, '')} \"#{command}\""
      end
    end
  end

  def self.current_branch_binomo
    Net::SSH.start("#{ENV['stage']}.binomo.com", 'binomo') do |ssh|
      return ssh.exec!("cd binomo.com && tail -1 revisions.log").split[1]
    end
  end

  def self.current_branch_binpartner
    Net::SSH.start("#{ENV['stage']}.binpartner.com", 'binpartner') do |ssh|
      return ssh.exec!("cd binpartner.com && tail -1 revisions.log").split[1]
    end
  end
  
  def self.crm_for_rspec(command)
    Net::SSH.start("#{ENV['stage'].sub(/[.]/, '')}-crm.binomo.com", "binomo") do |ssh|
      if ENV['stage'] == "s1."
        ssh.exec! "cd ~/binomo.com/current/crm.binomo.com/ && RAILS_ENV=staging ~/.rvm/bin/rvm ruby-2.4.0@binomo do bundle exec rails r -e staging \"#{command}\""
      else
        ssh.exec! "cd ~/binomo.com/current/crm.binomo.com/ && RAILS_ENV=staging#{ENV['stage'].sub(/[a-z]/, '').sub(/[.]/, '')} ~/.rvm/bin/rvm ruby-2.4.0@binomo do bundle exec rails r -e staging#{ENV['stage'].sub(/[a-z]/, '').sub(/[.]/, '')} \"#{command}\""
      end
    end
  end

end
