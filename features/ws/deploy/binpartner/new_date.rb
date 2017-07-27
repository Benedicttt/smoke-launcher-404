module Server
  class Binpartner
    def self.new_date(data, msg_json)
      count_deploy = msg_json[:count_deploy].to_s
      count_date_new_binpartner = msg_json[:count_date_new_binpartner].to_s
      write_log = msg_json[:write_log].to_s
      clear_releases = msg_json[:clear_releases].to_s

      if msg_json[:change_new_binpartner] == "test_date_new_binpartner"
            puts " Delete last date from  binpartner .env".red
            system  "ssh binpartner@s2.binpartner.com \"cd binpartner.com/current && echo \"TEST_DATE=123\" >> .env\""
            puts "New global date => #{count_date_new_binpartner}".green

          data.send("Start change new date binpartner #{count_date_new_binpartner}")
            system  "ssh binpartner@s2.binpartner.com \"cd binpartner.com/current && cat .env |  sed -i.env \"s/TEST_DATE=.*/TEST_DATE=#{count_date_new_binpartner}/\" .env\""
          data.send("Binpartner change done #{count_date_new_binpartner}")
          puts "Date Binpartner=> #{count_date_new_binpartner} change".green
      end
    end
  end
end
