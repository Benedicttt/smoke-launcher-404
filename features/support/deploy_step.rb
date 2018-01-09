Given /^Process deploy branch$/ do
  puts  "cd qa && bundle exec cap #{ENV['staging']} deploy #{ENV['project']} #{ENV['branch']} #{ENV['clean']} #{ENV['log']} #{ENV['debug']}"
  # system "cd qa && bundle exec cap #{ENV['staging']} deploy #{ENV['project']} #{ENV['branch']} #{ENV['clean']} #{ENV['log']} #{ENV['debug']}"
end
