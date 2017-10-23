require 'websocket/driver'
require 'eventmachine'
require 'em-websocket'
require './features/helpers/decor'
require './features/ws/ws'

namespace :server do

  desc "Rails"
    task :rails  => :environment do
      thr = []
      thr << Thread.new do
        puts "Rake que:work run".yellow
        puts
        File.open("./features/temporary/pids/pid_rails", "a"){ |f| f.puts("#{Process.pid}")}
        puts Process.pid.to_s
        system "rails s -b 0.0.0.0 -p 3001"
      end

      # thr << Thread.new do
      #   puts "Run xvfb server".yellow
      #   system " Xvfb :1 -screen 0 1024x768x24 2>&1 >/dev/null & export DISPLAY=:1"
      # end

      thr << Thread.new do
        system "driver=chrome cucumber ./features/ws.feature"
      end
      thr.each { |thread| thread.join }
    end

  desc "WS"
    task :ws  => :environment do
      system "driver=chrome cucumber ./features/ws.feature"
    end
end
