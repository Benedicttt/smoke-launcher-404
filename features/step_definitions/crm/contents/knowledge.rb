Given /^Add and update new link$/ do
  authorization_by_crm(DRIVER)
  begin
    DRIVER.get CommonSetting[:url_page_crm] + "/knowledge"
    sleep 3
    DRIVER.find_element(:xpath, '//*[@class="table table-bordered"]//tbody/tr/td[text() = "knowledge_header CN"]').nil? == false
    puts_info "Content Knowledg displayed"
  rescue
    %w[EN RU ID MS ES TH VN CN PT TR PL RO ME KR IN UA KZ].each_with_index do |locale, index|
      DRIVER.get CommonSetting[:url_page_crm] + "/knowledge/new"
      sleep 3
      DRIVER.execute_script("$('span:contains(\"#{locale.downcase}\")').click()")
      DRIVER.find_element(:id, "knowledge_url").send_keys("knowledge_url_#{locale.downcase}")
      DRIVER.find_element(:id, "knowledge_title").send_keys("knowledge_title #{locale}")
      DRIVER.find_element(:id, "knowledge_header").send_keys("knowledge_header #{locale}")

      DRIVER.find_element(:id, "knowledge_meta_keywords").send_keys("one, two, tree")
      DRIVER.find_element(:id, "knowledge_meta_description").send_keys("one, two, tree")
      DRIVER.find_elements(:css, "div.fr-element")[0].send_keys("Preview article #{locale}")
      sleep 0.5
      DRIVER.find_elements(:css, ".btn-primary")[0].click
    end
  end
end
