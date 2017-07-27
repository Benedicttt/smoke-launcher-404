require 'websocket/driver'
require 'eventmachine'
require 'em-websocket'
require './features/helpers/decor'
require './features/ws/ws'

namespace :server do

  desc "Rails"
    task :rails do
      # thr = []
      # thr << Thread.new do
          puts
          File.open("./features/temporary/pids/pid_rails", "a"){ |f| f.puts("#{Process.pid}")}
          puts Process.pid.to_s
          system "rails s -b 0.0.0.0 -p 3001"
     end
      # thr.each { |thr| thr.join }
    # end
  desc "WS"
    task :ws do
      system "driver=chrome cucumber ./features/ws.feature"
    end
end
