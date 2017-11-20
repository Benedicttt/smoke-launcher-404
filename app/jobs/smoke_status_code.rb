require "./features/helpers/decor"

class SmokeStatusCode < Que::Job

  def run(msg_json)
      return unless msg_json["smoke_status_code"] == true
      http_status = Server::StatusCode.new(msg_json)
      http_status.message

      ENV['stage'] = JSON.parse(msg_json.to_json)['count_features'].scan(/stage=(\w+\d+)/).first.first #=> "s2

      report_url_binomo = IO.read("./public/reports/smoke-status-code.html")
      user = User.where(stage_number: ENV['stage']).last.email
      user_id = User.where(stage_number: ENV['stage']).last.id
      report_add_user(user_id, user, "Status code pages", ENV["stage"], report_url_binomo)


      report_url_binpartner = IO.read("./public/reports/smoke-status-code.html")
      partner = Partner.where(stage_number: ENV['stage']).last.email
      partner_id = Partner.where(stage_number: ENV['stage']).last.id
      report_add_partner(partner_id, partner, "Status code pages", ENV["stage"], report_url_binpartner)

    rescue
      puts "Test failed, see report".red
  end
end
