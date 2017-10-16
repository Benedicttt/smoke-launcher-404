Dir["./features/ws/binpartner/*"].each { |file| require file}
require "./features/helpers/decor"

class SmokeBinpartner < Que::Job

  def run(msg_json)
    begin
      return unless msg_json["smoke_binpartner"] == true
      smoke_binpartner = Server::SmokeBinpartner.new(msg_json)
      smoke_binpartner.message

      ENV['stage'] = JSON.parse(msg_json.to_json)['count_features'].scan(/stage=(\w+\d+)/).first.first #=> "s2
      email = Partner.where(stage_number: ENV['stage']).last.email
      id = Partner.where(stage_number: ENV['stage']).last.id
      report_url = IO.read("./public/reports/binpartner/smoke-binpartner.html")

      report_add_partner(id, email, "binpartner-new", ENV["stage"], report_url)
    rescue
      puts "Test failed, see report".red
    end
  end
end
