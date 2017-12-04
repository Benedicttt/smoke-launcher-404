Given /^Update all advises$/ do
  # authorization_by_crm(DRIVER)
  # DRIVER.get CommonSetting[:url_page_crm] + ""
  # sleep 1
  # DRIVER.find_elements(:css, ".btn-primary")[0].click

end


Given /^Create new mailer$/ do
  authorization_by_crm(DRIVER)
  %w[EN RU ID MS ES TH VN CN PT TR PL RO ME KR IN UA KZ].each_with_index do |locale, index|
    DRIVER.get CommonSetting[:url_page_crm] + "/sandbox/mailers/new"
    sleep 2
    DRIVER.execute_script("$('span:contains(\"#{locale.downcase}\")').click()")
    DRIVER.find_element(:id, "crm_mailer_name").send_keys("Mailer test #{locale}")
    DRIVER.find_element(:id, "crm_mailer_title").send_keys("Mailer test #{locale}")
    DRIVER.find_element(:id, "mailer_content").send_keys(DRIVER.find_element(:css, "p").text)
    DRIVER.find_element(:id, "crm_mailer_filters_ids").send_keys(User.where(stage_number: ENV['stage']).last.id)
    sleep 0.5
    DRIVER.find_elements(:css, ".btn-primary")[0].click
  end
end

Given /^Create new static$/ do
  authorization_by_crm(DRIVER)
  %w[EN RU ID MS ES TH VN CN PT TR PL RO ME KR IN UA KZ].each_with_index do |locale, index|
    DRIVER.get CommonSetting[:url_page_crm] + "/offers/new"
    sleep 2
    DRIVER.execute_script("$('span:contains(\"#{locale.downcase}\")').click()")
    DRIVER.find_element(:id, "offer_title").send_keys("Offers #{locale}")
    DRIVER.find_element(:id, "offer_header").send_keys("Offers #{locale}")
    DRIVER.find_element(:id, "offer_meta_keywords").send_keys("Offers, meta, #{locale}")
    DRIVER.find_element(:id, "offer_meta_description").send_keys("Offers desc #{locale}")

    DRIVER.execute_script("$('#offer_has_own_banner').prop('checked', true)")
    DRIVER.execute_script("$('#offer_published').prop('checked', true)")

    offer = File.absolute_path('./app/assets/images/asset.jpg')
    DRIVER.find_element(:id, "offer_banner").send_keys(offer)
    DRIVER.find_element(:id, "offer_pic_preview").send_keys(offer)
    DRIVER.find_element(:id, "offer_pic").send_keys(offer)

    date_now = Time.now
    date_to = Time.now.strftime("#{date_now.day + 1}.%m.%Y %H:%M:%S")
    DRIVER.find_element(:id, "offer_lead_start_at").send_keys(date_now)
    DRIVER.find_element(:id, "offer_lead_end_at").send_keys(date_to)

    DRIVER.find_element(:id, "offer_header").send_keys("Offers #{locale}")
    DRIVER.find_element(:id, "offer_url").send_keys("offers-#{locale}-smoke")
    3.times { |i| DRIVER.find_elements(:css, "div.fr-element")[i].send_keys("Preview offers #{locale}") }

    DRIVER.find_elements(:css, ".btn-primary")[0].click
  end
end
