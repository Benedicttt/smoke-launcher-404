Given /^Add new video$/ do
  authorization_by_crm(DRIVER)
  begin
    DRIVER.get CommonSetting[:url_page_crm] + "/videos"
    sleep 1
    DRIVER.find_element(:xpath, '//*[@class="table table-striped"]//tbody/tr/td[text() = "video_title EN"]').nil? == false
    puts_info "Content video displayed"
  rescue
    %w[EN RU ID MS ES TH VN CN PT TR PL RO ME KR IN UA KZ].each_with_index do |locale, index|
      DRIVER.get CommonSetting[:url_page_crm] + "/videos/new"
      sleep 2
      DRIVER.execute_script("$('span:contains(\"#{locale.downcase}\")').click()")
      DRIVER.find_element(:id, "video_title").send_keys("video_title #{locale}")

      DRIVER.find_element(:id, "video_description").send_keys("video fo #{locale}")
      DRIVER.find_element(:id, "video_video_url").send_keys("https://www.youtube.com/watch?v=x2YziwipYtU")
      sleep 0.5
      DRIVER.find_elements(:css, ".btn-primary")[0].click
    end
  end
end
