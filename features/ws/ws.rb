require 'websocket/driver'
require 'em-websocket'
require 'websocket-client-simple'
require 'que'

class WS
  def self.server
    include Server

    EventMachine::WebSocket.start(:host => "0.0.0.0", :port => 8081) do |ws_server|

      ws_server.onmessage do |msg|
        msg_json = JSON.parse(msg, :symbolize_names => true)

        ::SmokeBinomo.enqueue msg_json, priority: 10, run_at:  Time.now
        ::SmokeBinpartner.enqueue msg_json, priority: 10, run_at:  Time.now
        ::SmokeBinpartnerTraider.enqueue msg_json, priority: 10, run_at:  Time.now
        ::SmokeTournaments.enqueue msg_json, priority: 10, run_at:  Time.now
        ::SmokeContentPages.enqueue msg_json, priority: 10, run_at:  Time.now

        ::SmokeStatusCode.enqueue msg_json, priority: 10, run_at:  Time.now

        Thread.new { Binomo.deploy(ws_server,  msg_json) }
        Thread.new { Binomo.clean_debug(ws_server,  msg_json) }
        Thread.new { Binomo.clean(ws_server,  msg_json) }
        Thread.new { Binomo.new_date(ws_server,  msg_json) }

        Thread.new { Binpartner.deploy(ws_server,  msg_json) }
        Thread.new { Binpartner.clean(ws_server,  msg_json) }
        Thread.new { Binpartner.clean_debug(ws_server,  msg_json) }
        Thread.new { Binpartner.new_date(ws_server,  msg_json) }

        Thread.new { Deploy.pid_proccess(ws_server,  msg_json) }
        Thread.new { Deploy.precompile_assets(ws_server,  msg_json) }
        Thread.new { Deploy.restart_daemons(ws_server,  msg_json) }
        Thread.new { Deploy.restart_unicorn(ws_server,  msg_json) }
        Thread.new { Deploy.memcached_flush(ws_server,  msg_json) }

        Thread.new { Kill.process(ws_server,  msg_json) }

      end

      ip =  ws_server.get_peername[2,6].unpack('nC4')[1..4].join('.')
      Open.new.host(ws_server,  ip)
      Closed.new.host(ws_server,  ip)

    end
  end
end
