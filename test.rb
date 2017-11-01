require 'net/ssh'
Net::SSH.start('s2.binomo.com', 'binomo') do |ssh|
  line = ssh.exec!("cd binomo.com && tail -1 revisions.log").split[1]
end
