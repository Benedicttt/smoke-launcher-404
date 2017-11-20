Given /^Update title by home page$/ do
  authorization_by_crm(DRIVER)
  DRIVER.get CommonSetting[:url_page_crm] + "/titles"
  sleep 1

  begin
    DRIVER.find_elements(:xpath, '//*[@class="table table-striped"]//tbody/tr/td/p[text()= "https://binomo.com/ru/"]//../../../tr/td[4]/a[2]').click
  rescue
  end
  
  begin
    DRIVER.find_elements(:xpath, '//*[@class="table table-striped"]//tbody/tr/td/p[text()= "https://binomo.com/ru/RU"]//../../../tr/td[4]/a[2]').click
  rescue
  end

  DRIVER.get CommonSetting[:url_page_crm] + "/titles/new"

  %w[EN RU ID MS ES TH VN CN PT TR PL RO ME KR IN UA KZ].each_with_index do |locale, num|
    sleep 0.1
    DRIVER.execute_script("$(\"a:contains(#{locale})\").click()")
    DRIVER.find_element(:id, "title_translations_attributes_#{num}_title").send_keys("Titles #{locale}")
    sleep 0.1
    DRIVER.find_element(:id, "title_translations_attributes_#{num}_url").send_keys(locale)
    sleep 0.1
    DRIVER.find_element(:id, "title_translations_attributes_#{num}_meta_keywords").send_keys("one, two, four")
    sleep 0.1
    DRIVER.find_element(:id, "title_translations_attributes_#{num}_meta_description").send_keys("description one, two, four")
  end

  DRIVER.find_elements(:css, ".btn-primary")[0].click
end
