class PaymentsApprove
  require "capybara"

  def self.run(number)
    @acc = []

    quality_cardpay = ENV['count_pay_approve'].to_i
    quality_cardpay.times do |i|
      sleep 2
      link_transaction = DRIVER.find_elements(:xpath, "//a[@class='label label-important' and text() = '#{number}']/../../td[13]//span[@class='label label-info' and text() = 'New']/../../td[2]/a")[0]


      if link_transaction.blank? == false
        @acc <<  "#{i + 1} #{link_transaction.text}"
        link_transaction.click
        wait_until(1, :css, ".btn-success")
        DRIVER.find_element(:css, ".btn-success").click
        sleep 1
        id = User.where(stage_number: ENV['stage']).last.id
        DRIVER.get(CommonSetting[:url_user_crm] + "/#{id}" + "/orders")
      elsif link_transaction.blank? == true
        print "F"
      end
    end

    puts_info "#{number}: #{@acc[0]} #{@acc[1]} #{@acc[2]} "
  end
end
