class DeployBinpartnerChannel < ApplicationCable::Channel
  def subscribed
    stream_from "deploy_binpartner_channel"
  end

  def unsubscribed
  end

  def perform_action(data)

    puts "#{params}".red
    puts "#{data}".red
    msg_json = JSON.parse(data, :symbolize_names => true)
    
    Thread.new { Server::Binpartner.deploy(msg_json) }
    Thread.new { Server::Binpartner.clean(msg_json) }
    Thread.new { Server::Binpartner.clean_debug(msg_json) }
    Thread.new { Server::Binpartner.new_date(msg_json) }

    Thread.new { Server::Deploy.memcached_flush(msg_json) }
    Thread.new { Server::Deploy.pid_proccess(msg_json) }
    Thread.new { Server::Deploy.precompile_assets(msg_json) }
    Thread.new { Server::Deploy.restart_unicorn(msg_json) }
    Thread.new { Server::Deploy.restart_daemons(msg_json) }

  end

end
