Given /^Create new invest idea$/ do
  authorization_by_crm(DRIVER)
  begin
    DRIVER.get CommonSetting[:url_page_crm] + "/invest_ideas"
    sleep 3
    DRIVER.find_element(:xpath, '//*[@class="table table-striped"]//tbody/tr/td[text() = "invest_idea_header EN"]').nil? == false
    puts_info "Content invest idea displayed"
  rescue
    %w[EN RU ID MS ES TH VN CN PT TR PL RO ME KR IN UA KZ].each_with_index do |locale, index|
      DRIVER.get CommonSetting[:url_page_crm] + "/invest_ideas/new"
      sleep 3
      DRIVER.execute_script("$('span:contains(\"#{locale.downcase}\")').click()")
      DRIVER.find_element(:id, "invest_idea_url").send_keys("invest-idea-#{locale.downcase}")
      DRIVER.find_element(:id, "invest_idea_title").send_keys("invest_idea_title #{locale}")
      DRIVER.find_element(:id, "invest_idea_header").send_keys("invest_idea_header #{locale}")

      DRIVER.find_element(:id, "invest_idea_meta_keywords").send_keys("one, two, tree")
      DRIVER.find_element(:id, "invest_idea_meta_description").send_keys("one, two, tree")
      DRIVER.find_elements(:css, "div.fr-element")[0].send_keys("Preview invest idea #{locale}")
      DRIVER.find_elements(:css, "div.fr-element")[1].send_keys("Preview invest idea #{locale}")
      strategy = File.absolute_path('./app/assets/images/asset.jpg')
      DRIVER.find_element(:id, "invest_idea_pic").send_keys(strategy)
      sleep 0.5
      DRIVER.find_elements(:css, ".btn-primary")[0].click
    end
  end
end
