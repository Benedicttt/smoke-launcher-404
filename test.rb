require 'net/ssh'

class Runner
  def self.return_currencies(command)
    Net::SSH.start("s1-crm.binomo.com", "binomo") do |ssh|
      currency =  ssh.exec! "cd ~/binomo.com/current/crm.binomo.com/ && RAILS_ENV=staging ~/.rvm/bin/rvm ruby-2.4.0@binomo do bundle exec rails r -e staging \"#{command}\""
    end
  end

end
currencies = []
currencies << Runner.return_currencies("cur = []; Currency.all.each { |i| cur << i.iso }; p cur")

File.open('./cur', 'w' ) { |p| currencies.map { |i| p.puts i if eval(i).class == Array } }
