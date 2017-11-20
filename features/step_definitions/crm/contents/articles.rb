Given /^Create new article$/ do
  authorization_by_crm(DRIVER)
  %w[EN RU ID MS ES TH VN CN PT TR PL RO ME KR IN UA KZ].each_with_index do |locale, index|
    DRIVER.get CommonSetting[:url_page_crm] + "/articles/new"
    sleep 1
    DRIVER.find_element(:id, "article_title").clear
    DRIVER.find_element(:id, "article_title").send_keys("Create title content #{Time.zone.now} article #{locale}")
    DRIVER.find_element(:id, "article_header").clear
    DRIVER.find_element(:id, "article_header").send_keys("Create header content #{Time.zone.now} article #{locale}")
    sleep 5

    DRIVER.find_elements(:css, "div.fr-element")[0].send_keys("Preview article #{locale}")
    DRIVER.find_elements(:css, "div.fr-element")[1].send_keys("Content article #{locale}")

    asset = File.absolute_path('./app/assets/images/asset.jpg')
    DRIVER.find_element(:id, "article_pic").send_keys(asset)

    DRIVER.find_element(:id, "article_meta_keywords").send_keys("one, four, try")
    DRIVER.find_element(:id, "article_meta_description").send_keys("describes content's")
    DRIVER.find_element(:id, "article_url").send_keys("url-aticles")
    sleep 0.1
    DRIVER.execute_script("$('span:contains(\"#{locale.downcase}\")').click()")
    sleep 0.5
    DRIVER.find_elements(:css, ".btn-primary")[0].click
    sleep 1
  end
end
