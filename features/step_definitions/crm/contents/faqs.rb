Given /^Update first group$/ do
  authorization_by_crm(DRIVER)
  begin
    DRIVER.get CommonSetting[:url_page_crm] + "/faq_groups"
    sleep 3
    DRIVER.find_element(:xpath, '//*[@class="table table-striped"]//tbody/tr/td[text() = "faq_group_name_RU/faq_group_name_EN"]').nil? == false
    puts_info "Content faq group displayed"
  rescue
    DRIVER.get CommonSetting[:url_page_crm] + "/faq_groups/new"
    sleep 1
    %w[EN RU ID MS ES TH VN CN PT TR PL RO ME KR IN UA KZ].each_with_index do |locale, index|
      sleep 0.5
      DRIVER.execute_script("$('a:contains(\"#{locale}\")').click()")
      DRIVER.find_element(:id, "faq_group_name_#{locale.downcase}").send_keys("faq_group_name_#{locale}")
    end
    DRIVER.find_elements(:css, ".btn-primary")[0].click
  end
end

  Given /^Update and set first group by question$/ do
  authorization_by_crm(DRIVER)
  begin
    DRIVER.get CommonSetting[:url_page_crm] + "/faq_questions"
    sleep 3
    DRIVER.execute_script("$('span:contains(\"faq_group_name_EN\")').click()")
    DRIVER.find_elements(:css, ".btn-primary")[0].click
    sleep 1
    DRIVER.find_element(:xpath, '//*[@class="table table-striped"]//tbody/tr/td[text() = "faq_group_name_RU"]').nil? == false
    puts_info "Content faq-questions displayed"
  rescue
    DRIVER.get CommonSetting[:url_page_crm] + "/faq_questions/new"
    sleep 1
    DRIVER.execute_script("$('span:contains(\"faq_group_name_EN\")').click()")

    %w[EN RU ID MS ES TH VN CN PT TR PL RO ME KR IN UA KZ].each do |locale|
      DRIVER.execute_script("$('a:contains(\"#{locale}\")').click()")

      DRIVER.find_elements(:css, ".tab-pane.active div.fr-element")[0].send_keys("Faq questions #{locale}")
      DRIVER.find_elements(:css, ".tab-pane.active div.fr-element")[1].send_keys("Faq ask #{locale}")
    end
    DRIVER.find_elements(:css, ".btn-primary")[0].click
  end
end
