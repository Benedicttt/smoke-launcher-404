require 'websocket/driver'
require 'eventmachine'
require 'em-websocket'
require './features/helpers/decor'
require './features/ws/ws'

namespace :server do

  desc "Rails"
    task :rails  => :environment do
      puts
      File.open("./features/temporary/pids/pid_rails", "a"){ |f| f.puts("#{Process.pid}")}
      puts Process.pid.to_s
      puts "Rake que:work run".yellow
      system "rails s -b 0.0.0.0 -p 3001"
    end

  desc "WS"
    task :ws  => :environment do
      system "driver=chrome cucumber ./features/ws.feature"
    end
end
