Given /^Create new technical article$/ do
  authorization_by_crm(DRIVER)
  begin
    DRIVER.get CommonSetting[:url_page_crm] + "/analyzes"
    sleep 3
    DRIVER.find_element(:xpath, '//*[@class="table table-striped"]//tbody/tr/td[text() = "Preview analyzes EN"]').nil? == false
    puts_info "Content analyzes displayed"
  rescue
    %w[EN RU ID MS ES TH VN CN PT TR PL RO ME KR IN UA KZ].each_with_index do |locale, index|
      DRIVER.get CommonSetting[:url_page_crm] + "/analyzes/new"
      sleep 3
      DRIVER.execute_script("$('span:contains(\"#{locale.downcase}\")').click()")
      DRIVER.find_elements(:css, "div.fr-element")[0].send_keys("Preview analyzes #{locale}")
      strategy = File.absolute_path('./app/assets/images/asset.jpg')
      DRIVER.find_element(:id, "analysis_pic").send_keys(strategy)
      sleep 0.5
      DRIVER.find_elements(:css, ".btn-primary")[0].click
    end
  end
end
