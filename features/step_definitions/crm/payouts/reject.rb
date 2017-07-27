class PaymentReject
  def self.run
    id = User.where(stage_number: ENV['stage']).last.id
    @acc = []
    %i[
      reason_balance
      reason_turnover
      reason_documents
      reason_limits
      reason_selfie
      reason_new_card
      reason_onetime_limit
      reason_no_reason
      ].each do |id_radio|
        DRIVER.get(CommonSetting[:url_user_crm] + "/#{id}" + "/orders")

        if DRIVER.find_elements(:xpath, "//span[@class='label label-info' and text() = 'New']/../../td[2]/a")[0]
          print " " if id_radio == 1
          sleep 1
          @acc <<  "#{id_radio} #{DRIVER.find_elements(:xpath, "//span[@class='label label-info' and text() = 'New']/../../td[2]/a")[0].text}"

          DRIVER.find_elements(:xpath, "//span[@class='label label-info' and text() = 'New']/../../td[2]/a")[0].click
          sleep 2
          DRIVER.find_elements(:xpath, "//input[@id=\"#{id_radio}\"]")[0].click
          sleep 1
          DRIVER.find_element(:css, ".btn.btn-danger").click
          sleep 1
          DRIVER.get(CommonSetting[:url_user_crm] + "/#{id}" + "/orders")
        else
          print " " if id_radio == 1
          print "F"
        end
        return if id_radio == 5
      end
    puts_info " #{@acc[0]} #{@acc[1]} #{@acc[2]} #{@acc[3]} #{@acc[4]} #{@acc[5]} #{@acc[6]} #{@acc[7]} #{@acc[8]} "
  end
end
