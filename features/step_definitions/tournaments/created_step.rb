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

  DRIVER.get CommonSetting[:url_page_crm] + "/coupons/patterns/new?handler=bonus&scope=individual"

  sleep 1
  $list_currency = []

  DRIVER.find_elements(:css, 'strong').each do |text|
    $list_currency << text.text
  end

  DRIVER.get CommonSetting[:url_page_crm] + "tournaments/new"
  sleep 1
end


When /^Add data$/ do

    banner = File.join(Rails.root, './app/assets/images/bg.jpeg')
    DRIVER.find_element(:id, "tournament_banner_content").send_keys(banner)
    DRIVER.find_element(:id, "tournament_banner_preview").send_keys(banner)
    DRIVER.find_element(:id, "tournament_url").clear
    DRIVER.find_element(:id, "tournament_url").send_keys("url-tournament")

    DRIVER.find_element(:id, "tournament_registration_interval").clear
    DRIVER.find_element(:id, "tournament_registration_interval").send_keys("1500")
    DRIVER.find_element(:id, "tournament_initial_balance").clear
    DRIVER.find_element(:id, "tournament_initial_balance").send_keys("100")
    DRIVER.find_element(:id, "tournament_min_users_count").clear
    DRIVER.find_element(:id, "tournament_min_users_count").send_keys("0")
    DRIVER.find_element(:id, "tournament_rebuy").click
    DRIVER.find_element(:id, "tournament_rebuy_max_balance").clear
    DRIVER.find_element(:id, "tournament_rebuy_max_balance").send_keys("100")
    DRIVER.find_element(:id, "tournament_rebuy_amount").clear
    DRIVER.find_element(:id, "tournament_rebuy_amount").send_keys("10")

    DRIVER.execute_script("$('.fr-element.fr-view').text('Tournament for all locales')")
    DRIVER.execute_script("$(\"span:contains('activated')\").click()")


  %i[en ru].each_with_index do |locale, num|
  # %i[en ru id ms es th vn cn pt tr pl ro me kr in ua].each_with_index do |locale, num|
    num += 1
    DRIVER.execute_script("$('#new_tournament > div:nth-child(4) > div:nth-child(1) > ul > li:nth-child(#{num.to_i}) > a').click()") #en
    sleep 0.1
    DRIVER.find_element(:id, "tournament_content_#{locale}").send_keys("Tournaments #{locale.upcase}")
    DRIVER.find_element(:id, "tournament_name_#{locale}").clear
    DRIVER.find_element(:id, "tournament_name_#{locale}").send_keys("#{locale} " + "#{Time.now}")
  end

    count = $list_currency.count - 1
    (0..count).each do |num|
      DRIVER.find_element(:id, "tournament_participation_fees_attributes_#{num}_value").clear
      DRIVER.find_element(:id, "tournament_prize_fund_attributes_#{num}_value").clear
      DRIVER.find_element(:id, "tournament_rebuy_fees_attributes_#{num}_value").clear

      DRIVER.find_element(:id, "tournament_participation_fees_attributes_#{num}_value").send_keys("100")
      DRIVER.find_element(:id, "tournament_prize_fund_attributes_#{num}_value").send_keys("100")
      DRIVER.find_element(:id, "tournament_rebuy_fees_attributes_#{num}_value").send_keys("100")
    end
  # rescue

  sleep 1
end
