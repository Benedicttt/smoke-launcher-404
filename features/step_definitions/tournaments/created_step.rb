Given /^Tournament$/ do
  DRIVER.get CommonSetting[:url_page_crm] + "tournaments/new"
  sleep 1
end

When /^Add data$/ do
  %i[en ru id ms es th vn cn pt tr pl me md kr].each_with_index do |locale, num|
    num += 1
    DRIVER.execute_script("$('#main-content > div > ul > li:nth-child(#{num.to_i}) > a').click()") #en

    banner = File.join(Rails.root, './app/assets/images/bg.jpeg')
    DRIVER.find_element(:id, "tournament_banner_content_#{locale}").send_keys(banner)
    DRIVER.find_element(:id, "tournament_banner_preview_#{locale}").send_keys(banner)

    DRIVER.find_element(:id, "tournament_name_#{locale}").clear
    DRIVER.find_element(:id, "tournament_name_#{locale}").send_keys("#{locale} " + "#{Time.now}")
    DRIVER.find_element(:id, "tournament_url_#{locale}").clear
    DRIVER.find_element(:id, "tournament_url_#{locale}").send_keys("url-tour-#{locale}")

    DRIVER.execute_script("$('.fr-element.fr-view').text('Tournament #{locale}')")
    DRIVER.execute_script("$(\"span:contains('activated')\").click()")
    DRIVER.execute_script("$('.bs-select-all').click()")
    DRIVER.find_element(:id, "tournament_configuration_deals_min_amount_USD").clear
    DRIVER.find_element(:id, "tournament_configuration_deals_min_amount_USD").send_keys('10')
    DRIVER.find_element(:id, "tournament_configuration_deals_min_amount_EUR").clear
    DRIVER.find_element(:id, "tournament_configuration_deals_min_amount_EUR").send_keys('10')
    DRIVER.find_element(:id, "tournament_configuration_deals_min_amount_RUB").clear
    DRIVER.find_element(:id, "tournament_configuration_deals_min_amount_RUB").send_keys('100')
    DRIVER.find_element(:id, "tournament_count_winners").clear
    DRIVER.find_element(:id, "tournament_count_winners").send_keys('5')

    date_now = Time.now
    date_to = Time.now.strftime("#{date_now.day + 1}.%m.%Y %H:%M:%S")
    DRIVER.find_element(:id, 'tournament_date_to').clear
    DRIVER.find_element(:id, 'tournament_date_to').send_keys(date_to)
    DRIVER.find_element(:id, 'tournament_date_from').clear
    DRIVER.find_element(:id, 'tournament_date_from').send_keys(Time.now.strftime("#{date_now.day - 1}.%m.%Y %H:%M:%S"))
  end
end
