Given /^Process deploy branch$/ do
  puts  "cd qa && bundle exec cap #{ENV['staging']} deploy #{ENV['project']} #{ENV['branch']} #{ENV['clean']} #{ENV['log']} #{ENV['debug']}"
  system "cd qa && bundle exec cap #{ENV['staging']} deploy #{ENV['project']} #{ENV['branch']} #{ENV['clean']} #{ENV['log']} #{ENV['debug']}"
  File.open("./features/temporary/binomo_branch_#{ENV['staging']}", "w") { |f| f.puts ENV['branch'].sub(/branch=/, '') } if ENV['project'].sub(/project=/, '') == "binomo"
  File.open("./features/temporary/binpartner_branch_#{ENV['staging']}", "w") { |f| f.puts ENV['branch'].sub(/branch=/, '') } if ENV['project'].sub(/project=/, '') == "binpartner"
end
