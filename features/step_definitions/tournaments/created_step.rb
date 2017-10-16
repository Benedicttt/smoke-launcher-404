Given /^Tournament$/ do
  DRIVER.get(CommonSetting[:url_page_crm])
  sleep 1
  if DRIVER.current_url === CommonSetting[:url_page_crm] + "login"
    retried_process(3, 3) do
      DRIVER.find_element(:id, "email").send_keys(CommonSetting[:user_crm]['login'])
      DRIVER.find_element(:id, "password").send_keys(CommonSetting[:user_crm]['password'])
      DRIVER.find_element(:css, 'input[value="Sign in"]').click
    end
  end

  DRIVER.get CommonSetting[:url_page_crm] + "tournaments/new"
  sleep 1
end

When /^Add data$/ do
  %i[en ru id ms es th vn cn pt tr pl ro me kr in ua].each_with_index do |locale, num|
    num += 1
    DRIVER.execute_script("$('#main-content > div > ul > li:nth-child(#{num.to_i}) > a').click()") #en

    banner = File.join(Rails.root, './app/assets/images/bg.jpeg')
    DRIVER.find_element(:id, "tournament_banner_content_#{locale}").send_keys(banner)
    DRIVER.find_element(:id, "tournament_banner_preview_#{locale}").send_keys(banner)
    sleep 0.1
    DRIVER.find_element(:id, "tournament_name_#{locale}").clear
    DRIVER.find_element(:id, "tournament_name_#{locale}").send_keys("#{locale} " + "#{Time.now}")
    DRIVER.find_element(:id, "tournament_url_#{locale}").clear
    DRIVER.find_element(:id, "tournament_url_#{locale}").send_keys("url-tour-#{locale}")

    DRIVER.execute_script("$('.fr-element.fr-view').text('Tournament for all locales')")
    DRIVER.execute_script("$(\"span:contains('activated')\").click()")
    DRIVER.execute_script("$('.bs-select-all').click()")
    DRIVER.find_element(:id, "tournament_configuration_deals_min_amount_USD").clear
    DRIVER.find_element(:id, "tournament_configuration_deals_min_amount_USD").send_keys('10')
    DRIVER.find_element(:id, "tournament_configuration_deals_min_amount_EUR").clear
    DRIVER.find_element(:id, "tournament_configuration_deals_min_amount_EUR").send_keys('10')
    DRIVER.find_element(:id, "tournament_configuration_deals_min_amount_RUB").clear
    DRIVER.find_element(:id, "tournament_configuration_deals_min_amount_RUB").send_keys('100')
    DRIVER.find_element(:id, "tournament_configuration_deals_min_amount_KZT").clear
    DRIVER.find_element(:id, "tournament_configuration_deals_min_amount_KZT").send_keys('100')
    DRIVER.find_element(:id, "tournament_configuration_deals_min_amount_CNY").clear
    DRIVER.find_element(:id, "tournament_configuration_deals_min_amount_CNY").send_keys('10')
    DRIVER.find_element(:id, "tournament_configuration_deals_min_amount_TRY").clear
    DRIVER.find_element(:id, "tournament_configuration_deals_min_amount_TRY").send_keys('10')
    DRIVER.find_element(:id, "tournament_configuration_deals_min_amount_INR").clear
    DRIVER.find_element(:id, "tournament_configuration_deals_min_amount_INR").send_keys('10')
    DRIVER.find_element(:id, "tournament_configuration_deals_min_amount_UAH").clear
    DRIVER.find_element(:id, "tournament_configuration_deals_min_amount_UAH").send_keys('10')
    DRIVER.find_element(:id, "tournament_count_winners").clear
    DRIVER.find_element(:id, "tournament_count_winners").send_keys('10')
  end
end
