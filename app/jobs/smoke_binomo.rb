Dir["./features/ws/binomo/*"].each { |file| require file}
require "./features/helpers/decor"

class SmokeBinomo < Que::Job
  def run(msg_json)
    begin
      return unless msg_json["smoke_binomo"] == true
      smoke_binomo = Server::SmokeBinomo.new(msg_json)
      smoke_binomo.message


      ENV['stage'] = JSON.parse(msg_json.to_json)['count_features'].scan(/stage=(\w+\d+)/).first.first #=> "s2
      report_url = IO.read("./public/reports/binomo/smoke-binomo.html")
      email = User.where(stage_number: ENV['stage']).last.email
      id = User.where(stage_number: ENV['stage']).last.id

      report_add_user(id, email, "Binomo", ENV["stage"], report_url)
    rescue
      puts "Test failed, see report".red
    end
  end
end
