def que(sql)
  require 'pg'
  con = PG.connect :dbname => 'launcher_binomo_db', :user => 'benedict', :password => 'folken123'
  res = con.exec sql
end

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
end
