require "./features/helpers/decor"

class SmokeContentPages < Que::Job

  def run(msg_json)
      return unless msg_json["smoke_content_pages"] == true
      http_status = Server::SmokeContentPage.new(msg_json)
      http_status.message
    rescue
      puts "Test failed, see report".red
  end
end
