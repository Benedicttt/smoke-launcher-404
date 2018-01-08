module Server
  class Binomo
    def self.new_date(msg_json)
      count_deploy = msg_json[:count_deploy].to_s
      count_date_new_binomo = msg_json[:count_date_new_binomo].to_s
      write_log = msg_json[:write_log].to_s
      clear_releases = msg_json[:clear_releases].to_s

      if msg_json[:change_new_binomo] == "test_date_new_binomo"
          system  "ssh binomo@s2.binomo.com \"cd binomo.com/current/binomo.com && sed -i.env \"/TEST_DATE=.*/d\" .env\""
          system  "ssh binomo@s2-crm.binomo.com \"cd binomo.com/current/crm.binomo.com && sed -i.env \"/TEST_DATE=.*/d\" .env\""

          puts " Delete last date from binomo .env".red
          puts "New global date => #{count_date_new_binomo}".green

        ActionCable.server.broadcast "deploy_binomo_channel", message: "Start change new date binomo #{count_date_new_binomo}", status: 200

          system  "ssh binomo@s2.binomo.com \"cd binomo.com/current/binomo.com && echo \"TEST_DATE=123\" >> .env\""
          system  "ssh binomo@s2.binomo.com \"cd binomo.com/current/binomo.com && cat .env |  sed -i.env \"s/TEST_DATE=.*/TEST_DATE=#{count_date_new_binomo}/\" .env\""

          system  "ssh binomo@s2-crm.binomo.com \"cd binomo.com/current/crm.binomo.com && echo \"TEST_DATE=123\" >> .env\""
          system  "ssh binomo@s2-crm.binomo.com \"cd binomo.com/current/crm.binomo.com && cat .env |  sed -i.env \"s/TEST_DATE=.*/TEST_DATE=#{count_date_new_binomo}/\" .env\""
        ActionCable.server.broadcast "deploy_binomo_channel", message: "Binomo change done #{count_date_new_binomo}", status: 200
        puts "Date Binomo=> #{count_date_new_binomo} change".green
      end
    end
  end
end
