Given /^Add ticket category$/ do
  authorization_by_crm(DRIVER)

  begin
    DRIVER.get CommonSetting[:url_page_crm] + "/ticket_categories"
    sleep 1
    DRIVER.find_element(:xpath, '//*[@class="table table-striped"]//tbody/tr/td[text() = "For ticket RU/For ticket EN"]').nil? == false
    puts_info "Content ticket displayed"
  rescue
    DRIVER.get CommonSetting[:url_page_crm] + "ticket_categories/new"
    sleep 1
    %w[EN RU ID MS ES TH VN CN PT TR PL RO ME KR IN UA KZ].each_with_index do |locale, index|
      DRIVER.find_element(:id, "ticket_category_title_#{locale.downcase}").send_keys("For ticket #{locale}")
    end
    sleep 1
    DRIVER.find_elements(:css, ".btn-primary")[0].click
  end

end
