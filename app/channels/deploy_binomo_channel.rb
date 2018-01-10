class DeployBinomoChannel < ApplicationCable::Channel
  def subscribed
    stream_from "deploy_binomo_channel"
  end

  def unsubscribed
  end

  def perform_action(message)
    puts "#{params}".red
    puts "#{message}".red
    msg_json = JSON.parse(message, :symbolize_names => true)
    puts "#{msg_json}".yellow

    
    Thread.new { Server::Binomo.deploy(msg_json) }
    Thread.new { Server::Binomo.clean(msg_json) }
    Thread.new { Server::Binomo.clean_debug(msg_json) }
    Thread.new { Server::Binomo.new_date(msg_json) }

    Thread.new { Server::Deploy.memcached_flush(msg_json) }
    Thread.new { Server::Deploy.pid_proccess(msg_json) }
    Thread.new { Server::Deploy.precompile_assets(msg_json) }
    Thread.new { Server::Deploy.restart_unicorn(msg_json) }
    Thread.new { Server::Deploy.restart_daemons(msg_json) }
  end
end
