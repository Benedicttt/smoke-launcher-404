Given /^Add new press articles$/ do
  authorization_by_crm(DRIVER)
  begin
    DRIVER.get CommonSetting[:url_page_crm] + "/press_articles"
    sleep 2
    DRIVER.find_element(:xpath, '//*[@class="table table-striped"]//tbody/tr/td[text() = "press-article-title EN"]').nil? == false
    puts_info "Content press-article-title displayed"
  rescue
    %w[EN RU ID MS ES TH VN CN PT TR PL RO ME KR IN UA KZ].each_with_index do |locale, index|
      DRIVER.get CommonSetting[:url_page_crm] + "/press_articles/new"
      sleep 2
      DRIVER.execute_script("$('span:contains(\"#{locale.downcase}\")').click()")

      url = "https://#{ENV['stage']}.binomo.com/#{locale.downcase}/news/press-article-#{locale.downcase}"
      DRIVER.find_element(:id, "press_article_url").send_keys(url)

      DRIVER.find_element(:id, "press_article_url_title").send_keys("press-article-title-#{locale.downcase}")
      DRIVER.find_element(:id, "press_article_title").send_keys("press_article_title #{locale}")
      DRIVER.find_element(:id, "press_article_content").send_keys("press_article_content #{locale}")

      strategy = File.absolute_path('./app/assets/images/asset.jpg')
      DRIVER.find_element(:id, "press_article_pic").send_keys(strategy)
      sleep 0.5
      DRIVER.find_elements(:css, ".button")[0].click
    end
  end
end
