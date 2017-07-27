namespace :user do
  desc "provider"
    task :provider do
      system "ssh binomo@#{ENV['stage']}-crm.binomo.com \"cd ~/binomo.com/current/crm.binomo.com/ && RAILS_ENV=#{ENV['staging']} ~/.rvm/bin/rvm ruby-2.4.0@binomo do bundle exec rails r -e #{ENV['staging']} \'pp User.find(#{ENV['id']}).update(email: \"#{SecureRandom.hex(7)}\@yopmail\.com\")\'"
     end

  desc "update"
    task :update do
      system "ssh binomo@#{ENV['stage']}.binomo.com \"cd ~/binomo.com/current/binomo.com/ && RAILS_ENV=#{ENV['staging']} ~/.rvm/bin/rvm ruby-2.4.0@binomo do bundle exec rails r -e #{ENV['staging']} 'pp UserProvider.delete_all'\""
    end

end
