class BranchBinomoChannel < ApplicationCable::Channel
  def subscribed
    stream_from "branch_binomo_channel"
  end

  def unsubscribed
  end

  def perform_action(message)
    message = JSON.parse(message, :symbolize_names => true)
    stage = message[:stage]

    branch = runner_binomo(message[:stage].to_s)
    send_broadcast "branch_binomo_channel", {
      stage: stage,
      data: branch.split.last + " " + branch.split[1],
      title: "binomo"
    }


  branch = runner_binpartner(message[:stage].to_s)
  send_broadcast "branch_binomo_channel", {
      stage: stage,
      data: branch.split.last + " " + branch.split[1],
      title: "binpartner"
    } if branch.split[0] != "bash:"
  end

  private
    def test(stage)
      puts "Start runner binomo #{stage}".yellow
      Net::SSH.start("#{stage}-crm.binomo.com", 'binomo') do |ssh|
        return ssh.exec!("cd binomo.com && tail -1 revisions.log")
      end
    end

    def runner_binomo(stage)
      puts "Start runner binomo #{stage}".yellow
      Net::SSH.start("#{stage}-crm.binomo.com", 'binomo') do |ssh|
        return ssh.exec!("cd binomo.com && tail -1 revisions.log")
      end
    end

    def runner_binpartner(stage)
      puts "Start runner binpartner #{stage}".yellow
      Net::SSH.start("#{stage}.binpartner.com", 'binpartner') do |ssh|
        return ssh.exec!("cd binpartner.com && tail -1 revisions.log")
      end
    end

end
