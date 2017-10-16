Dir["./features/ws/binpartner/*"].each { |file| require file}
require "./features/helpers/decor"

class SmokeBinpartnerTraider < Que::Job

  def run(msg_json)
    begin
      return unless msg_json["smoke_binpartner_traider"] == true
      smoke_part_traider = Server::SmokeBinpartnerTraider.new(msg_json)
      smoke_part_traider.message

      ENV['stage'] = JSON.parse(msg_json.to_json)['count_features'].scan(/stage=(\w+\d+)/).first.first #=> "s2
      email = User.where(stage_number: ENV['stage']).last.email
      id = User.where(stage_number: ENV['stage']).last.id
      report_url = IO.read("./public/reports/binpartner/smoke-binpartner-trader.html")

      report_add_user(id, email, "binpartner-traider", ENV["stage"], report_url)
    rescue
      puts "Test failed, see report".red
    end
  end
end
