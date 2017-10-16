Dir["./features/ws/crm/*"].each { |file| require file}
require "./features/helpers/decor"

class SmokeTournaments < Que::Job
  def run(msg_json)
    begin
      return unless msg_json["smoke_tournaments"] == true
      http_status = Server::Tournaments.new(msg_json)
      http_status.message

      ENV['stage'] = JSON.parse(msg_json.to_json)['count_features'].scan(/stage=(\w+\d+)/).first.first #=> "s2
      email = User.where(stage_number: ENV['stage']).last.email
      id = User.where(stage_number: ENV['stage']).last.id
      report_url = IO.read("./public/reports/binomo/smoke-tournaments.html")

      report_add_user(id, email, "tournament", ENV["stage"], report_url)
    rescue
      puts "Test failed, see report"
    end
  end
end
