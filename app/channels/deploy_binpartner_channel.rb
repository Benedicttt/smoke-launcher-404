class DeployBinpartnerChannel < ApplicationCable::Channel
  def subscribed
    stream_from "deploy_binpartner_channel"
  end

  def unsubscribed
  end

  def perform_action(message)
    puts "#{params}".red
    puts "#{message}".red
    msg_json = JSON.parse(message, :symbolize_names => true)

    if msg_json == "Complete"
      ActionCable.server.broadcast "deploy_binomo_channel", { message: "Complete"}
    end
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

  def received(data)
    ActionCable.server.broadcast "deploy_binomo_channel", { message: "Complete"}
  end
end
