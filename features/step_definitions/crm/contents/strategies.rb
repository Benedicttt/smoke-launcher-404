Given /^Create new strategies$/ do
  authorization_by_crm(DRIVER)
  begin
    DRIVER.get CommonSetting[:url_page_crm] + "/strategies"
    sleep 3
    DRIVER.find_element(:xpath, '//*[@class="table table-striped"]//tbody/tr/td[text() = "strategy_title EN"]').nil? == false
    puts_info "Content strategy displayed"
  rescue
    %w[EN RU ID MS ES TH VN CN PT TR PL RO ME KR IN UA KZ].each_with_index do |locale, index|
      DRIVER.get CommonSetting[:url_page_crm] + "/strategies/new"
      sleep 3
      DRIVER.execute_script("$('span:contains(\"#{locale.downcase}\")').click()")
      DRIVER.find_element(:id, "strategy_url").send_keys("strategy-url-#{locale.downcase}")
      DRIVER.find_element(:id, "strategy_title").send_keys("strategy_title #{locale}")
      DRIVER.find_element(:id, "strategy_header").send_keys("strategy_header #{locale}")

      DRIVER.find_element(:id, "strategy_meta_keywords").send_keys("one, two, tree")
      DRIVER.find_element(:id, "strategy_meta_description").send_keys("one, two, tree")
      DRIVER.find_elements(:css, "div.fr-element")[0].send_keys("Preview strategy #{locale}")
      DRIVER.find_elements(:css, "div.fr-element")[1].send_keys("Preview strategy #{locale}")
      strategy = File.absolute_path('./app/assets/images/asset.jpg')
      DRIVER.find_element(:id, "strategy_pic").send_keys(strategy)
      sleep 0.5
      DRIVER.find_elements(:css, ".btn-primary")[0].click
    end
  end
end
