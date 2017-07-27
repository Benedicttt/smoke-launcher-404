require 'websocket/driver'
require 'eventmachine'
require 'em-websocket'
require 'websocket-client-simple'

class WS
  def self.server

    include Server

    EventMachine::WebSocket.start(:host => "0.0.0.0", :port => 8081) do |ws|
      ws.onmessage do |msg|
        msg_json = JSON.parse(msg, :symbolize_names => true)

        Thread.new { Kill.process(ws, msg_json) }

        Thread.new do
          smoke_binomo = SmokeBinomo.new(msg_json)
          smoke_binomo.message(ws)
        end

        Thread.new do
          smoke_part_traider = SmokeBinpartnerTraider.new(msg_json)
          smoke_part_traider.message(ws)
        end

        Thread.new do
          smoke_binpartner = SmokeBinpartner.new(msg_json)
          smoke_binpartner.message(ws)
        end

        Thread.new { Binomo.deploy(ws, msg_json) }
        Thread.new { Binomo.clean_debug(ws, msg_json) }
        Thread.new { Binomo.clean(ws, msg_json) }
        Thread.new { Binomo.new_date(ws, msg_json) }
        Thread.new { Binpartner.deploy(ws, msg_json) }
        Thread.new { Binpartner.clean(ws, msg_json) }
        Thread.new { Binpartner.clean_debug(ws, msg_json) }
        Thread.new { Binpartner.new_date(ws, msg_json) }

        Thread.new { Deploy.pid_proccess(ws, msg_json) }
        Thread.new { Deploy.precompile_assets(ws, msg_json) }
        Thread.new { Deploy.restart_daemons(ws, msg_json) }
        Thread.new { Deploy.restart_unicorn(ws, msg_json) }
      end

      Open.host(ws)
      Closed.host(ws)
    end
  end
end
